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

.field private static final TEX_MAP:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v0, 0x0

    .line 430
    new-array v1, v5, [Ljava/lang/String;

    const-string v2, "\u2022"

    aput-object v2, v1, v0

    const-string v2, "\u25aa"

    aput-object v2, v1, v3

    const-string v2, "\u2013"

    aput-object v2, v1, v4

    sput-object v1, Lcom/gemini/chat/Markdown;->BULLETS:[Ljava/lang/String;

    .line 660
    const/16 v1, 0xda

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "alpha"

    aput-object v2, v1, v0

    const-string v2, "\u03b1"

    aput-object v2, v1, v3

    const-string v2, "beta"

    aput-object v2, v1, v4

    const-string v2, "\u03b2"

    aput-object v2, v1, v5

    const/4 v2, 0x4

    const-string v3, "gamma"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "\u03b3"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "delta"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "\u03b4"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "epsilon"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "\u03b5"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "varepsilon"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "\u03b5"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "zeta"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "\u03b6"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "eta"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "\u03b7"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "theta"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "\u03b8"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "vartheta"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "\u03b8"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string v3, "iota"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "\u03b9"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "kappa"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string v3, "\u03ba"

    aput-object v3, v1, v2

    const/16 v2, 0x18

    const-string v3, "lambda"

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v3, "\u03bb"

    aput-object v3, v1, v2

    const/16 v2, 0x1a

    const-string v3, "mu"

    aput-object v3, v1, v2

    const/16 v2, 0x1b

    const-string v3, "\u03bc"

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string v3, "nu"

    aput-object v3, v1, v2

    const/16 v2, 0x1d

    const-string v3, "\u03bd"

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    const-string v3, "xi"

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "\u03be"

    aput-object v3, v1, v2

    const/16 v2, 0x20

    const-string v3, "pi"

    aput-object v3, v1, v2

    const/16 v2, 0x21

    const-string v3, "\u03c0"

    aput-object v3, v1, v2

    const/16 v2, 0x22

    const-string v3, "rho"

    aput-object v3, v1, v2

    const/16 v2, 0x23

    const-string v3, "\u03c1"

    aput-object v3, v1, v2

    const/16 v2, 0x24

    const-string v3, "sigma"

    aput-object v3, v1, v2

    const/16 v2, 0x25

    const-string v3, "\u03c3"

    aput-object v3, v1, v2

    const/16 v2, 0x26

    const-string v3, "tau"

    aput-object v3, v1, v2

    const/16 v2, 0x27

    const-string v3, "\u03c4"

    aput-object v3, v1, v2

    const/16 v2, 0x28

    const-string v3, "upsilon"

    aput-object v3, v1, v2

    const/16 v2, 0x29

    const-string v3, "\u03c5"

    aput-object v3, v1, v2

    const/16 v2, 0x2a

    const-string v3, "phi"

    aput-object v3, v1, v2

    const/16 v2, 0x2b

    const-string v3, "\u03c6"

    aput-object v3, v1, v2

    const/16 v2, 0x2c

    const-string v3, "varphi"

    aput-object v3, v1, v2

    const/16 v2, 0x2d

    const-string v3, "\u03c6"

    aput-object v3, v1, v2

    const/16 v2, 0x2e

    const-string v3, "chi"

    aput-object v3, v1, v2

    const/16 v2, 0x2f

    const-string v3, "\u03c7"

    aput-object v3, v1, v2

    const/16 v2, 0x30

    const-string v3, "psi"

    aput-object v3, v1, v2

    const/16 v2, 0x31

    const-string v3, "\u03c8"

    aput-object v3, v1, v2

    const/16 v2, 0x32

    const-string v3, "omega"

    aput-object v3, v1, v2

    const/16 v2, 0x33

    const-string v3, "\u03c9"

    aput-object v3, v1, v2

    const/16 v2, 0x34

    const-string v3, "Gamma"

    aput-object v3, v1, v2

    const/16 v2, 0x35

    const-string v3, "\u0393"

    aput-object v3, v1, v2

    const/16 v2, 0x36

    const-string v3, "Delta"

    aput-object v3, v1, v2

    const/16 v2, 0x37

    const-string v3, "\u0394"

    aput-object v3, v1, v2

    const/16 v2, 0x38

    const-string v3, "Theta"

    aput-object v3, v1, v2

    const/16 v2, 0x39

    const-string v3, "\u0398"

    aput-object v3, v1, v2

    const/16 v2, 0x3a

    const-string v3, "Lambda"

    aput-object v3, v1, v2

    const/16 v2, 0x3b

    const-string v3, "\u039b"

    aput-object v3, v1, v2

    const/16 v2, 0x3c

    const-string v3, "Xi"

    aput-object v3, v1, v2

    const/16 v2, 0x3d

    const-string v3, "\u039e"

    aput-object v3, v1, v2

    const/16 v2, 0x3e

    const-string v3, "Pi"

    aput-object v3, v1, v2

    const/16 v2, 0x3f

    const-string v3, "\u03a0"

    aput-object v3, v1, v2

    const/16 v2, 0x40

    const-string v3, "Sigma"

    aput-object v3, v1, v2

    const/16 v2, 0x41

    const-string v3, "\u03a3"

    aput-object v3, v1, v2

    const/16 v2, 0x42

    const-string v3, "Phi"

    aput-object v3, v1, v2

    const/16 v2, 0x43

    const-string v3, "\u03a6"

    aput-object v3, v1, v2

    const/16 v2, 0x44

    const-string v3, "Psi"

    aput-object v3, v1, v2

    const/16 v2, 0x45

    const-string v3, "\u03a8"

    aput-object v3, v1, v2

    const/16 v2, 0x46

    const-string v3, "Omega"

    aput-object v3, v1, v2

    const/16 v2, 0x47

    const-string v3, "\u03a9"

    aput-object v3, v1, v2

    const/16 v2, 0x48

    const-string v3, "times"

    aput-object v3, v1, v2

    const/16 v2, 0x49

    const-string v3, "\u00d7"

    aput-object v3, v1, v2

    const/16 v2, 0x4a

    const-string v3, "div"

    aput-object v3, v1, v2

    const/16 v2, 0x4b

    const-string v3, "\u00f7"

    aput-object v3, v1, v2

    const/16 v2, 0x4c

    const-string v3, "cdot"

    aput-object v3, v1, v2

    const/16 v2, 0x4d

    const-string v3, "\u00b7"

    aput-object v3, v1, v2

    const/16 v2, 0x4e

    const-string v3, "pm"

    aput-object v3, v1, v2

    const/16 v2, 0x4f

    const-string v3, "\u00b1"

    aput-object v3, v1, v2

    const/16 v2, 0x50

    const-string v3, "mp"

    aput-object v3, v1, v2

    const/16 v2, 0x51

    const-string v3, "\u2213"

    aput-object v3, v1, v2

    const/16 v2, 0x52

    const-string v3, "le"

    aput-object v3, v1, v2

    const/16 v2, 0x53

    const-string v3, "\u2264"

    aput-object v3, v1, v2

    const/16 v2, 0x54

    const-string v3, "leq"

    aput-object v3, v1, v2

    const/16 v2, 0x55

    const-string v3, "\u2264"

    aput-object v3, v1, v2

    const/16 v2, 0x56

    const-string v3, "ge"

    aput-object v3, v1, v2

    const/16 v2, 0x57

    const-string v3, "\u2265"

    aput-object v3, v1, v2

    const/16 v2, 0x58

    const-string v3, "geq"

    aput-object v3, v1, v2

    const/16 v2, 0x59

    const-string v3, "\u2265"

    aput-object v3, v1, v2

    const/16 v2, 0x5a

    const-string v3, "ne"

    aput-object v3, v1, v2

    const/16 v2, 0x5b

    const-string v3, "\u2260"

    aput-object v3, v1, v2

    const/16 v2, 0x5c

    const-string v3, "neq"

    aput-object v3, v1, v2

    const/16 v2, 0x5d

    const-string v3, "\u2260"

    aput-object v3, v1, v2

    const/16 v2, 0x5e

    const-string v3, "approx"

    aput-object v3, v1, v2

    const/16 v2, 0x5f

    const-string v3, "\u2248"

    aput-object v3, v1, v2

    const/16 v2, 0x60

    const-string v3, "equiv"

    aput-object v3, v1, v2

    const/16 v2, 0x61

    const-string v3, "\u2261"

    aput-object v3, v1, v2

    const/16 v2, 0x62

    const-string v3, "sim"

    aput-object v3, v1, v2

    const/16 v2, 0x63

    const-string v3, "~"

    aput-object v3, v1, v2

    const/16 v2, 0x64

    const-string v3, "propto"

    aput-object v3, v1, v2

    const/16 v2, 0x65

    const-string v3, "\u221d"

    aput-object v3, v1, v2

    const/16 v2, 0x66

    const-string v3, "infty"

    aput-object v3, v1, v2

    const/16 v2, 0x67

    const-string v3, "\u221e"

    aput-object v3, v1, v2

    const/16 v2, 0x68

    const-string v3, "to"

    aput-object v3, v1, v2

    const/16 v2, 0x69

    const-string v3, "\u2192"

    aput-object v3, v1, v2

    const/16 v2, 0x6a

    const-string v3, "rightarrow"

    aput-object v3, v1, v2

    const/16 v2, 0x6b

    const-string v3, "\u2192"

    aput-object v3, v1, v2

    const/16 v2, 0x6c

    const-string v3, "leftarrow"

    aput-object v3, v1, v2

    const/16 v2, 0x6d

    const-string v3, "\u2190"

    aput-object v3, v1, v2

    const/16 v2, 0x6e

    const-string v3, "leftrightarrow"

    aput-object v3, v1, v2

    const/16 v2, 0x6f

    const-string v3, "\u2194"

    aput-object v3, v1, v2

    const/16 v2, 0x70

    const-string v3, "Rightarrow"

    aput-object v3, v1, v2

    const/16 v2, 0x71

    const-string v3, "\u21d2"

    aput-object v3, v1, v2

    const/16 v2, 0x72

    const-string v3, "implies"

    aput-object v3, v1, v2

    const/16 v2, 0x73

    const-string v3, "\u21d2"

    aput-object v3, v1, v2

    const/16 v2, 0x74

    const-string v3, "Leftrightarrow"

    aput-object v3, v1, v2

    const/16 v2, 0x75

    const-string v3, "\u21d4"

    aput-object v3, v1, v2

    const/16 v2, 0x76

    const-string v3, "iff"

    aput-object v3, v1, v2

    const/16 v2, 0x77

    const-string v3, "\u21d4"

    aput-object v3, v1, v2

    const/16 v2, 0x78

    const-string v3, "in"

    aput-object v3, v1, v2

    const/16 v2, 0x79

    const-string v3, "\u2208"

    aput-object v3, v1, v2

    const/16 v2, 0x7a

    const-string v3, "notin"

    aput-object v3, v1, v2

    const/16 v2, 0x7b

    const-string v3, "\u2209"

    aput-object v3, v1, v2

    const/16 v2, 0x7c

    const-string v3, "subset"

    aput-object v3, v1, v2

    const/16 v2, 0x7d

    const-string v3, "\u2282"

    aput-object v3, v1, v2

    const/16 v2, 0x7e

    const-string v3, "subseteq"

    aput-object v3, v1, v2

    const/16 v2, 0x7f

    const-string v3, "\u2286"

    aput-object v3, v1, v2

    const/16 v2, 0x80

    const-string v3, "cup"

    aput-object v3, v1, v2

    const/16 v2, 0x81

    const-string v3, "\u222a"

    aput-object v3, v1, v2

    const/16 v2, 0x82

    const-string v3, "cap"

    aput-object v3, v1, v2

    const/16 v2, 0x83

    const-string v3, "\u2229"

    aput-object v3, v1, v2

    const/16 v2, 0x84

    const-string v3, "emptyset"

    aput-object v3, v1, v2

    const/16 v2, 0x85

    const-string v3, "\u2205"

    aput-object v3, v1, v2

    const/16 v2, 0x86

    const-string v3, "forall"

    aput-object v3, v1, v2

    const/16 v2, 0x87

    const-string v3, "\u2200"

    aput-object v3, v1, v2

    const/16 v2, 0x88

    const-string v3, "exists"

    aput-object v3, v1, v2

    const/16 v2, 0x89

    const-string v3, "\u2203"

    aput-object v3, v1, v2

    const/16 v2, 0x8a

    const-string v3, "partial"

    aput-object v3, v1, v2

    const/16 v2, 0x8b

    const-string v3, "\u2202"

    aput-object v3, v1, v2

    const/16 v2, 0x8c

    const-string v3, "nabla"

    aput-object v3, v1, v2

    const/16 v2, 0x8d

    const-string v3, "\u2207"

    aput-object v3, v1, v2

    const/16 v2, 0x8e

    const-string v3, "sum"

    aput-object v3, v1, v2

    const/16 v2, 0x8f

    const-string v3, "\u2211"

    aput-object v3, v1, v2

    const/16 v2, 0x90

    const-string v3, "prod"

    aput-object v3, v1, v2

    const/16 v2, 0x91

    const-string v3, "\u220f"

    aput-object v3, v1, v2

    const/16 v2, 0x92

    const-string v3, "int"

    aput-object v3, v1, v2

    const/16 v2, 0x93

    const-string v3, "\u222b"

    aput-object v3, v1, v2

    const/16 v2, 0x94

    const-string v3, "degree"

    aput-object v3, v1, v2

    const/16 v2, 0x95

    const-string v3, "\u00b0"

    aput-object v3, v1, v2

    const/16 v2, 0x96

    const-string v3, "circ"

    aput-object v3, v1, v2

    const/16 v2, 0x97

    const-string v3, "\u00b0"

    aput-object v3, v1, v2

    const/16 v2, 0x98

    const-string v3, "angle"

    aput-object v3, v1, v2

    const/16 v2, 0x99

    const-string v3, "\u2220"

    aput-object v3, v1, v2

    const/16 v2, 0x9a

    const-string v3, "ldots"

    aput-object v3, v1, v2

    const/16 v2, 0x9b

    const-string v3, "\u2026"

    aput-object v3, v1, v2

    const/16 v2, 0x9c

    const-string v3, "dots"

    aput-object v3, v1, v2

    const/16 v2, 0x9d

    const-string v3, "\u2026"

    aput-object v3, v1, v2

    const/16 v2, 0x9e

    const-string v3, "cdots"

    aput-object v3, v1, v2

    const/16 v2, 0x9f

    const-string v3, "\u2026"

    aput-object v3, v1, v2

    const/16 v2, 0xa0

    const-string v3, "perp"

    aput-object v3, v1, v2

    const/16 v2, 0xa1

    const-string v3, "\u22a5"

    aput-object v3, v1, v2

    const/16 v2, 0xa2

    const-string v3, "parallel"

    aput-object v3, v1, v2

    const/16 v2, 0xa3

    const-string v3, "\u2225"

    aput-object v3, v1, v2

    const/16 v2, 0xa4

    const-string v3, "neg"

    aput-object v3, v1, v2

    const/16 v2, 0xa5

    const-string v3, "\u00ac"

    aput-object v3, v1, v2

    const/16 v2, 0xa6

    const-string v3, "land"

    aput-object v3, v1, v2

    const/16 v2, 0xa7

    const-string v3, "\u2227"

    aput-object v3, v1, v2

    const/16 v2, 0xa8

    const-string v3, "lor"

    aput-object v3, v1, v2

    const/16 v2, 0xa9

    const-string v3, "\u2228"

    aput-object v3, v1, v2

    const/16 v2, 0xaa

    const-string v3, "mid"

    aput-object v3, v1, v2

    const/16 v2, 0xab

    const-string v3, "|"

    aput-object v3, v1, v2

    const/16 v2, 0xac

    const-string v3, "quad"

    aput-object v3, v1, v2

    const/16 v2, 0xad

    const-string v3, "  "

    aput-object v3, v1, v2

    const/16 v2, 0xae

    const-string v3, "qquad"

    aput-object v3, v1, v2

    const/16 v2, 0xaf

    const-string v3, "    "

    aput-object v3, v1, v2

    const/16 v2, 0xb0

    const-string v3, "lfloor"

    aput-object v3, v1, v2

    const/16 v2, 0xb1

    const-string v3, "\u230a"

    aput-object v3, v1, v2

    const/16 v2, 0xb2

    const-string v3, "rfloor"

    aput-object v3, v1, v2

    const/16 v2, 0xb3

    const-string v3, "\u230b"

    aput-object v3, v1, v2

    const/16 v2, 0xb4

    const-string v3, "lceil"

    aput-object v3, v1, v2

    const/16 v2, 0xb5

    const-string v3, "\u2308"

    aput-object v3, v1, v2

    const/16 v2, 0xb6

    const-string v3, "rceil"

    aput-object v3, v1, v2

    const/16 v2, 0xb7

    const-string v3, "\u2309"

    aput-object v3, v1, v2

    const/16 v2, 0xb8

    const-string v3, "langle"

    aput-object v3, v1, v2

    const/16 v2, 0xb9

    const-string v3, "\u27e8"

    aput-object v3, v1, v2

    const/16 v2, 0xba

    const-string v3, "rangle"

    aput-object v3, v1, v2

    const/16 v2, 0xbb

    const-string v3, "\u27e9"

    aput-object v3, v1, v2

    const/16 v2, 0xbc

    const-string v3, "log"

    aput-object v3, v1, v2

    const/16 v2, 0xbd

    const-string v3, "log"

    aput-object v3, v1, v2

    const/16 v2, 0xbe

    const-string v3, "ln"

    aput-object v3, v1, v2

    const/16 v2, 0xbf

    const-string v3, "ln"

    aput-object v3, v1, v2

    const/16 v2, 0xc0

    const-string v3, "sin"

    aput-object v3, v1, v2

    const/16 v2, 0xc1

    const-string v3, "sin"

    aput-object v3, v1, v2

    const/16 v2, 0xc2

    const-string v3, "cos"

    aput-object v3, v1, v2

    const/16 v2, 0xc3

    const-string v3, "cos"

    aput-object v3, v1, v2

    const/16 v2, 0xc4

    const-string v3, "tan"

    aput-object v3, v1, v2

    const/16 v2, 0xc5

    const-string v3, "tan"

    aput-object v3, v1, v2

    const/16 v2, 0xc6

    const-string v3, "lim"

    aput-object v3, v1, v2

    const/16 v2, 0xc7

    const-string v3, "lim"

    aput-object v3, v1, v2

    const/16 v2, 0xc8

    const-string v3, "max"

    aput-object v3, v1, v2

    const/16 v2, 0xc9

    const-string v3, "max"

    aput-object v3, v1, v2

    const/16 v2, 0xca

    const-string v3, "min"

    aput-object v3, v1, v2

    const/16 v2, 0xcb

    const-string v3, "min"

    aput-object v3, v1, v2

    const/16 v2, 0xcc

    const-string v3, "exp"

    aput-object v3, v1, v2

    const/16 v2, 0xcd

    const-string v3, "exp"

    aput-object v3, v1, v2

    const/16 v2, 0xce

    const-string v3, "mod"

    aput-object v3, v1, v2

    const/16 v2, 0xcf

    const-string v3, "mod"

    aput-object v3, v1, v2

    const/16 v2, 0xd0

    const-string v3, "gcd"

    aput-object v3, v1, v2

    const/16 v2, 0xd1

    const-string v3, "gcd"

    aput-object v3, v1, v2

    const/16 v2, 0xd2

    const-string v3, "left"

    aput-object v3, v1, v2

    const/16 v2, 0xd3

    const-string v3, ""

    aput-object v3, v1, v2

    const/16 v2, 0xd4

    const-string v3, "right"

    aput-object v3, v1, v2

    const/16 v2, 0xd5

    const-string v3, ""

    aput-object v3, v1, v2

    const/16 v2, 0xd6

    const-string v3, "displaystyle"

    aput-object v3, v1, v2

    const/16 v2, 0xd7

    const-string v3, ""

    aput-object v3, v1, v2

    const/16 v2, 0xd8

    const-string v3, "limits"

    aput-object v3, v1, v2

    const/16 v2, 0xd9

    const-string v3, ""

    aput-object v3, v1, v2

    sput-object v1, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    .line 681
    new-instance v1, Ljava/util/HashMap;

    const/16 v2, 0x100

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    sput-object v1, Lcom/gemini/chat/Markdown;->TEX_MAP:Ljava/util/HashMap;

    .line 684
    :goto_0
    sget-object v1, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    sget-object v1, Lcom/gemini/chat/Markdown;->TEX_MAP:Ljava/util/HashMap;

    sget-object v2, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Lcom/gemini/chat/Markdown;->TEX:[Ljava/lang/String;

    add-int/lit8 v4, v0, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 685
    :cond_0
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method static appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V
    .locals 7

    .prologue
    const/16 v6, 0x3a

    .line 917
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 918
    const/4 v1, 0x0

    .line 919
    :goto_0
    if-ge v1, v2, :cond_2

    move v0, v1

    .line 921
    :goto_1
    if-ge v0, v2, :cond_0

    .line 922
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 923
    const/16 v4, 0x80

    if-lt v3, v4, :cond_3

    .line 931
    :cond_0
    if-le v0, v1, :cond_1

    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1, v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 932
    :cond_1
    if-lt v0, v2, :cond_7

    .line 945
    :cond_2
    return-void

    .line 925
    :cond_3
    add-int/lit8 v4, v0, 0x1

    if-ge v4, v2, :cond_6

    const/16 v4, 0x30

    if-lt v3, v4, :cond_4

    const/16 v4, 0x39

    if-le v3, v4, :cond_5

    :cond_4
    const/16 v4, 0x23

    if-eq v3, v4, :cond_5

    const/16 v4, 0x2a

    if-ne v3, v4, :cond_6

    .line 926
    :cond_5
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 927
    const v4, 0xfe0f

    if-eq v3, v4, :cond_0

    const/16 v4, 0x20e3

    if-eq v3, v4, :cond_0

    .line 929
    :cond_6
    add-int/lit8 v0, v0, 0x1

    .line 930
    goto :goto_1

    .line 933
    :cond_7
    invoke-static {p1, v0}, Lcom/gemini/chat/EmojiMap;->matchAt(Ljava/lang/CharSequence;I)I

    move-result v1

    .line 934
    if-lez v1, :cond_8

    .line 935
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v3

    .line 936
    iget-object v4, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1, v0, v1}, Lcom/gemini/chat/EmojiMap;->nameAt(Ljava/lang/CharSequence;II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 937
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v4

    const/16 v5, 0x10

    invoke-virtual {p0, v3, v4, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 938
    add-int/2addr v1, v0

    .line 939
    goto :goto_0

    .line 941
    :cond_8
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 942
    invoke-static {v1}, Lcom/gemini/chat/EmojiMap;->isInvisible(C)Z

    move-result v3

    if-nez v3, :cond_9

    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 943
    :cond_9
    add-int/lit8 v1, v0, 0x1

    .line 944
    goto :goto_0
.end method

.method private static blocks(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)V
    .locals 4

    .prologue
    .line 113
    .line 114
    :goto_0
    if-ge p2, p3, :cond_7

    .line 115
    aget-object v0, p1, p2

    .line 116
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 117
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 118
    add-int/lit8 p2, p2, 0x1

    .line 119
    goto :goto_0

    .line 121
    :cond_0
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->fenceLen(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_1

    .line 122
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->codeBlock(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    :goto_1
    move p2, v0

    .line 142
    goto :goto_0

    .line 123
    :cond_1
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->headingLevel(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_2

    .line 124
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->heading(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 125
    add-int/lit8 v0, p2, 0x1

    goto :goto_1

    .line 126
    :cond_2
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isRule(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 127
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 128
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    .line 129
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    const/16 v2, 0xf

    invoke-virtual {p0, v0, v1, v2}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 131
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 132
    add-int/lit8 v0, p2, 0x1

    .line 133
    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_4

    .line 134
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->quote(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 135
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

    .line 136
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->table(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 137
    :cond_5
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v0

    if-eqz v0, :cond_6

    .line 138
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->list(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 140
    :cond_6
    invoke-static {p0, p1, p2, p3}, Lcom/gemini/chat/Markdown;->paragraph(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I

    move-result v0

    goto :goto_1

    .line 143
    :cond_7
    return-void
.end method

.method private static canOpen(Ljava/lang/String;IIC)Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 815
    add-int v1, p1, p2

    .line 816
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 818
    :cond_0
    :goto_0
    return v0

    .line 817
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

    .line 818
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

    .line 288
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 289
    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 290
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

    .line 291
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 292
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move v1, v2

    .line 293
    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 294
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 295
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

    .line 296
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 297
    add-int/lit8 v1, v1, 0x1

    .line 293
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 298
    :cond_2
    if-ne v5, v8, :cond_3

    .line 299
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 300
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_1

    .line 302
    :cond_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 305
    :cond_4
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 306
    return-object v3
.end method

.method private static codeBlock(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 11

    .prologue
    .line 215
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 216
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->fenceLen(Ljava/lang/String;)I

    move-result v3

    .line 217
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 218
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 219
    aget-object v0, p1, p2

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 220
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 221
    add-int/lit8 v1, p2, 0x1

    .line 222
    const/4 v0, 0x1

    move v2, v0

    .line 223
    :goto_0
    if-ge v1, p3, :cond_1

    .line 224
    aget-object v0, p1, v1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    .line 225
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v3, :cond_4

    const/4 v0, 0x0

    invoke-virtual {v8, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v4, :cond_4

    .line 226
    const/4 v0, 0x0

    .line 227
    :goto_1
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v0, v9, :cond_0

    invoke-virtual {v8, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v4, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 228
    :cond_0
    if-lt v0, v3, :cond_4

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v0, v8, :cond_4

    .line 238
    :cond_1
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 239
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    .line 240
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 241
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 242
    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v3

    const/16 v4, 0x9

    invoke-virtual {p0, v2, v3, v4}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 244
    iget-object v2, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 246
    :cond_2
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 247
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 248
    iget-object v3, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v4, 0xa

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 249
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v3

    const/16 v4, 0x8

    invoke-virtual {p0, v2, v3, v4}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 250
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    const/16 v3, 0x8

    invoke-virtual {p0, v0, v2, v3}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 251
    :cond_3
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->codeBlocks:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    if-ge v1, p3, :cond_7

    add-int/lit8 v0, v1, 0x1

    :goto_2
    return v0

    .line 230
    :cond_4
    aget-object v8, p1, v1

    .line 232
    const/4 v0, 0x0

    .line 233
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

    .line 234
    :cond_5
    if-nez v2, :cond_6

    const/16 v2, 0xa

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 235
    :cond_6
    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    const/4 v0, 0x0

    .line 223
    add-int/lit8 v1, v1, 0x1

    move v2, v0

    goto/16 :goto_0

    :cond_7
    move v0, v1

    .line 252
    goto :goto_2
.end method

.method private static count(Ljava/lang/String;IIC)I
    .locals 2

    .prologue
    .line 789
    const/4 v0, 0x0

    .line 790
    :goto_0
    if-ge p1, p2, :cond_1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, p3, :cond_0

    add-int/lit8 v0, v0, 0x1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 791
    :cond_1
    return v0
.end method

.method private static fenceLen(Ljava/lang/String;)I
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/16 v4, 0x60

    const/4 v1, 0x0

    .line 204
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v5, :cond_1

    .line 211
    :cond_0
    :goto_0
    return v1

    .line 205
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 206
    if-eq v2, v4, :cond_2

    const/16 v0, 0x7e

    if-ne v2, v0, :cond_0

    :cond_2
    move v0, v1

    .line 208
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v2, :cond_3

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 209
    :cond_3
    if-lt v0, v5, :cond_0

    .line 210
    if-ne v2, v4, :cond_4

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-gez v2, :cond_0

    :cond_4
    move v1, v0

    .line 211
    goto :goto_0
.end method

.method private static findBacktickRun(Ljava/lang/String;II)I
    .locals 2

    .prologue
    const/16 v1, 0x60

    .line 801
    .line 802
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 803
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v1, :cond_1

    .line 804
    invoke-static {p0, p1, v1}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v0

    .line 805
    if-ne v0, p2, :cond_0

    .line 811
    :goto_1
    return p1

    .line 806
    :cond_0
    add-int/2addr p1, v0

    .line 807
    goto :goto_0

    .line 808
    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 811
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

    .line 823
    .line 824
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    move v0, p1

    .line 825
    :goto_0
    if-ge v0, v5, :cond_9

    .line 826
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 827
    const/16 v4, 0x5c

    if-ne v1, v4, :cond_0

    .line 828
    add-int/lit8 v0, v0, 0x2

    .line 829
    goto :goto_0

    .line 831
    :cond_0
    if-ne v1, v7, :cond_2

    .line 832
    invoke-static {p0, v0, v7}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v1

    .line 833
    add-int v4, v0, v1

    invoke-static {p0, v4, v1}, Lcom/gemini/chat/Markdown;->findBacktickRun(Ljava/lang/String;II)I

    move-result v4

    .line 834
    if-ltz v4, :cond_1

    add-int v0, v4, v1

    goto :goto_0

    :cond_1
    add-int/2addr v0, v1

    goto :goto_0

    .line 837
    :cond_2
    if-ne v1, p2, :cond_8

    .line 838
    invoke-static {p0, v0, p2}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v6

    .line 839
    if-le v0, p1, :cond_4

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->isSpace(C)Z

    move-result v1

    if-nez v1, :cond_4

    move v4, v3

    .line 840
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

    .line 841
    :goto_2
    if-ne v6, p3, :cond_6

    if-eqz v4, :cond_6

    if-eqz v1, :cond_6

    .line 848
    :goto_3
    return v0

    :cond_4
    move v4, v2

    .line 839
    goto :goto_1

    :cond_5
    move v1, v2

    .line 840
    goto :goto_2

    .line 842
    :cond_6
    if-le v6, p3, :cond_7

    if-eqz v4, :cond_7

    if-eqz v1, :cond_7

    const/16 v1, 0x7e

    if-eq p2, v1, :cond_7

    sub-int v1, v6, p3

    add-int/2addr v0, v1

    goto :goto_3

    .line 843
    :cond_7
    add-int/2addr v0, v6

    .line 844
    goto :goto_0

    .line 846
    :cond_8
    add-int/lit8 v0, v0, 0x1

    .line 847
    goto :goto_0

    .line 848
    :cond_9
    const/4 v0, -0x1

    goto :goto_3
.end method

.method private static flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V
    .locals 1

    .prologue
    .line 909
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 910
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 911
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 913
    :cond_0
    return-void
.end method

.method private static hasInlineMarkup(Ljava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 310
    move v0, v1

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 311
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 312
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

    .line 314
    :cond_1
    return v1

    .line 310
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static heading(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 176
    invoke-static {p1}, Lcom/gemini/chat/Markdown;->headingLevel(Ljava/lang/String;)I

    move-result v4

    .line 177
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 179
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 180
    :goto_0
    if-lez v1, :cond_0

    add-int/lit8 v2, v1, -0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x23

    if-ne v2, v3, :cond_0

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 181
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

    .line 182
    :cond_2
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 183
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 184
    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 185
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x7

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 186
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 187
    return-void
.end method

.method private static headingLevel(Ljava/lang/String;)I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 168
    move v0, v1

    .line 169
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

    .line 170
    :cond_0
    if-eqz v0, :cond_1

    const/4 v2, 0x6

    if-le v0, v2, :cond_3

    :cond_1
    move v0, v1

    .line 172
    :cond_2
    :goto_1
    return v0

    .line 171
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v0, v2, :cond_2

    .line 172
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

    .line 516
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 517
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    move v2, v4

    .line 519
    :goto_0
    if-ge v2, v10, :cond_19

    .line 520
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 521
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

    .line 522
    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 523
    add-int/lit8 v2, v2, 0x2

    .line 524
    goto :goto_0

    .line 526
    :cond_0
    if-ne v3, v13, :cond_4

    .line 527
    invoke-static {p1, v2, v13}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v1

    .line 528
    add-int v0, v2, v1

    invoke-static {p1, v0, v1}, Lcom/gemini/chat/Markdown;->findBacktickRun(Ljava/lang/String;II)I

    move-result v3

    .line 529
    if-ltz v3, :cond_2

    .line 530
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 531
    add-int v0, v2, v1

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 532
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

    .line 533
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 534
    :cond_1
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 535
    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 536
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/4 v5, 0x5

    invoke-virtual {p0, v2, v0, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 537
    add-int v2, v3, v1

    .line 538
    goto :goto_0

    :cond_2
    move v0, v4

    .line 539
    :goto_1
    if-ge v0, v1, :cond_3

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 540
    :cond_3
    add-int/2addr v2, v1

    .line 542
    goto/16 :goto_0

    .line 544
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

    .line 545
    :cond_5
    invoke-static {p0, v9, p1, v2}, Lcom/gemini/chat/Markdown;->link(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;Ljava/lang/String;I)I

    move-result v6

    .line 546
    if-le v6, v2, :cond_6

    move v2, v6

    .line 548
    goto/16 :goto_0

    .line 550
    :cond_6
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 551
    add-int/lit8 v2, v2, 0x1

    .line 552
    goto/16 :goto_0

    .line 554
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

    .line 555
    :cond_8
    const/16 v0, 0x3e

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    .line 556
    if-le v6, v2, :cond_9

    .line 557
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 558
    add-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 559
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 560
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x6

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 562
    add-int/lit8 v2, v6, 0x1

    .line 563
    goto/16 :goto_0

    .line 566
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

    .line 567
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_b

    const-string v0, "https://"

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_b
    move v0, v2

    .line 569
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

    .line 571
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

    .line 572
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

    .line 573
    :goto_4
    invoke-virtual {p1, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 574
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x8

    if-le v0, v1, :cond_e

    .line 575
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 576
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 577
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/4 v3, 0x6

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    move v2, v6

    .line 580
    goto/16 :goto_0

    .line 583
    :cond_e
    const/16 v0, 0x24

    if-ne v3, v0, :cond_f

    .line 584
    invoke-static {p1, v2}, Lcom/gemini/chat/Markdown;->mathAt(Ljava/lang/String;I)[I

    move-result-object v0

    .line 585
    if-eqz v0, :cond_f

    .line 586
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 587
    aget v1, v0, v4

    aget v2, v0, v8

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 588
    aget v2, v0, v7

    goto/16 :goto_0

    .line 592
    :cond_f
    const/16 v0, 0x2a

    if-eq v3, v0, :cond_10

    const/16 v0, 0x5f

    if-eq v3, v0, :cond_10

    if-ne v3, v12, :cond_18

    .line 593
    :cond_10
    invoke-static {p1, v2, v3}, Lcom/gemini/chat/Markdown;->runLength(Ljava/lang/String;IC)I

    move-result v5

    .line 594
    if-ne v3, v12, :cond_11

    move v1, v7

    .line 595
    :goto_5
    if-ne v3, v12, :cond_12

    if-ge v5, v7, :cond_12

    .line 596
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 597
    add-int/lit8 v2, v2, 0x1

    .line 598
    goto/16 :goto_0

    .line 594
    :cond_11
    const/4 v0, 0x3

    invoke-static {v5, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    move v1, v0

    goto :goto_5

    .line 600
    :cond_12
    if-ne v5, v1, :cond_16

    invoke-static {p1, v2, v5, v3}, Lcom/gemini/chat/Markdown;->canOpen(Ljava/lang/String;IIC)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 601
    add-int v0, v2, v5

    invoke-static {p1, v0, v3, v1}, Lcom/gemini/chat/Markdown;->findCloser(Ljava/lang/String;ICI)I

    move-result v6

    .line 602
    add-int v0, v2, v5

    if-le v6, v0, :cond_16

    .line 603
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 604
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v11

    .line 605
    add-int v0, v2, v5

    invoke-virtual {p1, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 606
    if-ne v3, v12, :cond_13

    const/4 v0, 0x4

    .line 607
    :goto_6
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    invoke-virtual {p0, v11, v2, v0}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 608
    add-int v2, v6, v1

    .line 609
    goto/16 :goto_0

    .line 606
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

    .line 612
    :goto_7
    if-ge v0, v5, :cond_17

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 613
    :cond_17
    add-int/2addr v2, v5

    .line 614
    goto/16 :goto_0

    .line 616
    :cond_18
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 617
    add-int/lit8 v2, v2, 0x1

    .line 618
    goto/16 :goto_0

    .line 619
    :cond_19
    invoke-static {p0, v9}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 620
    return-void

    :cond_1a
    move v6, v0

    goto/16 :goto_4
.end method

.method private static isPunct(C)Z
    .locals 1

    .prologue
    .line 504
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

    .line 190
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v6, :cond_1

    .line 199
    :cond_0
    :goto_0
    return v1

    .line 191
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 192
    const/16 v0, 0x2d

    if-eq v3, v0, :cond_2

    const/16 v0, 0x2a

    if-eq v3, v0, :cond_2

    const/16 v0, 0x5f

    if-ne v3, v0, :cond_0

    :cond_2
    move v0, v1

    move v2, v1

    .line 194
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_5

    .line 195
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 196
    if-ne v4, v3, :cond_4

    add-int/lit8 v2, v2, 0x1

    .line 194
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 197
    :cond_4
    const/16 v5, 0x20

    if-eq v4, v5, :cond_3

    goto :goto_0

    .line 199
    :cond_5
    if-lt v2, v6, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private static isSpace(C)Z
    .locals 1

    .prologue
    .line 508
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

    .line 278
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_1

    .line 284
    :cond_0
    :goto_0
    return v2

    .line 279
    :cond_1
    invoke-virtual {p0, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_3

    move v0, v1

    :goto_1
    move v3, v2

    .line 280
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 281
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 282
    if-eq v4, v7, :cond_2

    if-eq v4, v6, :cond_2

    const/16 v5, 0x3a

    if-eq v4, v5, :cond_2

    const/16 v5, 0x20

    if-ne v4, v5, :cond_0

    .line 280
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    move v0, v2

    .line 279
    goto :goto_1

    .line 284
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
    .line 512
    invoke-static {p0}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v0

    return v0
.end method

.method private static leading(Ljava/lang/String;)I
    .locals 3

    .prologue
    .line 496
    const/4 v0, 0x0

    .line 497
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

    .line 498
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

    .line 853
    invoke-virtual {p2, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x21

    if-ne v0, v1, :cond_1

    move v7, v8

    .line 854
    :goto_0
    if-eqz v7, :cond_2

    add-int/lit8 v0, p3, 0x1

    :goto_1
    move v1, v0

    move v2, v4

    .line 857
    :goto_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_f

    .line 858
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 859
    const/16 v6, 0x5c

    if-ne v5, v6, :cond_3

    .line 860
    add-int/lit8 v1, v1, 0x1

    .line 857
    :cond_0
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    move v7, v4

    .line 853
    goto :goto_0

    :cond_2
    move v0, p3

    .line 854
    goto :goto_1

    .line 863
    :cond_3
    const/16 v6, 0x5b

    if-ne v5, v6, :cond_4

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 864
    :cond_4
    if-ne v5, v11, :cond_0

    .line 865
    add-int/lit8 v2, v2, -0x1

    .line 866
    if-nez v2, :cond_0

    move v5, v1

    .line 872
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

    .line 905
    :cond_5
    :goto_5
    return p3

    .line 875
    :cond_6
    add-int/lit8 v1, v5, 0x1

    move v2, v4

    :goto_6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v1, v6, :cond_e

    .line 876
    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 877
    if-ne v6, v10, :cond_8

    add-int/lit8 v2, v2, 0x1

    .line 875
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 878
    :cond_8
    const/16 v9, 0x29

    if-ne v6, v9, :cond_7

    .line 879
    add-int/lit8 v2, v2, -0x1

    .line 880
    if-nez v2, :cond_7

    move v6, v1

    .line 886
    :goto_7
    if-ltz v6, :cond_5

    .line 887
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p2, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 888
    add-int/lit8 v0, v5, 0x2

    invoke-virtual {p2, v0, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 889
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 890
    if-lez v1, :cond_9

    invoke-virtual {v0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 891
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

    .line 892
    :goto_8
    invoke-static {p0, p1}, Lcom/gemini/chat/Markdown;->flush(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/StringBuilder;)V

    .line 893
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 894
    if-eqz v7, :cond_b

    .line 895
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v3, "[Image"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 896
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_a

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 897
    :cond_a
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 898
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 899
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0x17

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 905
    :goto_9
    add-int/lit8 p3, v6, 0x1

    goto/16 :goto_5

    .line 901
    :cond_b
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 902
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    if-ne v0, v1, :cond_c

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 903
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
    .line 433
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 434
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 436
    :goto_0
    if-ge p2, p3, :cond_f

    .line 437
    aget-object v1, p1, p2

    .line 438
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->listItem(Ljava/lang/String;)[I

    move-result-object v4

    .line 439
    if-nez v4, :cond_2

    .line 440
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_f

    .line 442
    add-int/lit8 v0, p2, 0x1

    .line 443
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

    .line 444
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

    .line 446
    goto :goto_0

    .line 451
    :cond_2
    const/4 v0, 0x0

    aget v10, v4, v0

    .line 452
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

    .line 453
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

    .line 454
    :cond_5
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v11, v0, -0x1

    .line 456
    const/4 v0, 0x2

    aget v0, v4, v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 458
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 459
    const/4 v0, 0x3

    aget v0, v4, v0

    const/4 v5, 0x1

    if-ne v0, v5, :cond_9

    .line 460
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

    .line 464
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

    .line 465
    :cond_6
    const/4 v2, 0x1

    .line 466
    const/4 v0, 0x1

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_a

    const/4 v1, 0x1

    .line 467
    :goto_4
    if-eqz v1, :cond_b

    const-string v0, "[x]"

    .line 468
    :goto_5
    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    move v6, v1

    move v4, v2

    move-object v7, v0

    move-object v8, v3

    .line 470
    :goto_6
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 471
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0xd

    if-eqz v4, :cond_c

    const/4 v4, 0x1

    :goto_7
    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Doc;->span(IIIILjava/lang/String;)V

    .line 473
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 474
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    .line 475
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 476
    if-eqz v6, :cond_7

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    const/16 v3, 0xe

    invoke-virtual {p0, v0, v2, v3}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 477
    :cond_7
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 478
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

    .line 479
    add-int/lit8 v0, p2, 0x1

    move v6, v0

    .line 481
    :goto_8
    if-ge v6, p3, :cond_8

    .line 482
    aget-object v2, p1, v6

    .line 483
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

    .line 491
    goto/16 :goto_0

    .line 462
    :cond_9
    sget-object v0, Lcom/gemini/chat/Markdown;->BULLETS:[Ljava/lang/String;

    sget-object v4, Lcom/gemini/chat/Markdown;->BULLETS:[Ljava/lang/String;

    array-length v4, v4

    rem-int v4, v11, v4

    aget-object v0, v0, v4

    goto/16 :goto_3

    .line 466
    :cond_a
    const/4 v1, 0x0

    goto/16 :goto_4

    .line 467
    :cond_b
    const-string v0, "[ ]"

    goto/16 :goto_5

    .line 472
    :cond_c
    const/4 v4, 0x0

    goto :goto_7

    .line 484
    :cond_d
    add-int/lit8 v0, v6, 0x1

    if-ge v0, p3, :cond_e

    add-int/lit8 v0, v6, 0x1

    aget-object v0, p1, v0

    :goto_9
    invoke-static {v2, v0}, Lcom/gemini/chat/Markdown;->startsBlock(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 485
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    .line 486
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 487
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 488
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

    .line 489
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    .line 490
    goto :goto_8

    .line 484
    :cond_e
    const/4 v0, 0x0

    goto :goto_9

    .line 492
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

    .line 403
    move v0, v1

    .line 404
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v6, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 405
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_1

    move-object v0, v4

    .line 427
    :goto_1
    return-object v0

    .line 406
    :cond_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 407
    const/16 v3, 0x2d

    if-eq v2, v3, :cond_2

    const/16 v3, 0x2a

    if-eq v2, v3, :cond_2

    const/16 v3, 0x2b

    if-ne v2, v3, :cond_7

    .line 408
    :cond_2
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_6

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v6, :cond_6

    .line 409
    add-int/lit8 v2, v0, 0x2

    .line 410
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_3

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_3

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 411
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_4

    move-object v0, v4

    goto :goto_1

    .line 412
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/gemini/chat/Markdown;->isRule(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    move-object v0, v4

    goto :goto_1

    .line 413
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

    .line 415
    goto :goto_1

    :cond_7
    move v2, v0

    .line 418
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

    .line 419
    :cond_8
    if-eq v2, v0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_a

    :cond_9
    move-object v0, v4

    goto :goto_1

    .line 420
    :cond_a
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 421
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

    .line 422
    add-int/lit8 v3, v2, 0x2

    .line 423
    :goto_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_c

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v6, :cond_c

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 424
    :cond_c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v3, v5, :cond_d

    move-object v0, v4

    goto/16 :goto_1

    .line 425
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

    .line 427
    goto/16 :goto_1
.end method

.method static mathAt(Ljava/lang/String;I)[I
    .locals 11

    .prologue
    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 630
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 631
    add-int/lit8 v0, p1, 0x1

    if-ge v0, v4, :cond_0

    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x24

    if-ne v0, v3, :cond_0

    move v9, v1

    .line 632
    :goto_0
    if-eqz v9, :cond_1

    move v0, v5

    :goto_1
    add-int v8, p1, v0

    .line 633
    if-lt v8, v4, :cond_2

    move-object v0, v6

    .line 657
    :goto_2
    return-object v0

    :cond_0
    move v9, v2

    .line 631
    goto :goto_0

    :cond_1
    move v0, v1

    .line 632
    goto :goto_1

    :cond_2
    move v3, v8

    .line 636
    :goto_3
    if-eqz v9, :cond_3

    const-string v0, "$$"

    :goto_4
    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v7

    .line 637
    if-gez v7, :cond_4

    move-object v0, v6

    goto :goto_2

    .line 636
    :cond_3
    const-string v0, "$"

    goto :goto_4

    .line 638
    :cond_4
    if-lez v7, :cond_5

    add-int/lit8 v0, v7, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v3, 0x5c

    if-ne v0, v3, :cond_5

    .line 639
    add-int/lit8 v0, v7, 0x1

    move v3, v0

    .line 640
    goto :goto_3

    .line 644
    :cond_5
    invoke-virtual {p0, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 645
    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    move-object v0, v6

    goto :goto_2

    .line 646
    :cond_6
    if-nez v9, :cond_d

    .line 647
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

    .line 648
    :cond_8
    add-int/lit8 v0, v7, 0x1

    .line 649
    if-ge v0, v4, :cond_9

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    if-eqz v0, :cond_9

    move-object v0, v6

    goto :goto_2

    .line 650
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

    .line 651
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

    .line 650
    goto :goto_5

    :cond_b
    move v4, v2

    .line 651
    goto :goto_7

    .line 652
    :cond_c
    if-nez v4, :cond_d

    move-object v0, v6

    goto/16 :goto_2

    :cond_d
    move v4, v8

    .line 655
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

    .line 656
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

    .line 657
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

    .line 153
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 154
    const/4 v0, 0x1

    move v1, v0

    .line 155
    :goto_0
    if-ge p2, p3, :cond_0

    .line 156
    add-int/lit8 v0, p2, 0x1

    if-ge v0, p3, :cond_1

    add-int/lit8 v0, p2, 0x1

    aget-object v0, p1, v0

    .line 157
    :goto_1
    if-nez v1, :cond_2

    aget-object v2, p1, p2

    invoke-static {v2, v0}, Lcom/gemini/chat/Markdown;->startsBlock(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 164
    return p2

    .line 156
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 158
    :cond_2
    if-nez v1, :cond_3

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 159
    :cond_3
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 160
    const/4 v0, 0x0

    .line 161
    add-int/lit8 p2, p2, 0x1

    move v1, v0

    .line 162
    goto :goto_0
.end method

.method public static parse(Ljava/lang/String;)Lcom/gemini/chat/Markdown$Doc;
    .locals 1

    .prologue
    .line 75
    const/16 v0, 0x1e

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;I)Lcom/gemini/chat/Markdown$Doc;
    .locals 9

    .prologue
    const/16 v3, 0xd

    const/16 v4, 0xa

    const/4 v0, 0x0

    .line 80
    new-instance v7, Lcom/gemini/chat/Markdown$Doc;

    invoke-direct {v7}, Lcom/gemini/chat/Markdown$Doc;-><init>()V

    .line 81
    iput p1, v7, Lcom/gemini/chat/Markdown$Doc;->gridMaxChars:I

    .line 82
    if-nez p0, :cond_0

    move-object v0, v7

    .line 100
    :goto_0
    return-object v0

    .line 84
    :cond_0
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_1

    const-string v1, "\r\n"

    const-string v2, "\n"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 85
    :cond_1
    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_2

    const-string v1, "\t"

    const-string v2, "    "

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 86
    :cond_2
    const-string v1, "\n"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 87
    array-length v2, v1

    invoke-static {v7, v1, v0, v2}, Lcom/gemini/chat/Markdown;->blocks(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)V

    .line 89
    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    .line 90
    :goto_1
    if-lez v2, :cond_3

    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    add-int/lit8 v3, v2, -0x1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    if-ne v1, v4, :cond_3

    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 91
    :cond_3
    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 92
    new-instance v8, Ljava/util/ArrayList;

    iget-object v1, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v8, v1}, Ljava/util/ArrayList;-><init>(I)V

    move v6, v0

    .line 93
    :goto_2
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v6, v0, :cond_6

    .line 94
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/gemini/chat/Markdown$Span;

    .line 95
    iget v0, v5, Lcom/gemini/chat/Markdown$Span;->start:I

    if-lt v0, v2, :cond_4

    .line 93
    :goto_3
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    goto :goto_2

    .line 96
    :cond_4
    iget v0, v5, Lcom/gemini/chat/Markdown$Span;->end:I

    if-le v0, v2, :cond_5

    new-instance v0, Lcom/gemini/chat/Markdown$Span;

    iget v1, v5, Lcom/gemini/chat/Markdown$Span;->start:I

    iget v3, v5, Lcom/gemini/chat/Markdown$Span;->type:I

    iget v4, v5, Lcom/gemini/chat/Markdown$Span;->level:I

    iget-object v5, v5, Lcom/gemini/chat/Markdown$Span;->arg:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/gemini/chat/Markdown$Span;-><init>(IIIILjava/lang/String;)V

    :goto_4
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_5
    move-object v0, v5

    goto :goto_4

    .line 98
    :cond_6
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 99
    iget-object v0, v7, Lcom/gemini/chat/Markdown$Doc;->spans:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v0, v7

    .line 100
    goto/16 :goto_0
.end method

.method public static plain(Ljava/lang/String;)Lcom/gemini/chat/Markdown$Doc;
    .locals 1

    .prologue
    .line 105
    new-instance v0, Lcom/gemini/chat/Markdown$Doc;

    invoke-direct {v0}, Lcom/gemini/chat/Markdown$Doc;-><init>()V

    .line 106
    if-eqz p0, :cond_0

    invoke-static {v0, p0}, Lcom/gemini/chat/Markdown;->appendText(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 107
    :cond_0
    return-object v0
.end method

.method private static quote(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/16 v5, 0xa

    const/4 v4, 0x0

    .line 256
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 258
    :goto_0
    if-ge p2, p3, :cond_0

    .line 259
    aget-object v0, p1, p2

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 260
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    .line 266
    :cond_0
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 267
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v2

    .line 268
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 269
    array-length v1, v0

    invoke-static {p0, v0, v4, v1}, Lcom/gemini/chat/Markdown;->blocks(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)V

    .line 270
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

    .line 271
    :cond_1
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    invoke-virtual {p0, v2, v0, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 272
    return p2

    .line 261
    :cond_2
    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 262
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_3

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 263
    :cond_3
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    add-int/lit8 p2, p2, 0x1

    .line 265
    goto :goto_0
.end method

.method private static runLength(Ljava/lang/String;IC)I
    .locals 2

    .prologue
    .line 795
    move v0, p1

    .line 796
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, p2, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 797
    :cond_0
    sub-int/2addr v0, p1

    return v0
.end method

.method private static simple(Ljava/lang/String;)Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 712
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

    .line 713
    :goto_1
    return v1

    .line 712
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 713
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private static startsBlock(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 146
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 147
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 148
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

    .line 149
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

    .line 148
    goto :goto_0
.end method

.method private static table(Lcom/gemini/chat/Markdown$Doc;[Ljava/lang/String;II)I
    .locals 12

    .prologue
    .line 321
    aget-object v0, p1, p2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->cells(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 322
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 323
    add-int/lit8 v0, p2, 0x2

    move v6, v0

    .line 324
    :goto_0
    if-ge v6, p3, :cond_0

    .line 325
    aget-object v0, p1, v6

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 326
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_1

    .line 330
    :cond_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 331
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

    .line 327
    :cond_1
    invoke-static {v0}, Lcom/gemini/chat/Markdown;->cells(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 328
    add-int/lit8 v0, v6, 0x1

    move v6, v0

    .line 329
    goto :goto_0

    .line 334
    :cond_2
    new-array v9, v2, [I

    .line 335
    const/4 v1, 0x1

    .line 336
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 337
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 338
    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 339
    const/4 v0, 0x0

    move v3, v0

    :goto_2
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_5

    .line 340
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 341
    const/4 v5, 0x0

    move v4, v1

    :goto_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v5, v1, :cond_4

    .line 342
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 343
    invoke-static {v1}, Lcom/gemini/chat/Markdown;->hasInlineMarkup(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    const/4 v4, 0x0

    .line 344
    :cond_3
    aget v11, v9, v5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v11, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    aput v1, v9, v5

    .line 341
    add-int/lit8 v1, v5, 0x1

    move v5, v1

    goto :goto_3

    .line 339
    :cond_4
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    move v1, v4

    goto :goto_2

    .line 347
    :cond_5
    const/4 v3, 0x0

    .line 348
    const/4 v0, 0x0

    :goto_4
    if-ge v0, v2, :cond_6

    aget v4, v9, v0

    add-int/2addr v3, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 349
    :cond_6
    add-int/lit8 v0, v2, -0x1

    mul-int/lit8 v0, v0, 0x3

    add-int/2addr v0, v3

    .line 350
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 351
    if-eqz v1, :cond_12

    iget v1, p0, Lcom/gemini/chat/Markdown$Doc;->gridMaxChars:I

    if-gt v0, v1, :cond_12

    .line 352
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v5

    .line 353
    const/4 v0, 0x0

    move v3, v0

    :goto_5
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_10

    .line 354
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 355
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v7

    .line 356
    const/4 v1, 0x0

    move v4, v1

    :goto_6
    if-ge v4, v2, :cond_a

    .line 357
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v4, v1, :cond_7

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 358
    :goto_7
    iget-object v8, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    add-int/lit8 v8, v2, -0x1

    if-ge v4, v8, :cond_9

    .line 360
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

    .line 357
    :cond_7
    const-string v1, ""

    goto :goto_7

    .line 361
    :cond_8
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v8, " | "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    :cond_9
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_6

    .line 364
    :cond_a
    if-nez v3, :cond_b

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/16 v1, 0x12

    invoke-virtual {p0, v7, v0, v1}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 365
    :cond_b
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 366
    if-nez v3, :cond_f

    .line 367
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v4

    .line 368
    const/4 v0, 0x0

    move v1, v0

    :goto_9
    if-ge v1, v2, :cond_e

    .line 369
    const/4 v0, 0x0

    :goto_a
    aget v7, v9, v1

    if-ge v0, v7, :cond_c

    iget-object v7, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v8, 0x2d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 370
    :cond_c
    add-int/lit8 v0, v2, -0x1

    if-ge v1, v0, :cond_d

    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v7, "-+-"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    :cond_d
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_9

    .line 372
    :cond_e
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/16 v1, 0x15

    invoke-virtual {p0, v4, v0, v1}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 373
    iget-object v0, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 353
    :cond_f
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto/16 :goto_5

    .line 376
    :cond_10
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v0

    const/16 v1, 0x11

    invoke-virtual {p0, v5, v0, v1}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 396
    :cond_11
    return v6

    .line 378
    :cond_12
    const/4 v0, 0x0

    move v3, v0

    :goto_b
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_11

    .line 379
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 380
    if-lez v3, :cond_13

    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->gap()V

    .line 381
    :cond_13
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v4

    .line 382
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v5, "\u25aa "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_14

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_c
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 384
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    const/16 v5, 0x13

    invoke-virtual {p0, v4, v1, v5}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 385
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v4, 0xa

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 386
    const/4 v1, 0x1

    move v4, v1

    :goto_d
    if-ge v4, v2, :cond_17

    .line 387
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v5

    .line 388
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

    .line 389
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const-string v9, ": "

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual {p0}, Lcom/gemini/chat/Markdown$Doc;->len()I

    move-result v1

    const/16 v9, 0x14

    invoke-virtual {p0, v5, v1, v9}, Lcom/gemini/chat/Markdown$Doc;->span(III)V

    .line 391
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v4, v1, :cond_16

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_f
    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->inline(Lcom/gemini/chat/Markdown$Doc;Ljava/lang/String;)V

    .line 392
    iget-object v1, p0, Lcom/gemini/chat/Markdown$Doc;->text:Ljava/lang/StringBuilder;

    const/16 v5, 0xa

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 386
    add-int/lit8 v1, v4, 0x1

    move v4, v1

    goto :goto_d

    .line 383
    :cond_14
    const-string v1, ""

    goto :goto_c

    .line 388
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

    .line 391
    :cond_16
    const-string v1, ""

    goto :goto_f

    .line 378
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

    .line 691
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

    .line 692
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

    .line 708
    :goto_1
    return-object v0

    .line 693
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v7, :cond_5

    move v0, p1

    move v1, v2

    .line 695
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_4

    .line 696
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 697
    if-ne v3, v7, :cond_3

    add-int/lit8 v1, v1, 0x1

    .line 695
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 698
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

    .line 700
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

    .line 702
    :cond_5
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_8

    .line 703
    add-int/lit8 v0, p1, 0x1

    .line 704
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

    .line 705
    :cond_6
    add-int/lit8 v1, p1, 0x1

    if-ne v0, v1, :cond_7

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_7

    add-int/lit8 v0, v0, 0x1

    .line 706
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

    .line 708
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

    const/4 v3, 0x0

    .line 718
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 719
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    move v1, v3

    .line 720
    :goto_0
    if-ge v1, v6, :cond_1c

    .line 721
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 722
    if-ne v7, v13, :cond_11

    add-int/lit8 v0, v1, 0x1

    if-ge v0, v6, :cond_11

    .line 723
    add-int/lit8 v0, v1, 0x1

    move v2, v0

    .line 724
    :goto_1
    if-ge v2, v6, :cond_0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLetter(C)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    .line 725
    :cond_0
    add-int/lit8 v0, v1, 0x1

    if-ne v2, v0, :cond_5

    .line 726
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 727
    const/16 v2, 0x2c

    if-eq v0, v2, :cond_1

    const/16 v2, 0x3b

    if-eq v0, v2, :cond_1

    const/16 v2, 0x3a

    if-eq v0, v2, :cond_1

    if-ne v0, v12, :cond_3

    :cond_1
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 730
    :cond_2
    :goto_2
    add-int/lit8 v2, v1, 0x2

    move v1, v2

    .line 731
    goto :goto_0

    .line 728
    :cond_3
    if-ne v0, v13, :cond_4

    const/16 v0, 0xa

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 729
    :cond_4
    const/16 v2, 0x21

    if-eq v0, v2, :cond_2

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 733
    :cond_5
    add-int/lit8 v0, v1, 0x1

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 735
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

    .line 736
    :cond_6
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 737
    aget-object v1, v0, v10

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {p0, v1}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 738
    aget-object v0, v0, v3

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aget-object v1, v2, v3

    invoke-static {v1}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 739
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

    .line 740
    aget-object v0, v2, v10

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    move v1, v2

    .line 741
    goto/16 :goto_0

    .line 739
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

    .line 741
    :cond_9
    const-string v0, "sqrt"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 742
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 743
    aget-object v0, v1, v3

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 744
    const/16 v2, 0x221a

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->simple(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    :goto_5
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 745
    aget-object v0, v1, v10

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    move v1, v2

    .line 746
    goto/16 :goto_0

    .line 744
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

    .line 746
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

    .line 747
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

    .line 748
    :cond_c
    invoke-static {p0, v2}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 749
    const-string v0, "text"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "mbox"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    :cond_d
    aget-object v0, v2, v3

    :goto_6
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 750
    aget-object v0, v2, v10

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    move v1, v2

    .line 751
    goto/16 :goto_0

    .line 749
    :cond_e
    aget-object v0, v2, v3

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 752
    :cond_f
    sget-object v0, Lcom/gemini/chat/Markdown;->TEX_MAP:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 753
    if-eqz v0, :cond_10

    :goto_7
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v2

    .line 755
    goto/16 :goto_0

    :cond_10
    move-object v0, v1

    .line 753
    goto :goto_7

    .line 757
    :cond_11
    if-eq v7, v11, :cond_12

    const/16 v0, 0x5f

    if-ne v7, v0, :cond_19

    .line 758
    :cond_12
    add-int/lit8 v0, v1, 0x1

    invoke-static {p0, v0}, Lcom/gemini/chat/Markdown;->texArg(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 759
    aget-object v0, v1, v3

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->texToText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 760
    aget-object v1, v1, v10

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 761
    if-ne v7, v11, :cond_13

    const-string v1, "\u00b0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 762
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v4

    .line 763
    goto/16 :goto_0

    .line 765
    :cond_13
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move v2, v3

    .line 766
    :goto_8
    if-ne v7, v11, :cond_14

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v2, v8, :cond_14

    .line 767
    const-string v8, "123n"

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 768
    if-gez v8, :cond_15

    .line 769
    const/4 v1, 0x0

    .line 774
    :cond_14
    if-ne v7, v11, :cond_16

    if-eqz v1, :cond_16

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_16

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move v1, v4

    goto/16 :goto_0

    .line 772
    :cond_15
    const-string v9, "\u00b9\u00b2\u00b3\u207f"

    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 766
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 775
    :cond_16
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v10, :cond_17

    invoke-static {v0}, Lcom/gemini/chat/Markdown;->simple(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    :cond_17
    :goto_9
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v4

    .line 776
    goto/16 :goto_0

    .line 775
    :cond_18
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "("

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 778
    :cond_19
    const/16 v0, 0x7b

    if-eq v7, v0, :cond_1a

    const/16 v0, 0x7d

    if-ne v7, v0, :cond_1b

    .line 779
    :cond_1a
    add-int/lit8 v2, v1, 0x1

    move v1, v2

    .line 780
    goto/16 :goto_0

    .line 782
    :cond_1b
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 783
    add-int/lit8 v2, v1, 0x1

    move v1, v2

    .line 784
    goto/16 :goto_0

    .line 785
    :cond_1c
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
