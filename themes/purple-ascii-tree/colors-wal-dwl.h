/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x1e1e0cff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc6c6c2ff, 0x1e1e0cff, 0x70705cff },
	[SchemeSel]  = { 0xc6c6c2ff, 0x484C71ff, 0x3D445Aff },
	[SchemeUrg]  = { 0xc6c6c2ff, 0x3D445Aff, 0x484C71ff },
};
