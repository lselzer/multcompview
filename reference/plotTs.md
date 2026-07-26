# plot multcomp displays

Helper functions for plot.multcompTs and plot.multcompLetters. These not
intended to be called directly and are hidden in a namespace. You can
use 'getAnywhere' to see them.

## Usage

``` r
plotTs(
  obj,
  at,
  width,
  horizontal,
  col,
  add,
  lwd,
  label.levels,
  label.groups,
  T.base,
  orientation = "",
  ...
)
```

## Arguments

  - obj:
    
    a matrix describing which levels (rows) will be plotted with which
    groups (columns). For plotTs and plotBoxes, obj is a matrix of
    numbers from (-1, 0, 1). For plotLetters, obj is a logical matrix =
    TRUE if that "letter" (group or column of obj) is to be plotted with
    that level (row of obj).

  - at:
    
    an array with one row for each level and 3 columns giving low,
    middle and high levels for the display for that level.

  - width:
    
    an array with one row for each group of levels in the display and 3
    columns giving low, middle and high levels for the display for that
    group.

  - horizontal:
    
    A logical scalar indicating whether the list of items compared reads
    left to right (horizontal = TRUE) or top to bottom (horizontal =
    FALSE). If this multcomp graphic accompanies boxplots for different
    levels or groups compared, the 'boxplot' argument 'horizontal' is
    the negation of the multcomp plot 'horizontal' argument.

  - col:
    
    The color for each group of items or factor levels. The colors will
    cross the different items or factor levels and will therefore have
    the orientation specified via 'horizontal'. If the number of columns
    exceeds length(col), col is recycled. For alternative choices for
    col, see "Color Specification" in the `par` help page.

  - add:
    
    TRUE to add to an existing plot; FALSE to start a new plot. The
    names of the factor levels or items compared will be plotted only if
    add=FALSE.

  - lwd:
    
    line width for the display outline.

  - label.levels:
    
    Distance from the plot region to print the names of the levels as a
    proportion of the plot range; NA for no level labels.

  - label.groups:
    
    Distance from the plot region to print the names of the groups as a
    proportion of the plot range; NA for no level labels.

  - T.base:
    
    A numeric scalar giving the proportion of the available space
    devoted to the base of the Ts.

  - orientation:
    
    If 'reversed', the base(s) of each "T" or triangle indicating the
    master level(s) of that "undifferentiated class" will point right or
    up (depending on horizontal) rather than down or left.

  - ...:
    
    graphical parameters can be given as described on the `plot` help
    page or the `gpar` help page.

## Value

"Done"

## Details

The requested graphic is either plotted by itself or added to an
existing plot as specified by the arguments.

"plotTs" and "plotBoxes" use traditional R graphics and will not be
discussed further here.

"plotLetters" uses 'grid' graphics, because it seems to provide more
support for controlling the side-by-side placement of "Letters" of
possibly different colors and widths. The "Letters" display will be
positioned in the "plot region" defined by fig and mar, assuming the
entire device region is 37 lines both wide and tall. Thus, the plot
region is diff(fig\[1:2\])\*37 lines wide and diff(fig(1:2\])\*37 lines
high. If, for example, fig = c(0.9, 1, 0, 1), this makes the plot region
3.7 lines wide. With the default mar=c(5, 4, 4, 2)+0.1 lines, the
"width" of the plot region is therefore 3.7 - (4.1+2.1) = (-2.5) lines.
"plotLetters" initially ignores this contradictory negative width, and
centers the plot at the midpoint of h0 = fig\[1\]+mar\[2\]/37, h1 =
fig\[2\]-mar\[4\]/37, v0 = fig\[3\]+mar\[1\]/37, and v1 =
fig\[4\]-mar\[3\]/37. The "Letters" for the different levels compared
are rescaled from at\[, "center"\] to fit inside At.rng = if(horizontal)
c(h0, h1) else c(v0, v1). With "n" levels compared and at.rng =
range(at\[, "center"\]), at\[, "center"\] is expanded to (at.rng+/-0.5)
and rescaled to match At.rng; if(diff(At.rng)\<=0), an error message is
issued.

Meanwhile, the "Letters" are centered at the midpoint of W.rng =
if(horizontal) c(v0, v1) else v(h0, h1) \[the opposite of At.rng\]; the
argument "width" used by plotTs and plotBoxes is not used (and not even
accepted) by plotLetters. If(label.levels), these are positioned in the
midpoint of the right margin in the "W" direction.

## See also

`plot.multcompTs` `plot.multcompLetters` `gpar`

## Author

Spencer Graves

## Examples

``` r
# Designed to be called from plot.multcompTs
# or plot.multcompLetters, NOT directly by users.  
```
