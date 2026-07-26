# Convert a vector with hyphenated names into a matrix.

Convert a vector with hypehnated names into a symmetric matrix with
names

## Usage

``` r
vec2mat(x, sep = "-")
```

## Arguments

  - x:
    
    Either (1) a vector with hyphenated names indicating pairs of factor
    levels, groups or items that are and are not significantly different
    or (2) a matrix indicating same. If x is already a matrix, it is
    checked for symmetry. NAs are not allowed.

  - sep:
    
    "strsplit" character to apply to names(x).

## Value

A symmetric matrix of the same class as the input with names obtained
from unique(strsplit(names(x))). All nonspecified elements will be 1 if
class(x) is numeric, FALSE if logical and "" if character. Used by the
functions 'multcompLetters' and 'multcompTs'.

## Details

x must have names each of which contains exactly one hyphen; if not,
vec2mat issues an error message. If the same comparison is present
multiple times, the last value is used; no check is made for duplicates.

## See also

`multcompLetters` `multcompTs`

## Author

Spencer Graves

## Examples

``` r
dif3 <- c(FALSE, FALSE, TRUE)
names(dif3) <- c("a-b", "a-c", "b-c")
vec2mat(dif3)
#>       a     b     c
#> a FALSE FALSE FALSE
#> b FALSE FALSE  TRUE
#> c FALSE  TRUE FALSE

dif3. <- 1:3
names(dif3.) <- c("a-b", "a-c", "b-c")
vec2mat(dif3.)
#>   a b c
#> a 1 1 2
#> b 1 1 3
#> c 2 3 1

dif.ch <- c("this",'is','it')
names(dif.ch) <- c("a-b", "a-c", "b-c")
vec2mat(dif.ch)
#>   a      b      c   
#> a ""     "this" "is"
#> b "this" ""     "it"
#> c "is"   "it"   ""  

vec2mat(array(1, dim=c(2,2)))
#>      [,1] [,2]
#> [1,]    1    1
#> [2,]    1    1
#> Error in vec2mat(array(1:24, dim = 2:4)) : 
#>   Array of dim(2, 3, 4) not allowed for array(1:24, dim = 2:4)
#> Error in vec2mat(array(1:6, dim = 2:3)) : 
#>   Array of dim(2, 3) not allowed for array(1:6, dim = 2:3)
#> Error in vec2mat(array(1:4, dim = c(2, 2))) : 
#>   Matrix not symmetric array(1:4, dim = c(2, 2))
#> Error in vec2mat(c(1:3, NA)) : 1 NAs not allowed, found in c(1:3, NA)
#> Error in vec2mat(1:3) : Names required for 1:3
#> Error in vec2mat2(namx, sep) : 
#>   Names must contain exactly one '-' each;  instead got a, b-a, b-c
#> Error in vec2mat2(namx, sep) : 
#>   Names must contain exactly one '-' each;  instead got a-c, b-a, b-c-d
```
