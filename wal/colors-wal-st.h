const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0B1627", /* black   */
  [1] = "#115D9F", /* red     */
  [2] = "#2D72AD", /* green   */
  [3] = "#4C90C4", /* yellow  */
  [4] = "#6DC9F0", /* blue    */
  [5] = "#98B2C4", /* magenta */
  [6] = "#A9D8EE", /* cyan    */
  [7] = "#dfeaef", /* white   */

  /* 8 bright colors */
  [8]  = "#9ca3a7",  /* black   */
  [9]  = "#115D9F",  /* red     */
  [10] = "#2D72AD", /* green   */
  [11] = "#4C90C4", /* yellow  */
  [12] = "#6DC9F0", /* blue    */
  [13] = "#98B2C4", /* magenta */
  [14] = "#A9D8EE", /* cyan    */
  [15] = "#dfeaef", /* white   */

  /* special colors */
  [256] = "#0B1627", /* background */
  [257] = "#dfeaef", /* foreground */
  [258] = "#dfeaef",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
