static const char norm_fg[] = "#dfeaef";
static const char norm_bg[] = "#0B1627";
static const char norm_border[] = "#9ca3a7";

static const char sel_fg[] = "#dfeaef";
static const char sel_bg[] = "#2D72AD";
static const char sel_border[] = "#dfeaef";

static const char urg_fg[] = "#dfeaef";
static const char urg_bg[] = "#115D9F";
static const char urg_border[] = "#115D9F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
