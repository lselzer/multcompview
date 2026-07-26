# Letter summary of similarities and differences

Convert a logical vector or a vector of p-values or a correlation or
distance matrix into a character-based display in which common
characters identify levels or groups that are not significantly
different. Designed for use with the output of functions like TukeyHSD,
diststats, simint, simtest, csimint, csimtestmultcomp, friedmanmc,
kruskalmcpgirmess.

## Usage

``` r
multcompLetters(
  x,
  compare = "<",
  threshold = 0.05,
  Letters = c(letters, LETTERS, "."),
  reversed = FALSE
)

multcompLetters2(formula, x, data, ...)

multcompLetters3(z, y, x, data, ...)

multcompLetters4(object, comp, ...)
```

## Arguments

  - x:
    
    One of the following: (1) A square, symmetric matrix with row names.
    (2) A vector with hyphenated names, which identify individual items
    or factor levels after "strsplit". (3) An object of class "dist". If
    x (or x\[1\]) is not already of class "logical", it is replaced with
    do.call(compare, list(x, threshold)), which by default converts
    numbers (typically p-values) less than 0.05 to TRUE and everything
    else to FALSE. If x is a matrix, its diagonal must be or must
    convert to FALSE.

  - compare:
    
    function or binary operator; not used if class(x) is "logical".

  - threshold:
    
    Second (reference) argument to "compare".

  - Letters:
    
    Vector of distinct characters (or character strings) used to connect
    levels that are not significantly different. They should be
    recognizable when concatenated. The last element of "Letters" is
    used as a prefix for a reuse of "Letters" if more are needed than
    are provided. For example, with the default "Letters", if 53
    distinct connection columns are required, they will be "a", ...,
    "z", "A", ..., "Z", and ".a". If 54 are required, the last one will
    be ".b". If 105 are required, the last one will be "..a", etc. (If
    the algorithm generates that many distinct groups, the display may
    be too busy to be useful, but the algorithm shouldn't break.)

  - reversed:
    
    A logical value indicating whether the order of the letters should
    be reversed. Defaults to FALSE.

  - formula:
    
    The formula used to make the test (lm, aov, glm, etc.). Like y \~ x.

  - data:
    
    Data used to make the test.

  - ...:
    
    Extra arguments passed to multcompLetters.

  - z:
    
    Categorical variables used in the test.

  - y:
    
    Value of the response variable.

  - object:
    
    An object of class aov or lm for the time being.

  - comp:
    
    A object with multiple comparison or a function name to perform a
    multiple comparison.

## Value

An object of class 'multcompLetters', which is a list with the following
components:

  - Letters :
    
    character vector with names = the names of the levels or groups
    compared and with values = character strings in which common values
    of the function argument "Letters" identify levels or groups that
    are not significantly different (or more precisely for which the
    corresponding element of "x" was FALSE or was converted to FALSE by
    "compare").

  - monospacedLetters :
    
    Same as "Letters" but with spaces so the individual grouping letters
    will line up with a monospaced type font.

  - LetterMatrix :
    
    Logical matrix with one row for each level compared and one column
    for each "Letter" in the "letter-based representation". The output
    component "Letters" is obtained by concatenating the column names of
    all columns with TRUE in that row.

multcompLetters4 will return a named list with the terms containing a
object of class 'multcompLetters' as produced by `multcompLetters`.

## Details

Produces a "Letter-Based Representation of All- Pairwise Comparisons" as
described by Piepho (2004). (The present algorithm does NOT perform his
"sweeping" step.) `multcompLettersx` are wrapper of multcompLetters that
will reorder the levels of the data so that the letters appear in a
descending order of the mean. `mulcompletters3` is similar to
`multcompletters2` except that it uses vector names to separate and the
later has an formula interface. `multcompLetters4` will take a aov or lm
object and a comparison test and will produce all the letters for the
terms and interactions.

## Functions

  - `multcompLetters2()`:

  - `multcompLetters3()`: create a compact letters display and order the
    letters

  - `multcompLetters4()`: create a compact letters display using a aov
    object

## References

Piepho, Hans-Peter (2004) "An Algorithm for a Letter-Based
Representation of All-Pairwise Comparisons", Journal of Computational
and Graphical Statistics, 13(2)456-466.

## See also

`multcompBoxplot` `plot.multcompLetters` `print.multcompLetters`
`multcompTs` `vec2mat`

## Author

Spencer Graves, Hans-Peter Piepho and Luciano Selzer

## Examples

``` r
##
## 1.  a logical vector indicating signficant differences
##
dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("A-B", "A-C", "B-C")
dif3L <- multcompLetters(dif3)
dif3L
#>    A    B    C 
#> "ab"  "a"  "b" 
print(dif3L)
#>    A    B    C 
#> "ab"  "a"  "b" 
print(dif3L, TRUE)
#> $Letters
#>    A    B    C 
#> "ab"  "a"  "b" 
#> 
#> $monospacedLetters
#>    A    B    C 
#> "ab" "a " " b" 
#> 
#> $LetterMatrix
#>       a     b
#> A  TRUE  TRUE
#> B  TRUE FALSE
#> C FALSE  TRUE
#> 

##
## 2.  numeric vector indicating statistical significance
##
dif4 <- c(.01, .02, .03, 1)
names(dif4) <- c("a-b", "a-c", "b-d", "a-d")
(diff4.T <- multcompLetters(dif4))
#>    a    b    c    d 
#>  "a"  "b" "bc" "ac" 

(dif4.L1 <- multcompLetters(dif4,
       Letters=c("*", ".")))
#>       a       b       c       d 
#>     "*"    ".*" ".*..*"  "*..*" 
# "Letters" can be any character strings,
# but they should be recognizable when
# concatenated.

##
## 3.  distance matrix
##
dJudge <- dist(USJudgeRatings)
dJl <- multcompLetters(dJudge, compare='>', threshold = median(dJudge))
# comparison of 43 judges;  compact but undecipherable:
dJl
#>    AARONSON,L.H.   ALEXANDER,J.M.   ARMENTANO,A.J.      BERDON,R.I. 
#>        "abcdefg"        "abhijkl" "abcdefghijmnop"            "hkl" 
#>     BRACKEN,J.J.       BURNS,E.B.    CALLAHAN,R.J.       COHEN,S.S. 
#>             "qr"        "abhijkl"              "s"              "q" 
#>        DALY,J.J.     DANNEHY,J.F.        DEAN,H.H.      DEVITA,H.J. 
#>           "hikl"         "hijmno"  "abcdefgjmnopt"          "cdfpt" 
#>    DRISCOLL,P.J.      GRILLO,A.E.   HADDEN,W.L.JR.      HAMILL,E.C. 
#>         "acdefp"            "tuv"     "abceghijmn" "abcdefgjmnoptu" 
#>      HEALEY.A.H.        HULL,T.C.        LEVINE,I.    LEVISTER,R.L. 
#>           "ptuw"    "cdefgmnoptu"   "abcefghijmno"             "wx" 
#>      MARTIN,L.F.     MCGRATH,J.F.     MIGNONE,A.F.      MISSAL,H.M. 
#>         "cdfptu"          "dptuw"             "rv"    "abcdefgjmno" 
#>      MULVEY,H.M.       NARUK,H.J.     O'BRIEN,F.J.  O'SULLIVAN,T.J. 
#>          "hikls"            "kls"   "abceghijklmn"          "hikls" 
#>        PASKEY,L.     RUBINOW,J.E.       SADEN.G.A.  SATANIELLO,A.G. 
#>    "abeghijklmn"              "k"        "bghijmn"    "abcefgijmno" 
#>        SHEA,D.M.     SHEA,J.F.JR.       SIDOR,W.J.    SPEZIALE,J.A. 
#>         "hijklm"           "hikl"            "qrx"       "hijklmns" 
#>      SPONZO,M.J.   STAPLETON,J.F.       TESTO,R.J.  TIERNEY,W.L.JR. 
#>     "abceghijmn"   "abcefghijmno"        "dfoptuw"         "hijlmn" 
#>        WALL,R.A.      WRIGHT,D.B.    ZARRILLI,K.J. 
#>             "uw"   "abceghijklmn"     "cdefgnoptu" 

x <- array(1:9, dim=c(3,3),
   dimnames=list(LETTERS[1:3], NULL) )
d3 <- dist(x)
dxLtrs <- multcompLetters(d3, compare=">", threshold=2)

d3d <- dist(x, diag=TRUE)
dxdLtrs <- multcompLetters(d3d, compare=">", threshold=2)

all.equal(dxLtrs, dxdLtrs)
#> [1] TRUE


d3u <- dist(x, upper=TRUE)
dxuLtrs <- multcompLetters(d3u, compare=">", threshold=2)

all.equal(dxLtrs, dxuLtrs)
#> [1] TRUE

##
## 4.  cor matrix
##
set.seed(4)
x100 <- matrix(rnorm(100), ncol=5,
               dimnames=list(NULL, LETTERS[1:5]) )
cx <- cor(x100)
cxLtrs <- multcompLetters(abs(cx), threshold=.3)


##
##5. reversed
##

dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("A-B", "A-C", "B-C")
dif3L <- multcompLetters(dif3)
dif3L.R <- multcompLetters(dif3, reversed = TRUE)
dif3L
#>    A    B    C 
#> "ab"  "a"  "b" 
dif3L.R
#>    A    B    C 
#> "ab"  "b"  "a" 


##
##6. multcompletters2 usage

experiment <- data.frame(treatments = gl(11, 20, labels = c("dtl", "ctrl", "treat1", 
              "treat2", "treatA2", "treatB", "treatB2",
              "treatC", "treatD", "treatA1", "treatX")),
              y = c(rnorm(20, 10, 5), rnorm(20, 20, 5), rnorm(20, 22, 5), rnorm(20, 24, 5),
               rnorm(20, 35, 5), rnorm(20, 37, 5), rnorm(20, 40, 5), rnorm(20, 43, 5),
               rnorm(20, 45, 5), rnorm(20, 60, 5), rnorm(20, 60, 5)))
exp_tukey <- TukeyHSD(exp_aov <- aov(y  ~ treatments, data = experiment))
exp_letters1 <- multcompLetters(exp_tukey$treatments[,4])
exp_letters1
#>    ctrl  treat1  treat2 treatA2  treatB treatB2  treatC  treatD treatA1  treatX 
#>     "a"     "a"     "a"     "b"    "bc"    "cd"    "de"     "e"     "f"     "f" 
#>     dtl 
#>     "g" 
#Notice lowest mean treatments gets a "e"
#Ordered letters
multcompLetters2(y ~ treatments, exp_tukey$treatments[,"p adj"], experiment)
#>  treatX treatA1  treatD  treatC treatB2  treatB treatA2  treat2  treat1    ctrl 
#>     "a"     "a"     "b"    "bc"    "cd"    "de"     "e"     "f"     "f"     "f" 
#>     dtl 
#>     "g" 
multcompLetters2(y ~ treatments, exp_tukey$treatments[,"p adj"], experiment, reversed = TRUE)
#>  treatX treatA1  treatD  treatC treatB2  treatB treatA2  treat2  treat1    ctrl 
#>     "g"     "g"     "f"    "ef"    "de"    "cd"     "c"     "b"     "b"     "b" 
#>     dtl 
#>     "a" 

##7. multcompletters3 usage

multcompLetters3("treatments", "y", exp_tukey$treatments[,"p adj"], experiment)
#>  treatX treatA1  treatD  treatC treatB2  treatB treatA2  treat2  treat1    ctrl 
#>     "a"     "a"     "b"    "bc"    "cd"    "de"     "e"     "f"     "f"     "f" 
#>     dtl 
#>     "g" 

##8. multcompletters4 usage


multcompLetters4(exp_aov, exp_tukey)
#> $treatments
#>  treatX treatA1  treatD  treatC treatB2  treatB treatA2  treat2  treat1    ctrl 
#>     "a"     "a"     "b"    "bc"    "cd"    "de"     "e"     "f"     "f"     "f" 
#>     dtl 
#>     "g" 
#> 

```
