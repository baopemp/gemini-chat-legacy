# Mock of the Gemini Live API (BidiGenerateContent) for emulator UI tests. ws://0.0.0.0:8766/<anything>
# Conversation models: setup -> setupComplete; text or (activityStart, audio..., activityEnd / audioStreamEnd) -> transcript +
#   3 s of 24 kHz PCM tone (word-by-word output transcription, first chunk odd-sized) + turnComplete + a resumption handle.
#   Text containing "goaway": goAway, then the server closes the connection 1 s later (tests automatic resumption).
#   A session started with sessionResumption.handle answers "(resumed)".
# Hands-free sessions are answered after every 30 audio chunks (simulated voice detection).
# Transcriber (model contains "transcribe"): interim text every 5 audio chunks while audio arrives, final on audioStreamEnd.
# Logs every client message with a timestamp (audio data shortened) to live_requests.log.
import asyncio, base64, json, math, sys, time, websockets

LOG = sys.argv[1] if len(sys.argv) > 1 else "live_requests.log"

def log(o):
    with open(LOG, "a") as f:
        f.write("%.2f " % time.time() + json.dumps(o)[:600] + "\n")

def tone(ms, freq=440, rate=24000):
    n = rate * ms // 1000
    return b"".join(int(6000 * math.sin(2 * math.pi * freq * i / rate)).to_bytes(2, "little", signed=True) for i in range(n))

async def reply(ws, heard, words, n):
    if heard:
        await ws.send(json.dumps({"serverContent": {"inputTranscription": {"text": heard}}}))
    log({"server": "reply start"})
    pcm = tone(3000)
    parts = words.split(" ")
    step = len(pcm) // len(parts) // 2 * 2
    for i, w in enumerate(parts):
        chunk = pcm[i * step:(i + 1) * step]
        await ws.send(json.dumps({"serverContent": {"modelTurn": {"parts": [{"inlineData": {"mimeType": "audio/pcm;rate=24000", "data": base64.b64encode(chunk[:-1] if i == 0 else chunk).decode()}}]}}}))
        await ws.send(json.dumps({"serverContent": {"outputTranscription": {"text": w + " "}}}))
        await asyncio.sleep(0.05)
    await ws.send(json.dumps({"serverContent": {"generationComplete": True}}))
    await ws.send(json.dumps({"serverContent": {"turnComplete": True}}))
    await ws.send(json.dumps({"sessionResumptionUpdate": {"newHandle": "mock-handle-%d" % n, "resumable": True}}))
    log({"server": "reply sent"})

async def transcriber(ws):
    chunks = 0
    words = ["mock", "words", "while", "you", "talk", "into", "the", "box"]
    async for raw in ws:
        m = json.loads(raw)
        ri = m.get("realtimeInput", {})
        if "audio" in ri:
            chunks += 1
            if chunks % 5 == 0:
                k = min(len(words), chunks // 5)
                await ws.send(json.dumps({"serverContent": {"interimInputTranscription": {"text": " ".join(words[:k])}}}))
        elif "audioStreamEnd" in ri and chunks:
            k = min(len(words), max(1, chunks // 5))
            await ws.send(json.dumps({"serverContent": {"inputTranscription": {"text": " ".join(words[:k]) + "."}}}))
            chunks = 0

async def handler(ws):
    audio_bytes = 0
    n = 0
    first = json.loads(await ws.recv())
    log(first)
    setup = first.get("setup", {})
    if "BADMODEL" in setup.get("model", ""):
        await ws.close(1008, "models/BADMODEL is not found for API version v1beta")
        return
    await ws.send(json.dumps({"setupComplete": {}}))
    if "transcribe" in setup.get("model", ""):
        await transcriber(ws)
        return
    resumed = "handle" in setup.get("sessionResumption", {})
    # hands-free (server voice detection): answer after every 30 audio chunks (~3 s), like VAD at the end of speech
    vad = not setup.get("realtimeInputConfig", {}).get("automaticActivityDetection", {}).get("disabled", False)
    chunks = 0
    async for raw in ws:
        m = json.loads(raw)
        if "realtimeInput" in m and "audio" in m["realtimeInput"]:
            audio_bytes += len(base64.b64decode(m["realtimeInput"]["audio"]["data"]))
            m["realtimeInput"]["audio"]["data"] = "<%d chars>" % len(m["realtimeInput"]["audio"]["data"])
            chunks += 1
        log(m)
        if vad and chunks >= 30:
            chunks = 0; n += 1
            await reply(ws, "(mock VAD: %d bytes)" % audio_bytes, "Mock hands-free reply number %d." % n, n)
            audio_bytes = 0
            continue
        ri = m.get("realtimeInput", {})
        tag = " (resumed)" if resumed else ""
        if "text" in ri:
            n += 1
            if "goaway" in ri["text"].lower():
                await reply(ws, None, "Mock reply %d before goAway%s" % (n, tag), n)
                await ws.send(json.dumps({"goAway": {"timeLeft": "1s"}}))
                await asyncio.sleep(1.0)
                await ws.close(1000, "session time limit")
                return
            await reply(ws, None, "Mock live reply number %d to: %s%s" % (n, ri["text"], tag), n)
        elif "activityEnd" in ri or "audioStreamEnd" in ri:
            if audio_bytes:
                n += 1
                await reply(ws, "(mock heard %d bytes of mic audio)" % audio_bytes, "Mock live reply number %d to your speech%s." % (n, tag), n)
                audio_bytes = 0

async def main():
    async with websockets.serve(handler, "0.0.0.0", 8766, max_size=2**24):
        await asyncio.Future()

asyncio.run(main())
