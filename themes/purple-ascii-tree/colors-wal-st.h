const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1e1e0c", /* black   */
  [1] = "#3D445A", /* red     */
  [2] = "#484C71", /* green   */
  [3] = "#553E86", /* yellow  */
  [4] = "#5E569B", /* blue    */
  [5] = "#686EB1", /* magenta */
  [6] = "#766ACB", /* cyan    */
  [7] = "#c6c6c2", /* white   */

  /* 8 bright colors */
  [8]  = "#70705c",  /* black   */
  [9]  = "#3D445A",  /* red     */
  [10] = "#484C71", /* green   */
  [11] = "#553E86", /* yellow  */
  [12] = "#5E569B", /* blue    */
  [13] = "#686EB1", /* magenta */
  [14] = "#766ACB", /* cyan    */
  [15] = "#c6c6c2", /* white   */

  /* special colors */
  [256] = "#1e1e0c", /* background */
  [257] = "#c6c6c2", /* foreground */
  [258] = "#c6c6c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
