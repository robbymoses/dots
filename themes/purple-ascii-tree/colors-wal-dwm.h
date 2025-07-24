static const char norm_fg[] = "#c6c6c2";
static const char norm_bg[] = "#1e1e0c";
static const char norm_border[] = "#70705c";

static const char sel_fg[] = "#c6c6c2";
static const char sel_bg[] = "#3D445A";
static const char sel_border[] = "#c6c6c2";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
