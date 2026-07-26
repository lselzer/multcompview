# Convert a vector of hyphenated names into a character matrix.

Convert a vector of hyphenated names into a character matrix with 2
columns containing the names split in each row.

## Usage

``` r
vec2mat2(x, sep = "-")
```

## Arguments

  - x:
    
    Vector of hyphenated names

  - sep:
    
    "strsplit" character to apply to names(x).

## Value

A character matrix with rownames = x and with the character string
preceding the "sep" character in the first column and the character
string following the "sep" character in the second column.

## Details

If each element of x does not contain exactly 1 "sep" character, an
error is issued.

## See also

`vec2mat` `multcompLetters`

## Author

Spencer Graves

## Examples

``` r
vec2mat2(c("a-b", "a-c", "b-c"))
#>     [,1] [,2]
#> a-b "a"  "b" 
#> a-c "a"  "c" 
#> b-c "b"  "c" 

vec2mat2(c("a-b", "b-a"))
#>     [,1] [,2]
#> a-b "a"  "b" 
#> b-a "b"  "a" 

#> Error in vec2mat2(c("a", "b-a", "b-c")) : 
#>   Names must contain exactly one '-' each;  instead got a, b-a, b-c
#> Error in vec2mat2(c("a-c", "b-a", "b-c-d")) : 
#>   Names must contain exactly one '-' each;  instead got a-c, b-a, b-c-d
```
