# print a multcompLetters object

print method for an object of class 'multcompLetters'.

## Usage

``` r
# S3 method for class 'multcompLetters'
print(x, all = FALSE, ...)
```

## Arguments

  - x:
    
    an object of class 'multcompLetters'

  - all:
    
    FALSE to print only the character vector representations of the
    'multcompLetters' comparison summary; TRUE to print also the matrix
    representation.

  - ...:
    
    Other optional print parameters as described on the `print` help
    page.

## Value

the named, character vector representation of the 'multcompLetters'
evaluation of the distance relationships

## Details

Prints only the Letters component of the 'multcompLetters' list unless
all=TRUE.

## See also

`multcompLetters`

## Author

Spencer Graves

## Examples

``` r
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
```
