.class public final Lcom/gemini/chat/Markdown;
.super Ljava/lang/Object;
.source "Markdown.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/gemini/chat/Markdown$Doc;,
        Lcom/gemini/chat/Markdown$Span;
    }
.end annotation


# static fields
.field public static final BOLD:I = 0x1

.field public static final BOLD_ITALIC:I = 0x3

.field public static final BULLET:I = 0xd

.field private static final BULLETS:[Ljava/lang/String;

.field public static final CODE:I = 0x5

.field public static final CODE_BLOCK:I = 0x8

.field public static final CODE_LANG:I = 0x9

.field public static final EMOJI:I = 0x10

.field public static final GAP:I = 0x16

.field static final GRID_MAX_WIDTH:I = 0x1e

.field public static final HEADING:I = 0x7

.field public static final IMAGE:I = 0x17

.field public static final ITALIC:I = 0x2

.field public static final LINK:I = 0x6

.field public static final LIST_CONT:I = 0xc

.field public static final LIST_ITEM:I = 0xb

.field public static final MUTED:I = 0x15

.field public static final QUOTE:I = 0xa

.field public static final RULE:I = 0xf

.field public static final STRIKE:I = 0x4

.field private static final SUP_FROM:Ljava/lang/String; = "123n"

.field private static final SUP_TO:Ljava/lang/String; = "\u00b9\u00b2\u00b3\u207f"

.field public static final TABLE_GRID:I = 0x11

.field public static final TABLE_HEAD:I = 0x12

.field public static final TABLE_KEY:I = 0x14

.field public static final TABLE_TITLE:I = 0x13

.field public static final TASK_DONE:I = 0xe

.field private static final TEX:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 427
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "\u2022"

    aput-object v1, v0, v2

    const-string v1, "\u25aa"

    aput-object v1, v0, v3

    const-string v1, "\u2013"

    aput-object v1, v0, v4

    sput-object v0, Lcom/gemini/chat/Markdown;->BULLETS:[Ljava/lang/String;

    .line 657
    const/16 v0, 0xda

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "alpha"

    aput-object v1, v0, v2

    const-string v1, "\u03b1"

    aput-object v1, v0, v3

    const-string v1, "beta"

    aput-object v1, v0, v4

    const-string v1, "\u03b2"

    aput-object v1, v0, v5

    const/4 v1, 0x4

    const-string v2, "gamma"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "\u03b3"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "delta"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "\u03b4"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "epsilon"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "\u03b5"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "varepsilon"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "\u03b5"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "zeta"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "\u03b6"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "eta"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "\u03b7"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "theta"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "\u03b8"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "vartheta"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "\u03b8"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "iota"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "\u03b9"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "kappa"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "\u03ba"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "lambda"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "\u03bb"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "mu"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "\u03bc"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "nu"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "\u03bd"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "xi"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "\u03be"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "pi"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "\u03c0"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "rho"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "\u03c1"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "sigma"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string v2, "\u03c3"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string v2, "tau"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string v2, "\u03c4"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string v2, "upsilon"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string v2, "\u03c5"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string v2, "phi"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string v2, "\u03c6"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string v2, "varphi"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string v2, "\u03c6"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string v2, "chi"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string v2, "\u03c7"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string v2, "psi"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string v2, "\u03c8"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string v2, "omega"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string v2, "\u03c9"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string v2, "Gamma"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string v2, "\u0393"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string v2, "Delta"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string v2, "\u0394"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string v2, "Theta"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string v2, "\u0398"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string v2, "Lambda"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string v2, "\u039b"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string v2, "Xi"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string v2, "\u039e"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string v2, "Pi"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string v2, "\u03a0"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string v2, "Sigma"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string v2, "\u03a3"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string v2, "Phi"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string v2, "\u03a6"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string v2, "Psi"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string v2, "\u03a8"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string v2, "Omega"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string v2, "\u03a9"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string v2, "times"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string v2, "\u00d7"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string v2, "div"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string v2, "\u00f7"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string v2, "cdot"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string v2, "\u00b7"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string v2, "pm"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    const-string v2, "\u00b1"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    const-string v2, "mp"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    const-string v2, "\u2213"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    const-string v2, "le"

    aput-object v2, v0, v1

    const/16 v1, 0x53

    const-string v2, "\u2264"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    const-string v2, "leq"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    const-string v2, "\u2264"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    const-string v2, "ge"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    const-string v2, "\u2265"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    const-string v2, "geq"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    const-string v2, "\u2265"

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    const-string v2, "ne"

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    const-string v2, "\u2260"

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    const-string v2, "neq"

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    const-string v2, "\u2260"

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    const-string v2, "approx"

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    const-string v2, "\u2248"

    aput-object v2, v0, v1

    const/16 v1, 0x60

    const-string v2, "equiv"

    aput-object v2, v0, v1

    const/16 v1, 0x61

    const-string v2, "\u2261"

    aput-object v2, v0, v1

    const/16 v1, 0x62

    const-string v2, "sim"

    aput-object v2, v0, v1

    const/16 v1, 0x63

    const-string v2, "~"

    aput-object v2, v0, v1

    const/16 v1, 0x64

    const-string v2, "propto"

    aput-object v2, v0, v1

    const/16 v1, 0x65

    const-string v2, "\u221d"

    aput-object v2, v0, v1

    const/16 v1, 0x66

    const-string v2, "infty"

    aput-object v2, v0, v1

    const/16 v1, 0x67

    const-string v2, "\u221e"

    aput-object v2, v0, v1

    const/16 v1, 0x68

    const-string v2, "to"

    aput-object v2, v0, v1

    const/16 v1, 0x69

    const-string v2, "\u2192"

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    const-string v2, "rightarrow"

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    const-string v2, "\u2192"

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    const-string v2, "leftarrow"

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    const-string v2, "\u2190"

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    const-string v2, "leftrightarrow"

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    const-string v2, "\u2194"

    aput-object v2, v0, v1

    const/16 v1, 0x70

    const-string v2, "Rightarrow"

    aput-object v2, v0, v1

    const/16 v1, 0x71

    const-string v2, "\u21d2"

    aput-object v2, v0, v1

    const/16 v1, 0x72

    const-string v2, "implies"

    aput-object v2, v0, v1

    const/16 v1, 0x73

    const-string v2, "\u21d2"

    aput-object v2, v0, v1

    const/16 v1, 0x74

    const-string v2, "Leftrightarrow"

    aput-object v2, v0, v1

    const/16 v1, 0x75

    const-string v2, "\u21d4"

    aput-object v2, v0, v1

    const/16 v1, 0x76

    const-string v2, "iff"

    aput-object v2, v0, v1

    const/16 v1, 0x77

    const-string v2, "\u21d4"

    aput-object v2, v0, v1

    const/16 v1, 0x78

    const-string v2, "in"

    aput-object v2, v0, v1

    const/16 v1, 0x79

    const-string v2, "\u2208"

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    const-string v2, "notin"

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    const-string v2, "\u2209"

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    const-string v2, "subset"

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    const-string v2, "\u2282"

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    const-string v2, "subseteq"

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    const-string v2, "\u2286"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    const-string v2, "cup"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    const-string v2, "\u222a"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    const-string v2, "cap"

    aput-object v2, v0, v1

    const/16 v1, 0x83

    const-string v2, "\u2229"

    aput-object v2, v0, v1

    const/16 v1, 0x84

    const-string v2, "emptyset"

    aput-object v2, v0, v1

    const/16 v1, 0x85

    const-string v2, "\u2205"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    const-string v2, "forall"

    aput-object v2, v0, v1

    const/16 v1, 0x87

    const-string v2, "\u2200"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    const-string v2, "exists"

    aput-object v2, v0, v1

    const/16 v1, 0x89

    const-string v2, "\u2203"

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    const-string v2, "partial"

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    const-string v2, "\u2202"

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    const-string v2, "nabla"

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    const-string v2, "\u2207"

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    const-string v2, "sum"

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    const-string v2, "\u2211"

    aput-object v2, v0, v1

    const/16 v1, 0x90

    const-string v2, "prod"

    aput-object v2, v0, v1

    const/16 v1, 0x91

    const-string v2, "\u220f"

    aput-object v2, v0, v1

    const/16 v1, 0x92

    const-string v2, "int"

    aput-object v2, v0, v1

    const/16 v1, 0x93

    const-string v2, "\u222b"

    aput-object v2, v0, v1

    const/16 v1, 0x94

    const-string v2, "degree"

    aput-object v2, v0, v1

    const/16 v1, 0x95

    const-string v2, "\u00b0"

    aput-object v2, v0, v1

    const/16 v1, 0x96

    const-string v2, "circ"

    aput-object v2, v0, v1

    const/16 v1, 0x97

    const-string v2, "\u00b0"

    aput-object v2, v0, v1

    const/16 v1, 0x98

    const-string v2, "angle"

    aput-object v2, v0, v1

    const/16 v1, 0x99

    const-string v2, "\u2220"

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    const-string v2, "ldots"

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    const-string v2, "\u2026"

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    const-string v2, "dots"

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    const-string v2, "\u2026"

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    const-string v2, "cdots"

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    const-string v2, "\u2026"

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    const-string v2, "perp"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    const-string v2, "\u22a5"

    aput-object v2, v0, v1

    const/16 v1, 0xa2

    const-string v2, "parallel"

    aput-object v2, v0, v1

    const/16 v1, 0xa3

    const-string v2, "\u2225"

    aput-object v2, v0, v1

    const/16 v1, 0xa4

    const-string v2, "neg"

    aput-object v2, v0, v1

    const/16 v1, 0xa5

    const-string v2, "\u00ac"

    aput-object v2, v0, v1

    const/16 v1, 0xa6

    const-string v2, "land"

    aput-object v2, v0, v1

    const/16 v1, 0xa7

    const-string v2, "\u2227"

    aput-object v2, v0, v1

    const/16 v1, 0xa8

    const-string v2, "lor"

    aput-object v2, v0, v1

    const/16 v1, 0xa9

    const-string v2, "\u2228"

    aput-object v2, v0, v1

    const/16 v1, 0xaa

    const-string v2, "mid"

    aput-object v2, v0, v1

    const/16 v1, 0xab

    const-string v2, "|"

    aput-object v2, v0, v1

    const/16 v1, 0xac

    const-string v2, "quad"

    aput-object v2, v0, v1

    const/16 v1, 0xad

    const-string v2, "  "

    aput-object v2, v0, v1

    const/16 v1, 0xae

    const-string v2, "qquad"

    aput-object v2, v0, v1

    const/16 v1, 0xaf

    const-string v2, "    "

    aput-object v2, v0, v1

    const/16 v1, 0xb0

    const-string v2, "lfloor"

    aput-object v2, v0, v1

    const/16 v1, 0xb1

    const-string v2, "\u230a"

    aput-object v2, v0, v1

    const/16 v1, 0xb2

    const-string v2, "rfloor"

    aput-object v2, v0, v1

    const/16 v1, 0xb3

    const-string v2, "\u230b"

    aput-object v2, v0, v1

    const/16 v1, 0xb4

    const-string v2, "lceil"

    aput-object v2, v0, v1

    const/16 v1, 0xb5

    const-string v2, "\u2308"

    aput-object v2, v0, v1

    const/16 v1, 0xb6

    const-string v2, "rceil"

    aput-object v2, v0, v1

    const/16 v1, 0xb7

    const-string v2, "\u2309"

    aput-object v2, v0, v1

    const/16 v1, 0xb8

    const-string v2, "langle"

    aput-object v2, v0, v1

    const/16 v1, 0xb9

    const-string v2, "\u27e8"

    aput-object v2, v0, v1

    const/16 v1, 0xba

    const-string v2, "rangle"

    aput-object v2, v0, v1

    const/16 v1, 0xbb

    const-string v2, "\u27e9"

    aput-object v2, v0, v1

    const/16 v1, 0xbc

    const-string v2, "log"

    aput-object v2, v0, v1

    const/16 v1, 0xbd

    const-string v2, "log"

    aput-object v2, v0, v1

    const/16 v1, 0xbe

    const-string v2, "ln"

    aput-object v2, v0, v1

    const/16 v1, 0xbf

    const-string v2, "ln"

    aput-object v2, v0, v1

    const/16 v1, 0xc0

    const-string v2, "sin"

    aput-object v2, v0, v1

    const/16 v1, 0xc1

    const-string v2, "sin"

    aput-object v2, v0, v1

    const/16 v1, 0xc2

    const-string v2, "cos"

    aput-object v2, v0, v1

    const/16 v1, 0xc3

    const-string v2, "cos"

    aput-object v2, v0, v1

    const/16 v1, 0xc4

    const-string v2, "tan"

    aput-object v2, v0, v1

    const/16 v1, 0xc5

    const-string v2, "tan"

    aput-object v2, v0, v1

    const/16 v1, 0xc6

    const-string v2, "lim"

    aput-object v2, v0, v1

    const/16 v1, 0xc7

    const-string v2, "lim"

    aput-object v2, v0, v1

    const/16 v1, 0xc8

    const-string v2, "max"

    aput-object v2, v0, v1

    const/16 v1, 0xc9

    const-string v2, "max"

    aput-object v2, v0, v1

    const/16 v1, 0xca

    const-string v2, "min"

    aput-object v2, v0, v1

    const/16 v1, 0xcb

    const-string v2, "min"

    aput-object v2, v0, v1

    const/16 v1, 0xcc

    const-string v2, "exp"

    aput-object v2, v0, v1

    const/16 v1, 0xcd

    const-string v2, "exp"

    aput-object v2, v0, v1

    const/16 v1, 0xce

    const-string v2, "mod"

    aput-object v2, v0, v1

    const/16 v1, 0xcf

    const-string v2, "mod"

    aput-object v2, v0, v1

    const/16 v1, 0xd0

    const-string v2, "gcd"

    aput-object v2, v0, v1

    const/16 v1, 0xd1

    const-string v2, "gcd"

    aput-object v2, v0, v1

    const/16 v1, 0xd2

    const-string v2, "left"

    aput-object v2, v0, v1

    const/16 v1, 0xd3

    const-string v2, ""

    aput-object v2, v0, v1

    const/16 v1, 0xd4

    const-string v2, "right"

    aput-object v2, v0, v1

    const/16 v1, 0xd5

    const-string v2, ""

    aput-object v2, v0, v1

    const/16 v1, 0xd6

    const-string v2, "displaystyle"

    aput-object v2, v0, v1

    const/16 v1, 0xd7

    const-string v2, ""

    aput-object v2, v0, v1

    const/16 v1, 0xd8

    const-string v2, "limits"

    aput-object v2, v0, v1

    const/16 v1, 0xd9

    const-string v2, ""

    aput-object v2, v0, v1

    sput-object v0, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    return-void
.end method

.method static appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V
    .locals 7

    .prologue
    const/16 v6, 0x3a

    .line 915
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 916
    const/4 v0, 0x0

    .line 917
    :goto_0
    if-ge v0, v1, :cond_2

    .line 918
    invoke-static {p1, v0}, Lcom/gemini/chat/EmojiMap;->matchAt(Ljava/lang/CharSequence;I)I

    move-result v2

    .line 919
    if-lez v2, :cond_0

    .line 920
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v3

    .line 921
    iget-object v4, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1, v0, v2}, Lcom/gemini/chat/EmojiMap;->nameAt(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 922
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v4

    const/16 v5, 0x10

    invoke-virtual {p0, v3, v4, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 923
    add-int/2addr v0, v2

    .line 924
    goto :goto_0

    .line 926
    :cond_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 927
    invoke-static {v2}, Lcom/gemini/chat/EmojiMap;->isInvisible(C)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 928
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 929
    goto :goto_0

    .line 930
    :cond_2
    return-void
.end method

.method private static blocks(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)V
    .locals 4

    .prologue
    .line 110
    .line 111
    :goto_0
    if-ge p2, p3, :cond_7

    .line 112
    aget-object v0, p1, p2

    .line 113
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 115
    add-int/lit8 p2, p2, 0x1

    .line 116
    goto :goto_0

    .line 118
    :cond_0
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->fenceLen(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_1

    .line 119
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->codeBlock(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    :goto_1
    move p2, v0

    .line 139
    goto :goto_0

    .line 120
    :cond_1
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->headingLevel(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_2

    .line 121
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->heading(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 122
    add-int/lit8 v0, p2, 0x1

    goto :goto_1

    .line 123
    :cond_2
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isRule(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 124
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 125
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    .line 126
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 127
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    const/16 v2, 0xf

    invoke-virtual {p0, v0, v1, v2}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 128
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 129
    add-int/lit8 v0, p2, 0x1

    .line 130
    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_4

    .line 131
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->quote(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 132
    :cond_4
    const/16 v2, 0x7c

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_5

    add-int/lit8 v1, p2, 0x1

    if-ge v1, p3, :cond_5

    add-int/lit8 v1, p2, 0x1

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isTableSep(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 133
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->table(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 134
    :cond_5
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v0

    if-eqz v0, :cond_6

    .line 135
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->list(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 137
    :cond_6
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->paragraph(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 140
    :cond_7
    return-void
.end method

.method private static canOpen(Ljava/lang/String;IIC)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 813
    add-int v1, p1, p2

    .line 814
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 816
    :cond_0
    :goto_0
    return v0

    .line 815
    :cond_1
    const/16 v1, 0x5f

    if-ne p3, v1, :cond_2

    if-lez p1, :cond_2

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isWordChar(C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 816
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private static cells(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v8, 0x7c

    const/4 v2, 0x0

    .line 285
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 286
    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 287
    :cond_0
    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "\\|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 288
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 289
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v2

    .line 290
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 291
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 292
    const/16 v6, 0x5c

    if-ne v5, v6, :cond_2

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_2

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v8, :cond_2

    .line 293
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 294
    add-int/lit8 v1, v1, 0x1

    .line 290
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 295
    :cond_2
    if-ne v5, v8, :cond_3

    .line 296
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 297
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_1

    .line 299
    :cond_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 302
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 303
    return-object v3
.end method

.method private static codeBlock(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 11

    .prologue
    .line 212
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 213
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->fenceLen(Ljava/lang/String;)I

    move-result v3

    .line 214
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 215
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 216
    aget-object v0, p1, p2

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 217
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    add-int/lit8 v1, p2, 0x1

    .line 219
    const/4 v0, 0x1

    move v2, v0

    .line 220
    :goto_0
    if-ge v1, p3, :cond_1

    .line 221
    aget-object v0, p1, v1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 222
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v3, :cond_4

    const/4 v0, 0x0

    invoke-virtual {v8, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v4, :cond_4

    .line 223
    const/4 v0, 0x0

    .line 224
    :goto_1
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v0, v9, :cond_0

    invoke-virtual {v8, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v4, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 225
    :cond_0
    if-lt v0, v3, :cond_4

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v0, v8, :cond_4

    .line 235
    :cond_1
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 236
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    .line 237
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 238
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 239
    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v3

    const/16 v4, 0x9

    invoke-virtual {p0, v2, v3, v4}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 241
    iget-object v2, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 243
    :cond_2
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 244
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 245
    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 246
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v3

    const/16 v4, 0x8

    invoke-virtual {p0, v2, v3, v4}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 247
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    const/16 v3, 0x8

    invoke-virtual {p0, v0, v2, v3}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 248
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->codeBlocks:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 249
    if-ge v1, p3, :cond_7

    add-int/lit8 v0, v1, 0x1

    :goto_2
    return v0

    .line 227
    :cond_4
    aget-object v8, p1, v1

    .line 229
    const/4 v0, 0x0

    .line 230
    :goto_3
    if-ge v0, v6, :cond_5

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v0, v9, :cond_5

    invoke-virtual {v8, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x20

    if-ne v9, v10, :cond_5

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 231
    :cond_5
    if-nez v2, :cond_6

    const/16 v2, 0xa

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 232
    :cond_6
    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    const/4 v0, 0x0

    .line 220
    add-int/lit8 v1, v1, 0x1

    move v2, v0

    goto/16 :goto_0

    :cond_7
    move v0, v1

    .line 249
    goto :goto_2
.end method

.method private static count(Ljava/lang/String;IIC)I
    .locals 2

    .prologue
    .line 787
    const/4 v0, 0x0

    .line 788
    :goto_0
    if-ge p1, p2, :cond_1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, p3, :cond_0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 789
    :cond_1
    return v0
.end method

.method private static fenceLen(Ljava/lang/String;)I
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/16 v4, 0x60

    const/4 v1, 0x0

    .line 201
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v5, :cond_1

    .line 208
    :cond_0
    :goto_0
    return v1

    .line 202
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 203
    if-eq v2, v4, :cond_2

    const/16 v0, 0x7e

    if-ne v2, v0, :cond_0

    :cond_2
    move v0, v1

    .line 205
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v2, :cond_3

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 206
    :cond_3
    if-lt v0, v5, :cond_0

    .line 207
    if-ne v2, v4, :cond_4

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-gez v2, :cond_0

    :cond_4
    move v1, v0

    .line 208
    goto :goto_0
.end method

.method private static findBacktickRun(Ljava/lang/String;II)I
    .locals 2

    .prologue
    const/16 v1, 0x60

    .line 799
    .line 800
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 801
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_1

    .line 802
    invoke-static {p0, p1, v1}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v0

    .line 803
    if-ne v0, p2, :cond_0

    .line 809
    :goto_1
    return p1

    .line 804
    :cond_0
    add-int/2addr p1, v0

    .line 805
    goto :goto_0

    .line 806
    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 809
    :cond_2
    const/4 p1, -0x1

    goto :goto_1
.end method

.method private static findCloser(Ljava/lang/String;ICI)I
    .locals 8

    .prologue
    const/16 v7, 0x60

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 821
    .line 822
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    move v0, p1

    .line 823
    :goto_0
    if-ge v0, v5, :cond_9

    .line 824
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 825
    const/16 v4, 0x5c

    if-ne v1, v4, :cond_0

    .line 826
    add-int/lit8 v0, v0, 0x2

    .line 827
    goto :goto_0

    .line 829
    :cond_0
    if-ne v1, v7, :cond_2

    .line 830
    invoke-static {p0, v0, v7}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v1

    .line 831
    add-int v4, v0, v1

    invoke-static {p0, v4, v1}, Lcom/gemini/chat/Markdown;->findBacktickRun(Ljava/lang/String;II)I

    move-result v4

    .line 832
    if-ltz v4, :cond_1

    add-int v0, v4, v1

    goto :goto_0

    :cond_1
    add-int/2addr v0, v1

    goto :goto_0

    .line 835
    :cond_2
    if-ne v1, p2, :cond_8

    .line 836
    invoke-static {p0, v0, p2}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v6

    .line 837
    if-le v0, p1, :cond_4

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v1

    if-nez v1, :cond_4

    move v4, v3

    .line 838
    :goto_1
    const/16 v1, 0x5f

    if-ne p2, v1, :cond_3

    add-int v1, v0, v6

    if-ge v1, v5, :cond_3

    add-int v1, v0, v6

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isWordChar(C)Z

    move-result v1

    if-nez v1, :cond_5

    :cond_3
    move v1, v3

    .line 839
    :goto_2
    if-ne v6, p3, :cond_6

    if-eqz v4, :cond_6

    if-eqz v1, :cond_6

    .line 846
    :goto_3
    return v0

    :cond_4
    move v4, v2

    .line 837
    goto :goto_1

    :cond_5
    move v1, v2

    .line 838
    goto :goto_2

    .line 840
    :cond_6
    if-le v6, p3, :cond_7

    if-eqz v4, :cond_7

    if-eqz v1, :cond_7

    const/16 v1, 0x7e

    if-eq p2, v1, :cond_7

    sub-int v1, v6, p3

    add-int/2addr v0, v1

    goto :goto_3

    .line 841
    :cond_7
    add-int/2addr v0, v6

    .line 842
    goto :goto_0

    .line 844
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 845
    goto :goto_0

    .line 846
    :cond_9
    const/4 v0, -0x1

    goto :goto_3
.end method

.method private static flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V
    .locals 1

    .prologue
    .line 907
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 908
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 909
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 911
    :cond_0
    return-void
.end method

.method private static hasInlineMarkup(Ljava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 307
    move v0, v1

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 308
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 309
    const/16 v3, 0x2a

    if-eq v2, v3, :cond_0

    const/16 v3, 0x5f

    if-eq v2, v3, :cond_0

    const/16 v3, 0x60

    if-eq v2, v3, :cond_0

    const/16 v3, 0x5b

    if-eq v2, v3, :cond_0

    const/16 v3, 0x7e

    if-eq v2, v3, :cond_0

    const/16 v3, 0x5c

    if-eq v2, v3, :cond_0

    const/16 v3, 0x2000

    if-le v2, v3, :cond_2

    :cond_0
    const/4 v1, 0x1

    .line 311
    :cond_1
    return v1

    .line 307
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static heading(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 173
    invoke-static {p1}, Lcom/gemini/chat/Markdown;->headingLevel(Ljava/lang/String;)I

    move-result v4

    .line 174
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 176
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 177
    :goto_0
    if-lez v1, :cond_0

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x23

    if-ne v2, v3, :cond_0

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 178
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    if-eqz v1, :cond_1

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_2

    :cond_1
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 179
    :cond_2
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 180
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 181
    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 182
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x7

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 183
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 184
    return-void
.end method

.method private static headingLevel(Ljava/lang/String;)I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 165
    move v0, v1

    .line 166
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x23

    if-ne v2, v3, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 167
    :cond_0
    if-eqz v0, :cond_1

    const/4 v2, 0x6

    if-le v0, v2, :cond_3

    :cond_1
    move v0, v1

    .line 169
    :cond_2
    :goto_1
    return v0

    .line 168
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v0, v2, :cond_2

    .line 169
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_2

    move v0, v1

    goto :goto_1
.end method

.method static inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V
    .locals 14

    .prologue
    const/16 v13, 0x60

    const/16 v12, 0x7e

    const/4 v8, 0x1

    const/4 v7, 0x2

    const/4 v4, 0x0

    .line 513
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 514
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    move v2, v4

    .line 516
    :goto_0
    if-ge v2, v10, :cond_19

    .line 517
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 518
    const/16 v0, 0x5c

    if-ne v3, v0, :cond_0

    add-int/lit8 v0, v2, 0x1

    if-ge v0, v10, :cond_0

    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->isPunct(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 519
    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 520
    add-int/lit8 v2, v2, 0x2

    .line 521
    goto :goto_0

    .line 523
    :cond_0
    if-ne v3, v13, :cond_4

    .line 524
    invoke-static {p1, v2, v13}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v1

    .line 525
    add-int v0, v2, v1

    invoke-static {p1, v0, v1}, Lcom/gemini/chat/Markdown;->findBacktickRun(Ljava/lang/String;II)I

    move-result v3

    .line 526
    if-ltz v3, :cond_2

    .line 527
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 528
    add-int v0, v2, v1

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 529
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v2, v7, :cond_1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v5, 0x20

    if-ne v2, v5, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v5, 0x20

    if-ne v2, v5, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 530
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 531
    :cond_1
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 532
    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 533
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/4 v5, 0x5

    invoke-virtual {p0, v2, v0, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 534
    add-int v2, v3, v1

    .line 535
    goto :goto_0

    :cond_2
    move v0, v4

    .line 536
    :goto_1
    if-ge v0, v1, :cond_3

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 537
    :cond_3
    add-int/2addr v2, v1

    .line 539
    goto/16 :goto_0

    .line 541
    :cond_4
    const/16 v0, 0x5b

    if-eq v3, v0, :cond_5

    const/16 v0, 0x21

    if-ne v3, v0, :cond_7

    add-int/lit8 v0, v2, 0x1

    if-ge v0, v10, :cond_7

    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5b

    if-ne v0, v1, :cond_7

    .line 542
    :cond_5
    invoke-static {p0, v9, p1, v2}, Lcom/gemini/chat/Markdown;->link(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;Ljava/lang/String;I)I

    move-result v6

    .line 543
    if-le v6, v2, :cond_6

    move v2, v6

    .line 545
    goto/16 :goto_0

    .line 547
    :cond_6
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 548
    add-int/lit8 v2, v2, 0x1

    .line 549
    goto/16 :goto_0

    .line 551
    :cond_7
    const/16 v0, 0x3c

    if-ne v3, v0, :cond_9

    const-string v0, "http://"

    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_8

    const-string v0, "https://"

    add-int/lit8 v1, v2, 0x1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 552
    :cond_8
    const/16 v0, 0x3e

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 553
    if-le v6, v2, :cond_9

    .line 554
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 555
    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 556
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 557
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x6

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 559
    add-int/lit8 v2, v6, 0x1

    .line 560
    goto/16 :goto_0

    .line 563
    :cond_9
    const/16 v0, 0x68

    if-ne v3, v0, :cond_e

    if-eqz v2, :cond_a

    add-int/lit8 v0, v2, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->isWordChar(C)Z

    move-result v0

    if-nez v0, :cond_e

    :cond_a
    const-string v0, "http://"

    .line 564
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "https://"

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_b
    move v0, v2

    .line 566
    :goto_2
    if-ge v0, v10, :cond_c

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v1

    if-nez v1, :cond_c

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v5, 0x3c

    if-eq v1, v5, :cond_c

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v5, 0x22

    if-eq v1, v5, :cond_c

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 568
    :cond_c
    :goto_3
    if-le v0, v2, :cond_d

    const-string v1, ".,;:!?\'"

    add-int/lit8 v5, v0, -0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_d

    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 569
    :cond_d
    if-le v0, v2, :cond_1a

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v5, 0x29

    if-ne v1, v5, :cond_1a

    const/16 v1, 0x28

    invoke-static {p1, v2, v0, v1}, Lcom/gemini/chat/Markdown;->count(Ljava/lang/String;IIC)I

    move-result v1

    const/16 v5, 0x29

    invoke-static {p1, v2, v0, v5}, Lcom/gemini/chat/Markdown;->count(Ljava/lang/String;IIC)I

    move-result v5

    if-ge v1, v5, :cond_1a

    add-int/lit8 v0, v0, -0x1

    move v6, v0

    .line 570
    :goto_4
    invoke-virtual {p1, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 571
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_e

    .line 572
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 573
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 574
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x6

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    move v2, v6

    .line 577
    goto/16 :goto_0

    .line 580
    :cond_e
    const/16 v0, 0x24

    if-ne v3, v0, :cond_f

    .line 581
    invoke-static {p1, v2}, Lcom/gemini/chat/Markdown;->mathAt(Ljava/lang/String;I)[I

    move-result-object v0

    .line 582
    if-eqz v0, :cond_f

    .line 583
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 584
    aget v1, v0, v4

    aget v2, v0, v8

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 585
    aget v2, v0, v7

    goto/16 :goto_0

    .line 589
    :cond_f
    const/16 v0, 0x2a

    if-eq v3, v0, :cond_10

    const/16 v0, 0x5f

    if-eq v3, v0, :cond_10

    if-ne v3, v12, :cond_18

    .line 590
    :cond_10
    invoke-static {p1, v2, v3}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v5

    .line 591
    if-ne v3, v12, :cond_11

    move v1, v7

    .line 592
    :goto_5
    if-ne v3, v12, :cond_12

    if-ge v5, v7, :cond_12

    .line 593
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 594
    add-int/lit8 v2, v2, 0x1

    .line 595
    goto/16 :goto_0

    .line 591
    :cond_11
    const/4 v0, 0x3

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    move v1, v0

    goto :goto_5

    .line 597
    :cond_12
    if-ne v5, v1, :cond_16

    invoke-static {p1, v2, v5, v3}, Lcom/gemini/chat/Markdown;->canOpen(Ljava/lang/String;IIC)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 598
    add-int v0, v2, v5

    invoke-static {p1, v0, v3, v1}, Lcom/gemini/chat/Markdown;->findCloser(Ljava/lang/String;ICI)I

    move-result v6

    .line 599
    add-int v0, v2, v5

    if-le v6, v0, :cond_16

    .line 600
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 601
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v11

    .line 602
    add-int v0, v2, v5

    invoke-virtual {p1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 603
    if-ne v3, v12, :cond_13

    const/4 v0, 0x4

    .line 604
    :goto_6
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    invoke-virtual {p0, v11, v2, v0}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 605
    add-int v2, v6, v1

    .line 606
    goto/16 :goto_0

    .line 603
    :cond_13
    if-ne v1, v8, :cond_14

    move v0, v7

    goto :goto_6

    :cond_14
    if-ne v1, v7, :cond_15

    move v0, v8

    goto :goto_6

    :cond_15
    const/4 v0, 0x3

    goto :goto_6

    :cond_16
    move v0, v4

    .line 609
    :goto_7
    if-ge v0, v5, :cond_17

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 610
    :cond_17
    add-int/2addr v2, v5

    .line 611
    goto/16 :goto_0

    .line 613
    :cond_18
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 614
    add-int/lit8 v2, v2, 0x1

    .line 615
    goto/16 :goto_0

    .line 616
    :cond_19
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 617
    return-void

    :cond_1a
    move v6, v0

    goto/16 :goto_4
.end method

.method private static isPunct(C)Z
    .locals 1

    .prologue
    .line 501
    const-string v0, "\\`*_{}[]()#+-.!|~<>\"\'$&%:;,/=?@^"

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isRule(Ljava/lang/String;)Z
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v1, 0x0

    .line 187
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v6, :cond_1

    .line 196
    :cond_0
    :goto_0
    return v1

    .line 188
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 189
    const/16 v0, 0x2d

    if-eq v3, v0, :cond_2

    const/16 v0, 0x2a

    if-eq v3, v0, :cond_2

    const/16 v0, 0x5f

    if-ne v3, v0, :cond_0

    :cond_2
    move v0, v1

    move v2, v1

    .line 191
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_5

    .line 192
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 193
    if-ne v4, v3, :cond_4

    add-int/lit8 v2, v2, 0x1

    .line 191
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 194
    :cond_4
    const/16 v5, 0x20

    if-eq v4, v5, :cond_3

    goto :goto_0

    .line 196
    :cond_5
    if-lt v2, v6, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static isSpace(C)Z
    .locals 1

    .prologue
    .line 505
    const/16 v0, 0x20

    if-eq p0, v0, :cond_0

    const/16 v0, 0x9

    if-eq p0, v0, :cond_0

    const/16 v0, 0xa

    if-eq p0, v0, :cond_0

    const/16 v0, 0xa0

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isTableSep(Ljava/lang/String;)Z
    .locals 8

    .prologue
    const/16 v7, 0x7c

    const/16 v6, 0x2d

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 275
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_1

    .line 281
    :cond_0
    :goto_0
    return v2

    .line 276
    :cond_1
    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_3

    move v0, v1

    :goto_1
    move v3, v2

    .line 277
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 278
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 279
    if-eq v4, v7, :cond_2

    if-eq v4, v6, :cond_2

    const/16 v5, 0x3a

    if-eq v4, v5, :cond_2

    const/16 v5, 0x20

    if-ne v4, v5, :cond_0

    .line 277
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    move v0, v2

    .line 276
    goto :goto_1

    .line 281
    :cond_4
    if-nez v0, :cond_5

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x3

    if-lt v0, v3, :cond_0

    :cond_5
    move v2, v1

    goto :goto_0
.end method

.method private static isWordChar(C)Z
    .locals 1

    .prologue
    .line 509
    invoke-static {p0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    return v0
.end method

.method private static leading(Ljava/lang/String;)I
    .locals 3

    .prologue
    .line 493
    const/4 v0, 0x0

    .line 494
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x20

    if-ne v1, v2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 495
    :cond_0
    return v0
.end method

.method private static link(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;Ljava/lang/String;I)I
    .locals 12

    .prologue
    const/16 v11, 0x5d

    const/16 v10, 0x28

    const/4 v8, 0x1

    const/4 v3, -0x1

    const/4 v4, 0x0

    .line 851
    invoke-virtual {p2, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x21

    if-ne v0, v1, :cond_1

    move v7, v8

    .line 852
    :goto_0
    if-eqz v7, :cond_2

    add-int/lit8 v0, p3, 0x1

    :goto_1
    move v1, v0

    move v2, v4

    .line 855
    :goto_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_f

    .line 856
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 857
    const/16 v6, 0x5c

    if-ne v5, v6, :cond_3

    .line 858
    add-int/lit8 v1, v1, 0x1

    .line 855
    :cond_0
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    move v7, v4

    .line 851
    goto :goto_0

    :cond_2
    move v0, p3

    .line 852
    goto :goto_1

    .line 861
    :cond_3
    const/16 v6, 0x5b

    if-ne v5, v6, :cond_4

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 862
    :cond_4
    if-ne v5, v11, :cond_0

    .line 863
    add-int/lit8 v2, v2, -0x1

    .line 864
    if-nez v2, :cond_0

    move v5, v1

    .line 870
    :goto_4
    if-ltz v5, :cond_5

    add-int/lit8 v1, v5, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_5

    add-int/lit8 v1, v5, 0x1

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-eq v1, v10, :cond_6

    .line 903
    :cond_5
    :goto_5
    return p3

    .line 873
    :cond_6
    add-int/lit8 v1, v5, 0x1

    move v2, v4

    :goto_6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_e

    .line 874
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 875
    if-ne v6, v10, :cond_8

    add-int/lit8 v2, v2, 0x1

    .line 873
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 876
    :cond_8
    const/16 v9, 0x29

    if-ne v6, v9, :cond_7

    .line 877
    add-int/lit8 v2, v2, -0x1

    .line 878
    if-nez v2, :cond_7

    move v6, v1

    .line 884
    :goto_7
    if-ltz v6, :cond_5

    .line 885
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 886
    add-int/lit8 v0, v5, 0x2

    invoke-virtual {p2, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 887
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 888
    if-lez v1, :cond_9

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 889
    :cond_9
    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v8, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object v5, v0

    .line 890
    :goto_8
    invoke-static {p0, p1}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 891
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 892
    if-eqz v7, :cond_b

    .line 893
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v3, "[Image"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 894
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_a

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 895
    :cond_a
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 896
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 897
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0x17

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 903
    :goto_9
    add-int/lit8 p3, v6, 0x1

    goto/16 :goto_5

    .line 899
    :cond_b
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 900
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    if-ne v0, v1, :cond_c

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 901
    :cond_c
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x6

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    goto :goto_9

    :cond_d
    move-object v5, v0

    goto :goto_8

    :cond_e
    move v6, v3

    goto/16 :goto_7

    :cond_f
    move v5, v3

    goto/16 :goto_4
.end method

.method private static list(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 12

    .prologue
    .line 430
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 431
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 433
    :goto_0
    if-ge p2, p3, :cond_f

    .line 434
    aget-object v1, p1, p2

    .line 435
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v4

    .line 436
    if-nez v4, :cond_2

    .line 437
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_f

    .line 439
    add-int/lit8 v0, p2, 0x1

    .line 440
    :goto_1
    if-ge v0, p3, :cond_0

    aget-object v1, p1, v0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 441
    :cond_0
    if-ge v0, p3, :cond_f

    aget-object v1, p1, v0

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v1

    if-nez v1, :cond_1

    aget-object v1, p1, v0

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->leading(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_f

    :cond_1
    move p2, v0

    .line 443
    goto :goto_0

    .line 448
    :cond_2
    const/4 v0, 0x0

    aget v10, v4, v0

    .line 449
    :goto_2
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-le v0, v10, :cond_3

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_2

    .line 450
    :cond_3
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, v10, :cond_5

    :cond_4
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    :cond_5
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v11, v0, -0x1

    .line 453
    const/4 v0, 0x2

    aget v0, v4, v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 455
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 456
    const/4 v0, 0x3

    aget v0, v4, v0

    const/4 v5, 0x1

    if-ne v0, v5, :cond_9

    .line 457
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x4

    aget v4, v4, v5

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "."

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 461
    :goto_3
    const-string v4, "[ ] "

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "[x] "

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "[X] "

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 462
    :cond_6
    const/4 v2, 0x1

    .line 463
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_a

    const/4 v1, 0x1

    .line 464
    :goto_4
    if-eqz v1, :cond_b

    const-string v0, "[x]"

    .line 465
    :goto_5
    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    move v6, v1

    move v4, v2

    move-object v7, v0

    move-object v8, v3

    .line 467
    :goto_6
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 468
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0xd

    if-eqz v4, :cond_c

    const/4 v4, 0x1

    :goto_7
    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 470
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 471
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    .line 472
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 473
    if-eqz v6, :cond_7

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0xe

    invoke-virtual {p0, v0, v2, v3}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 474
    :cond_7
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 475
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0xb

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move v4, v11

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 476
    add-int/lit8 v0, p2, 0x1

    move v6, v0

    .line 478
    :goto_8
    if-ge v6, p3, :cond_8

    .line 479
    aget-object v2, p1, v6

    .line 480
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {v2}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v0

    if-nez v0, :cond_8

    invoke-static {v2}, Lcom/gemini/chat/Markdown;->leading(Ljava/lang/String;)I

    move-result v0

    if-gt v0, v10, :cond_d

    :cond_8
    move p2, v6

    .line 488
    goto/16 :goto_0

    .line 459
    :cond_9
    sget-object v0, Lcom/gemini/chat/Markdown;->BULLETS:[Ljava/lang/String;

    sget-object v4, Lcom/gemini/chat/Markdown;->BULLETS:[Ljava/lang/String;

    array-length v4, v4

    rem-int v4, v11, v4

    aget-object v0, v0, v4

    goto/16 :goto_3

    .line 463
    :cond_a
    const/4 v1, 0x0

    goto/16 :goto_4

    .line 464
    :cond_b
    const-string v0, "[ ]"

    goto/16 :goto_5

    .line 469
    :cond_c
    const/4 v4, 0x0

    goto :goto_7

    .line 481
    :cond_d
    add-int/lit8 v0, v6, 0x1

    if-ge v0, p3, :cond_e

    add-int/lit8 v0, v6, 0x1

    aget-object v0, p1, v0

    :goto_9
    invoke-static {v2, v0}, Lcom/gemini/chat/Markdown;->startsBlock(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 482
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 483
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 484
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 485
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0xc

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move v4, v11

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 486
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    .line 487
    goto :goto_8

    .line 481
    :cond_e
    const/4 v0, 0x0

    goto :goto_9

    .line 489
    :cond_f
    return p2

    :cond_10
    move v6, v1

    move v4, v2

    move-object v7, v0

    move-object v8, v3

    goto/16 :goto_6
.end method

.method static listItem(Ljava/lang/String;)[I
    .locals 9

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/16 v6, 0x20

    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 400
    move v0, v1

    .line 401
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v6, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 402
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_1

    move-object v0, v4

    .line 424
    :goto_1
    return-object v0

    .line 403
    :cond_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 404
    const/16 v3, 0x2d

    if-eq v2, v3, :cond_2

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_2

    const/16 v3, 0x2b

    if-ne v2, v3, :cond_7

    .line 405
    :cond_2
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_6

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v6, :cond_6

    .line 406
    add-int/lit8 v2, v0, 0x2

    .line 407
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_3

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 408
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_4

    move-object v0, v4

    goto :goto_1

    .line 409
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/gemini/chat/Markdown;->isRule(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    move-object v0, v4

    goto :goto_1

    .line 410
    :cond_5
    const/4 v3, 0x5

    new-array v3, v3, [I

    aput v0, v3, v1

    aput v0, v3, v7

    aput v2, v3, v8

    const/4 v0, 0x3

    aput v1, v3, v0

    const/4 v0, 0x4

    aput v1, v3, v0

    move-object v0, v3

    goto :goto_1

    :cond_6
    move-object v0, v4

    .line 412
    goto :goto_1

    :cond_7
    move v2, v0

    .line 415
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_8

    sub-int v3, v2, v0

    const/16 v5, 0x9

    if-ge v3, v5, :cond_8

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_8

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 416
    :cond_8
    if-eq v2, v0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_a

    :cond_9
    move-object v0, v4

    goto :goto_1

    .line 417
    :cond_a
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 418
    const/16 v5, 0x2e

    if-eq v3, v5, :cond_b

    const/16 v5, 0x29

    if-ne v3, v5, :cond_e

    :cond_b
    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_e

    add-int/lit8 v3, v2, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_e

    .line 419
    add-int/lit8 v3, v2, 0x2

    .line 420
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_c

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v6, :cond_c

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 421
    :cond_c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v3, v5, :cond_d

    move-object v0, v4

    goto/16 :goto_1

    .line 422
    :cond_d
    const/4 v4, 0x5

    new-array v4, v4, [I

    aput v0, v4, v1

    aput v0, v4, v7

    aput v3, v4, v8

    const/4 v1, 0x3

    aput v7, v4, v1

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    aput v0, v4, v1

    move-object v0, v4

    goto/16 :goto_1

    :cond_e
    move-object v0, v4

    .line 424
    goto/16 :goto_1
.end method

.method static mathAt(Ljava/lang/String;I)[I
    .locals 11

    .prologue
    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 627
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 628
    add-int/lit8 v0, p1, 0x1

    if-ge v0, v4, :cond_0

    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x24

    if-ne v0, v3, :cond_0

    move v9, v1

    .line 629
    :goto_0
    if-eqz v9, :cond_1

    move v0, v5

    :goto_1
    add-int v8, p1, v0

    .line 630
    if-lt v8, v4, :cond_2

    move-object v0, v6

    .line 654
    :goto_2
    return-object v0

    :cond_0
    move v9, v2

    .line 628
    goto :goto_0

    :cond_1
    move v0, v1

    .line 629
    goto :goto_1

    :cond_2
    move v3, v8

    .line 633
    :goto_3
    if-eqz v9, :cond_3

    const-string v0, "$$"

    :goto_4
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 634
    if-gez v7, :cond_4

    move-object v0, v6

    goto :goto_2

    .line 633
    :cond_3
    const-string v0, "$"

    goto :goto_4

    .line 635
    :cond_4
    if-lez v7, :cond_5

    add-int/lit8 v0, v7, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x5c

    if-ne v0, v3, :cond_5

    .line 636
    add-int/lit8 v0, v7, 0x1

    move v3, v0

    .line 637
    goto :goto_3

    .line 641
    :cond_5
    invoke-virtual {p0, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 642
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    move-object v0, v6

    goto :goto_2

    .line 643
    :cond_6
    if-nez v9, :cond_d

    .line 644
    const/16 v0, 0xa

    invoke-virtual {v10, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_7

    invoke-virtual {v10, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {v10, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_7
    move-object v0, v6

    goto :goto_2

    .line 645
    :cond_8
    add-int/lit8 v0, v7, 0x1

    .line 646
    if-ge v0, v4, :cond_9

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_9

    move-object v0, v6

    goto :goto_2

    .line 647
    :cond_9
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v1, :cond_a

    invoke-virtual {v10, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-eqz v0, :cond_a

    move v0, v1

    :goto_5
    move v3, v2

    move v4, v0

    .line 648
    :goto_6
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v3, v0, :cond_c

    if-nez v4, :cond_c

    const-string v0, "\\^_=+<>{}"

    invoke-virtual {v10, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_b

    move v4, v1

    :goto_7
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_6

    :cond_a
    move v0, v2

    .line 647
    goto :goto_5

    :cond_b
    move v4, v2

    .line 648
    goto :goto_7

    .line 649
    :cond_c
    if-nez v4, :cond_d

    move-object v0, v6

    goto/16 :goto_2

    :cond_d
    move v4, v8

    .line 652
    :goto_8
    if-ge v4, v7, :cond_10

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v0

    if-eqz v0, :cond_10

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_8

    .line 653
    :goto_9
    if-le v3, v4, :cond_e

    add-int/lit8 v0, v3, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v0

    if-eqz v0, :cond_e

    add-int/lit8 v0, v3, -0x1

    move v3, v0

    goto :goto_9

    .line 654
    :cond_e
    const/4 v0, 0x3

    new-array v0, v0, [I

    aput v4, v0, v2

    aput v3, v0, v1

    if-eqz v9, :cond_f

    move v1, v5

    :cond_f
    add-int/2addr v1, v7

    aput v1, v0, v5

    goto/16 :goto_2

    :cond_10
    move v3, v7

    goto :goto_9
.end method

.method private static paragraph(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 4

    .prologue
    const/16 v3, 0xa

    .line 150
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 151
    const/4 v0, 0x1

    move v1, v0

    .line 152
    :goto_0
    if-ge p2, p3, :cond_0

    .line 153
    add-int/lit8 v0, p2, 0x1

    if-ge v0, p3, :cond_1

    add-int/lit8 v0, p2, 0x1

    aget-object v0, p1, v0

    .line 154
    :goto_1
    if-nez v1, :cond_2

    aget-object v2, p1, p2

    invoke-static {v2, v0}, Lcom/gemini/chat/Markdown;->startsBlock(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 161
    return p2

    .line 153
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 155
    :cond_2
    if-nez v1, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 156
    :cond_3
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 157
    const/4 v0, 0x0

    .line 158
    add-int/lit8 p2, p2, 0x1

    move v1, v0

    .line 159
    goto :goto_0
.end method

.method public static parse(Ljava/lang/String;)Lcom/gemini/chat/Markdown$Doc;
    .locals 1

    .prologue
    .line 74
    const/16 v0, 0x1e

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;
    .locals 9

    .prologue
    const/16 v4, 0xa

    const/4 v0, 0x0

    .line 79
    new-instance v7, Lcom/gemini/chat/Markdown$Doc;

    invoke-direct {v7}, Lcom/gemini/chat/Markdown$Doc;-><init>()V

    .line 80
    iput p1, v7, Lcom/gemini/chat/Markdown$Doc;->gridMaxChars:I

    .line 81
    if-nez p0, :cond_0

    move-object v0, v7

    .line 97
    :goto_0
    return-object v0

    .line 82
    :cond_0
    const-string v1, "\r\n"

    const-string v2, "\n"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xd

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\t"

    const-string v3, "    "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 83
    const-string v2, "\n"

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 84
    array-length v2, v1

    invoke-static {v7, v1, v0, v2}, Lcom/gemini/chat/Markdown;->blocks(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)V

    .line 86
    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 87
    :goto_1
    if-lez v2, :cond_1

    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, v4, :cond_1

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 88
    :cond_1
    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 89
    new-instance v8, Ljava/util/ArrayList;

    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v8, v1}, Ljava/util/ArrayList;-><init>(I)V

    move v6, v0

    .line 90
    :goto_2
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v6, v0, :cond_4

    .line 91
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/gemini/chat/Markdown$Span;

    .line 92
    iget v0, v5, Lcom/gemini/chat/Markdown$Span;->start:I

    if-lt v0, v2, :cond_2

    .line 90
    :goto_3
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_2

    .line 93
    :cond_2
    iget v0, v5, Lcom/gemini/chat/Markdown$Span;->end:I

    if-le v0, v2, :cond_3

    new-instance v0, Lcom/gemini/chat/Markdown$Span;

    iget v1, v5, Lcom/gemini/chat/Markdown$Span;->start:I

    iget v3, v5, Lcom/gemini/chat/Markdown$Span;->type:I

    iget v4, v5, Lcom/gemini/chat/Markdown$Span;->level:I

    iget-object v5, v5, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Span;-><init>(IIIILjava/lang/String;)V

    :goto_4
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_3
    move-object v0, v5

    goto :goto_4

    .line 95
    :cond_4
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 96
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v0, v7

    .line 97
    goto/16 :goto_0
.end method

.method public static plain(Ljava/lang/String;)Lcom/gemini/chat/Markdown$Doc;
    .locals 1

    .prologue
    .line 102
    new-instance v0, Lcom/gemini/chat/Markdown$Doc;

    invoke-direct {v0}, Lcom/gemini/chat/Markdown$Doc;-><init>()V

    .line 103
    if-eqz p0, :cond_0

    invoke-static {v0, p0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 104
    :cond_0
    return-object v0
.end method

.method private static quote(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/16 v5, 0xa

    const/4 v4, 0x0

    .line 253
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 255
    :goto_0
    if-ge p2, p3, :cond_0

    .line 256
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 257
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    .line 263
    :cond_0
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 264
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 265
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 266
    array-length v1, v0

    invoke-static {p0, v0, v4, v1}, Lcom/gemini/chat/Markdown;->blocks(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)V

    .line 267
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    if-le v0, v2, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v0

    if-eq v0, v5, :cond_1

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 268
    :cond_1
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    invoke-virtual {p0, v2, v0, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 269
    return p2

    .line 258
    :cond_2
    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 259
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_3

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 260
    :cond_3
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 261
    add-int/lit8 p2, p2, 0x1

    .line 262
    goto :goto_0
.end method

.method private static runLength(Ljava/lang/String;IC)I
    .locals 2

    .prologue
    .line 793
    move v0, p1

    .line 794
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, p2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 795
    :cond_0
    sub-int/2addr v0, p1

    return v0
.end method

.method private static simple(Ljava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 704
    move v0, v1

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2e

    if-eq v2, v3, :cond_0

    .line 705
    :goto_1
    return v1

    .line 704
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 705
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private static startsBlock(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 143
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 144
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 145
    :goto_0
    return v1

    :cond_0
    invoke-static {v2}, Lcom/gemini/chat/Markdown;->fenceLen(Ljava/lang/String;)I

    move-result v3

    if-gtz v3, :cond_1

    invoke-static {v2}, Lcom/gemini/chat/Markdown;->headingLevel(Ljava/lang/String;)I

    move-result v3

    if-gtz v3, :cond_1

    invoke-static {v2}, Lcom/gemini/chat/Markdown;->isRule(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x3e

    if-eq v3, v4, :cond_1

    .line 146
    invoke-static {p0}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v3

    if-nez v3, :cond_1

    const/16 v3, 0x7c

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/gemini/chat/Markdown;->isTableSep(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    move v0, v1

    :cond_2
    move v1, v0

    .line 145
    goto :goto_0
.end method

.method private static table(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 12

    .prologue
    .line 318
    aget-object v0, p1, p2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->cells(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 319
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 320
    add-int/lit8 v0, p2, 0x2

    move v6, v0

    .line 321
    :goto_0
    if-ge v6, p3, :cond_0

    .line 322
    aget-object v0, p1, v6

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 323
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_1

    .line 327
    :cond_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 328
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_1

    .line 324
    :cond_1
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->cells(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 325
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    .line 326
    goto :goto_0

    .line 331
    :cond_2
    new-array v9, v2, [I

    .line 332
    const/4 v1, 0x1

    .line 333
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 334
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 336
    const/4 v0, 0x0

    move v3, v0

    :goto_2
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_5

    .line 337
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 338
    const/4 v5, 0x0

    move v4, v1

    :goto_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v5, v1, :cond_4

    .line 339
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 340
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->hasInlineMarkup(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    const/4 v4, 0x0

    .line 341
    :cond_3
    aget v11, v9, v5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    aput v1, v9, v5

    .line 338
    add-int/lit8 v1, v5, 0x1

    move v5, v1

    goto :goto_3

    .line 336
    :cond_4
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    move v1, v4

    goto :goto_2

    .line 344
    :cond_5
    const/4 v3, 0x0

    .line 345
    const/4 v0, 0x0

    :goto_4
    if-ge v0, v2, :cond_6

    aget v4, v9, v0

    add-int/2addr v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 346
    :cond_6
    add-int/lit8 v0, v2, -0x1

    mul-int/lit8 v0, v0, 0x3

    add-int/2addr v0, v3

    .line 347
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 348
    if-eqz v1, :cond_12

    iget v1, p0, Lcom/gemini/chat/Markdown$Doc;->gridMaxChars:I

    if-gt v0, v1, :cond_12

    .line 349
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v5

    .line 350
    const/4 v0, 0x0

    move v3, v0

    :goto_5
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_10

    .line 351
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 352
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v7

    .line 353
    const/4 v1, 0x0

    move v4, v1

    :goto_6
    if-ge v4, v2, :cond_a

    .line 354
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v4, v1, :cond_7

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 355
    :goto_7
    iget-object v8, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    add-int/lit8 v8, v2, -0x1

    if-ge v4, v8, :cond_9

    .line 357
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    :goto_8
    aget v8, v9, v4

    if-ge v1, v8, :cond_8

    iget-object v8, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v11, 0x20

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 354
    :cond_7
    const-string v1, ""

    goto :goto_7

    .line 358
    :cond_8
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v8, " | "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    :cond_9
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_6

    .line 361
    :cond_a
    if-nez v3, :cond_b

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/16 v1, 0x12

    invoke-virtual {p0, v7, v0, v1}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 362
    :cond_b
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 363
    if-nez v3, :cond_f

    .line 364
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v4

    .line 365
    const/4 v0, 0x0

    move v1, v0

    :goto_9
    if-ge v1, v2, :cond_e

    .line 366
    const/4 v0, 0x0

    :goto_a
    aget v7, v9, v1

    if-ge v0, v7, :cond_c

    iget-object v7, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v8, 0x2d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 367
    :cond_c
    add-int/lit8 v0, v2, -0x1

    if-ge v1, v0, :cond_d

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v7, "-+-"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    :cond_d
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_9

    .line 369
    :cond_e
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/16 v1, 0x15

    invoke-virtual {p0, v4, v0, v1}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 370
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    :cond_f
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto/16 :goto_5

    .line 373
    :cond_10
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/16 v1, 0x11

    invoke-virtual {p0, v5, v0, v1}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 393
    :cond_11
    return v6

    .line 375
    :cond_12
    const/4 v0, 0x0

    move v3, v0

    :goto_b
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_11

    .line 376
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 377
    if-lez v3, :cond_13

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 378
    :cond_13
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v4

    .line 379
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v5, "\u25aa "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_14

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_c
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 381
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    const/16 v5, 0x13

    invoke-virtual {p0, v4, v1, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 382
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v4, 0xa

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 383
    const/4 v1, 0x1

    move v4, v1

    :goto_d
    if-ge v4, v2, :cond_17

    .line 384
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v5

    .line 385
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v4, v1, :cond_15

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_15

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_e
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 386
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v9, ": "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    const/16 v9, 0x14

    invoke-virtual {p0, v5, v1, v9}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 388
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v4, v1, :cond_16

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_f
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 389
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 383
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_d

    .line 380
    :cond_14
    const-string v1, ""

    goto :goto_c

    .line 385
    :cond_15
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Column "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v9, v4, 0x1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 388
    :cond_16
    const-string v1, ""

    goto :goto_f

    .line 375
    :cond_17
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto/16 :goto_b
.end method

.method private static texArg(Ljava/lang/String;I)[Ljava/lang/String;
    .locals 8

    .prologue
    const/16 v7, 0x7b

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v2, 0x0

    .line 683
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 684
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt p1, v0, :cond_1

    new-array v0, v6, [Ljava/lang/String;

    const-string v1, ""

    aput-object v1, v0, v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    .line 700
    :goto_1
    return-object v0

    .line 685
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_5

    move v0, p1

    move v1, v2

    .line 687
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_4

    .line 688
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 689
    if-ne v3, v7, :cond_3

    add-int/lit8 v1, v1, 0x1

    .line 687
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 690
    :cond_3
    const/16 v4, 0x7d

    if-ne v3, v4, :cond_2

    add-int/lit8 v1, v1, -0x1

    if-nez v1, :cond_2

    new-array v1, v6, [Ljava/lang/String;

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v5

    move-object v0, v1

    goto :goto_1

    .line 692
    :cond_4
    new-array v0, v6, [Ljava/lang/String;

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    goto :goto_1

    .line 694
    :cond_5
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_8

    .line 695
    add-int/lit8 v0, p1, 0x1

    .line 696
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_6

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v1

    if-eqz v1, :cond_6

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 697
    :cond_6
    add-int/lit8 v1, p1, 0x1

    if-ne v0, v1, :cond_7

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_7

    add-int/lit8 v0, v0, 0x1

    .line 698
    :cond_7
    new-array v1, v6, [Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v5

    move-object v0, v1

    goto/16 :goto_1

    .line 700
    :cond_8
    new-array v0, v6, [Ljava/lang/String;

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    add-int/lit8 v1, p1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    goto/16 :goto_1
.end method

.method public static texToText(Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    .prologue
    const/16 v13, 0x5c

    const/16 v12, 0x20

    const/16 v11, 0x5e

    const/4 v10, 0x1

    const/4 v2, 0x0

    .line 710
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 711
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    move v1, v2

    .line 712
    :goto_0
    if-ge v1, v6, :cond_1d

    .line 713
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 714
    if-ne v7, v13, :cond_12

    add-int/lit8 v0, v1, 0x1

    if-ge v0, v6, :cond_12

    .line 715
    add-int/lit8 v0, v1, 0x1

    move v4, v0

    .line 716
    :goto_1
    if-ge v4, v6, :cond_0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_1

    .line 717
    :cond_0
    add-int/lit8 v0, v1, 0x1

    if-ne v4, v0, :cond_5

    .line 718
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 719
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_1

    const/16 v3, 0x3b

    if-eq v0, v3, :cond_1

    const/16 v3, 0x3a

    if-eq v0, v3, :cond_1

    if-ne v0, v12, :cond_3

    :cond_1
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 722
    :cond_2
    :goto_2
    add-int/lit8 v4, v1, 0x2

    move v1, v4

    .line 723
    goto :goto_0

    .line 720
    :cond_3
    if-ne v0, v13, :cond_4

    const/16 v0, 0xa

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 721
    :cond_4
    const/16 v3, 0x21

    if-eq v0, v3, :cond_2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 725
    :cond_5
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 727
    const-string v0, "frac"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "dfrac"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "tfrac"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 728
    :cond_6
    invoke-static {p0, v4}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 729
    aget-object v1, v0, v10

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 730
    aget-object v0, v0, v2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aget-object v1, v3, v2

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 731
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->simple(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    :goto_3
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v4, 0x2f

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->simple(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    move-object v0, v1

    :goto_4
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    aget-object v0, v3, v10

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    move v1, v4

    .line 733
    goto/16 :goto_0

    .line 731
    :cond_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 733
    :cond_9
    const-string v0, "sqrt"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 734
    invoke-static {p0, v4}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 735
    aget-object v0, v1, v2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 736
    const/16 v3, 0x221a

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->simple(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    :goto_5
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 737
    aget-object v0, v1, v10

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    move v1, v4

    .line 738
    goto/16 :goto_0

    .line 736
    :cond_a
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, ")"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 738
    :cond_b
    const-string v0, "text"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "mathrm"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "mathbf"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "mathit"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "operatorname"

    .line 739
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "boxed"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "textbf"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const-string v0, "mbox"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 740
    :cond_c
    invoke-static {p0, v4}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 741
    const-string v0, "text"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "mbox"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_d
    aget-object v0, v3, v2

    :goto_6
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 742
    aget-object v0, v3, v10

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    move v1, v4

    .line 743
    goto/16 :goto_0

    .line 741
    :cond_e
    aget-object v0, v3, v2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 744
    :cond_f
    const/4 v3, 0x0

    move v0, v2

    .line 745
    :goto_7
    sget-object v7, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    array-length v7, v7

    if-ge v0, v7, :cond_1e

    .line 746
    sget-object v7, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    aget-object v7, v7, v0

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 747
    sget-object v3, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    aget-object v0, v3, v0

    .line 751
    :goto_8
    if-eqz v0, :cond_11

    :goto_9
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v4

    .line 753
    goto/16 :goto_0

    .line 745
    :cond_10
    add-int/lit8 v0, v0, 0x2

    goto :goto_7

    :cond_11
    move-object v0, v1

    .line 751
    goto :goto_9

    .line 755
    :cond_12
    if-eq v7, v11, :cond_13

    const/16 v0, 0x5f

    if-ne v7, v0, :cond_1a

    .line 756
    :cond_13
    add-int/lit8 v0, v1, 0x1

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 757
    aget-object v0, v1, v2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 758
    aget-object v1, v1, v10

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 759
    if-ne v7, v11, :cond_14

    const-string v1, "\u00b0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 760
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v4

    .line 761
    goto/16 :goto_0

    .line 763
    :cond_14
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move v3, v2

    .line 764
    :goto_a
    if-ne v7, v11, :cond_15

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v3, v8, :cond_15

    .line 765
    const-string v8, "123n"

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 766
    if-gez v8, :cond_16

    .line 767
    const/4 v1, 0x0

    .line 772
    :cond_15
    if-ne v7, v11, :cond_17

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_17

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move v1, v4

    goto/16 :goto_0

    .line 770
    :cond_16
    const-string v9, "\u00b9\u00b2\u00b3\u207f"

    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 764
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 773
    :cond_17
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v3, v10, :cond_18

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->simple(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    :cond_18
    :goto_b
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v4

    .line 774
    goto/16 :goto_0

    .line 773
    :cond_19
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    .line 776
    :cond_1a
    const/16 v0, 0x7b

    if-eq v7, v0, :cond_1b

    const/16 v0, 0x7d

    if-ne v7, v0, :cond_1c

    .line 777
    :cond_1b
    add-int/lit8 v4, v1, 0x1

    move v1, v4

    .line 778
    goto/16 :goto_0

    .line 780
    :cond_1c
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 781
    add-int/lit8 v4, v1, 0x1

    move v1, v4

    .line 782
    goto/16 :goto_0

    .line 783
    :cond_1d
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1e
    move-object v0, v3

    goto/16 :goto_8
.end method
