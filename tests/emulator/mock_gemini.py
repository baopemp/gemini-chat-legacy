# Minimal mock of POST /v1beta/models/{model}:generateContent for emulator tests.
# Logs every request (path, api-key header, body) to requests.log and answers by prompt keyword.
import json, http.server, sys, time
LOG = sys.argv[1] if len(sys.argv) > 1 else "requests.log"
BUSY = 0
REPLY = [0]
class H(http.server.BaseHTTPRequestHandler):
    def do_POST(self):
        n = int(self.headers.get("Content-Length", 0)); body = self.rfile.read(n).decode("utf-8")
        rec = {"path": self.path, "key": self.headers.get("x-goog-api-key"), "ctype": self.headers.get("Content-Type"), "body": json.loads(body)}
        with open(LOG, "a") as f: f.write(json.dumps(rec) + "\n")
        lastparts = rec["body"]["contents"][-1]["parts"]
        last = next((p["text"] for p in lastparts if "text" in p), "").lower()
        global BUSY
        if "busy" in last and BUSY < 2:
            BUSY += 1
            out = json.dumps({"error": {"code": 503, "message": "This model is currently experiencing high demand. (mock %d)" % BUSY, "status": "UNAVAILABLE"}}).encode()
            self.send_response(503); self.send_header("Content-Type", "application/json"); self.send_header("Content-Length", str(len(out))); self.end_headers(); self.wfile.write(out); return
        if "short title" in last:
            out = json.dumps({"candidates": [{"content": {"role": "model", "parts": [{"text": "**\"Mock Chat Title.\"**"}]}, "finishReason": "STOP"}]}).encode()
            self.send_response(200); self.send_header("Content-Type", "application/json"); self.send_header("Content-Length", str(len(out))); self.end_headers(); self.wfile.write(out); return
        if "slow" in last:
            time.sleep(25)
        if rec["key"] != "TESTKEY":
            code, resp = 400, {"error": {"code": 400, "message": "API key not valid. Please pass a valid API key.", "status": "INVALID_ARGUMENT"}}
        elif "markdown" in last:
            code, resp = 200, {"candidates": [{"content": {"role": "model", "parts": [{"text": open("markdown_sample.md", encoding="utf-8").read()}]}, "finishReason": "STOP"}]}
        elif "emojitest" in last:
            txt = ("Emoji 16-18: \U0001FAE9 \U0001FAC6 \U0001FABE \U0001FADC \U0001FA89 \U0001FA8F \U0001FADF \U0001F1E8\U0001F1F6 \U0001FAEB \U0001F6D9\n"
                   "Flags: \U0001F3F4\U000E0067\U000E0062\U000E0065\U000E006E\U000E0067\U000E007F \U0001F1FB\U0001F1F3 \U0001F1EF\U0001F1F5\n"
                   "Tones: \U0001F44D\U0001F3FD \U0001FAF6\U0001F3FF \U0001F44B\U0001F3FB\n"
                   "ZWJ: \U0001F468\u200d\U0001F469\u200d\U0001F467 \U0001F9D1\U0001F3FC\u200d\u2764\ufe0f\u200d\U0001F9D1\U0001F3FE \U0001F3F3\ufe0f\u200d\U0001F308\n"
                   "Keycaps: 1\ufe0f\u20e3 #\ufe0f\u20e3 but plain 12 and #hashtag stay\n"
                   "Text-style: \u2764 \u2714 \u00a9 and classics \U0001F602\U0001F389\U0001F525\U0001F64F\u2705\U0001F4AF\n\n"
                   "| A | B |\n|---|---|\n| 1 | 2 |\n| 3 | 4 |")
            code, resp = 200, {"candidates": [{"content": {"role": "model", "parts": [{"text": txt}]}, "finishReason": "STOP"}]}
        elif "math" in last:
            txt = ("Since $17 \\times 23 = 391$, it is not prime. Area: $A = \\pi r^2$, $\\sqrt{2} \\approx 1.414$, "
                   "$\\frac{a+b}{2} \\le x^{10}$, angle $90^\\circ$, $\\alpha \\ne \\beta$, $x \\to \\infty$, "
                   "$\\sum_{i=1}^{n} i$, $a \\in A \\cup B$, $p \\Rightarrow q$.\n\nPrices stay: $5 and $10, $0.05 + $1.05.\n\n$$E = mc^2$$")
            code, resp = 200, {"candidates": [{"content": {"role": "model", "parts": [{"text": txt}]}, "finishReason": "STOP"}]}
        elif "blockme" in last:
            code, resp = 200, {"promptFeedback": {"blockReason": "SAFETY"}}
        elif "thought" in last:
            code, resp = 200, {"candidates": [{"content": {"role": "model", "parts": [{"text": "secret thoughts", "thought": True}, {"text": "Visible **answer** with emoji \U0001F600 and Vietnamese: Xin chào", "thoughtSignature": "sig"}]}, "finishReason": "STOP"}]}
        else:
            n_img = sum(1 for c in rec["body"]["contents"] for p in c["parts"] if "inlineData" in p)
            cs = rec["body"]["contents"]
            prev_model = next((p.get("text", "") for c in reversed(cs) if c["role"] == "model" for p in c["parts"]), "-")
            REPLY[0] += 1
            info = "reply #%d: turns=%d images=%d last_user=%r prev_model=%r" % (REPLY[0], len(cs), n_img, last[:40], prev_model[:40])
            code, resp = 200, {"candidates": [{"content": {"role": "model", "parts": [{"text": info}]}, "finishReason": "STOP"}]}
        if ":streamGenerateContent" in self.path and code == 200:
            # SSE: thought summaries first (when asked for and the prompt says "think"), then the answer in pieces
            tc = rec["body"].get("generationConfig", {}).get("thinkingConfig", {})
            events = []
            if tc.get("includeThoughts") and "think" in last:
                for t in ["**Reading the question**\n\nThe user wants a mock answer. ", "Considering the level: %s. " % tc.get("thinkingLevel", "default"), "**Planning**\n\nKeep it short."]:
                    events.append({"candidates": [{"content": {"role": "model", "parts": [{"text": t, "thought": True}]}}]})
            parts = resp.get("candidates", [{}])[0].get("content", {}).get("parts", [])
            full = "".join(p.get("text", "") for p in parts if not p.get("thought"))
            words = full.split(" ")
            for i in range(0, len(words), 3):
                events.append({"candidates": [{"content": {"role": "model", "parts": [{"text": " ".join(words[i:i+3]) + (" " if i + 3 < len(words) else "")}]}}]})
            if "candidates" in resp:
                events[-1]["candidates"][0]["finishReason"] = resp["candidates"][0].get("finishReason", "STOP")
            else:
                events = [resp]
            self.send_response(200); self.send_header("Content-Type", "text/event-stream"); self.end_headers()
            for ev in events:
                self.wfile.write(("data: " + json.dumps(ev) + "\r\n\r\n").encode()); self.wfile.flush(); time.sleep(0.6)
            return
        out = json.dumps(resp).encode(); self.send_response(code)
        self.send_header("Content-Type", "application/json; charset=UTF-8"); self.send_header("Content-Length", str(len(out))); self.end_headers(); self.wfile.write(out)
    def log_message(self, *a): pass
http.server.ThreadingHTTPServer(("0.0.0.0", 8765), H).serve_forever()
