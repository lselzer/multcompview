# Extracts p-values

For a given object it will look for the column named "p adj" or
"difference" and extract its value keeping its names

## Usage

``` r
extract_p(x)

# Default S3 method
extract_p(x)

# S3 method for class 'TukeyHSD'
extract_p(x)

# S3 method for class 'mc'
extract_p(x)
```

## Arguments

  - x:
    
    A object that has p-values or logical values.

## Value

A named vector with p-values or logical values.

## Methods (by class)

  - `extract_p(default)`:

  - `extract_p(TukeyHSD)`: extract p values from a TukeyHSD object

  - `extract_p(mc)`:

## See also

`multcompLetters` `multcompTs`

## Author

Luciano Selzer

## Examples

``` r
experiment <- data.frame(treatments = gl(11, 20, labels = c("dtl", "ctrl", "treat1", 
              "treat2", "treatA2", "treatB", "treatB2",
              "treatC", "treatD", "treatA1", "treatX")),
              y = c(rnorm(20, 10, 5), rnorm(20, 20, 5), rnorm(20, 22, 5), rnorm(20, 24, 5),
               rnorm(20, 35, 5), rnorm(20, 37, 5), rnorm(20, 40, 5), rnorm(20, 43, 5),
               rnorm(20, 45, 5), rnorm(20, 60, 5), rnorm(20, 60, 5)))
exp_tukey <- TukeyHSD(exp_aov <- aov(y  ~ treatments, data = experiment))

extract_p(exp_tukey)
#> $treatments
#>        ctrl-dtl      treat1-dtl      treat2-dtl     treatA2-dtl      treatB-dtl 
#>    1.449127e-09    2.071676e-13    8.482104e-14    0.000000e+00    0.000000e+00 
#>     treatB2-dtl      treatC-dtl      treatD-dtl     treatA1-dtl      treatX-dtl 
#>    0.000000e+00    0.000000e+00    0.000000e+00    0.000000e+00    0.000000e+00 
#>     treat1-ctrl     treat2-ctrl    treatA2-ctrl     treatB-ctrl    treatB2-ctrl 
#>    9.053584e-01    2.199649e-01    8.504308e-14    9.081624e-14    0.000000e+00 
#>     treatC-ctrl     treatD-ctrl    treatA1-ctrl     treatX-ctrl   treat2-treat1 
#>    0.000000e+00    0.000000e+00    0.000000e+00    0.000000e+00    9.881220e-01 
#>  treatA2-treat1   treatB-treat1  treatB2-treat1   treatC-treat1   treatD-treat1 
#>    1.147971e-13    3.318679e-12    5.506706e-14    0.000000e+00    0.000000e+00 
#>  treatA1-treat1   treatX-treat1  treatA2-treat2   treatB-treat2  treatB2-treat2 
#>    0.000000e+00    0.000000e+00    3.184941e-11    2.915289e-09    9.436896e-14 
#>   treatC-treat2   treatD-treat2  treatA1-treat2   treatX-treat2  treatB-treatA2 
#>    0.000000e+00    0.000000e+00    0.000000e+00    0.000000e+00    9.995551e-01 
#> treatB2-treatA2  treatC-treatA2  treatD-treatA2 treatA1-treatA2  treatX-treatA2 
#>    6.057976e-01    1.138772e-03    3.761067e-04    0.000000e+00    0.000000e+00 
#>  treatB2-treatB   treatC-treatB   treatD-treatB  treatA1-treatB   treatX-treatB 
#>    1.558948e-01    4.115310e-05    1.161865e-05    0.000000e+00    0.000000e+00 
#>  treatC-treatB2  treatD-treatB2 treatA1-treatB2  treatX-treatB2   treatD-treatC 
#>    4.583470e-01    2.894728e-01    0.000000e+00    3.219647e-14    1.000000e+00 
#>  treatA1-treatC   treatX-treatC  treatA1-treatD   treatX-treatD  treatX-treatA1 
#>    4.996004e-14    1.032507e-13    6.639134e-14    1.633138e-13    6.433673e-01 
#> 

if(require(pgirmess)){
extract_p(kruskalmc(y ~ treatments, data = experiment))
}
#> Loading required package: pgirmess
#>        dtl-ctrl      dtl-treat1      dtl-treat2     dtl-treatA2      dtl-treatB 
#>           FALSE           FALSE           FALSE            TRUE            TRUE 
#>     dtl-treatB2      dtl-treatC      dtl-treatD     dtl-treatA1      dtl-treatX 
#>            TRUE            TRUE            TRUE            TRUE            TRUE 
#>     ctrl-treat1     ctrl-treat2    ctrl-treatA2     ctrl-treatB    ctrl-treatB2 
#>           FALSE           FALSE            TRUE           FALSE            TRUE 
#>     ctrl-treatC     ctrl-treatD    ctrl-treatA1     ctrl-treatX   treat1-treat2 
#>            TRUE            TRUE            TRUE            TRUE           FALSE 
#>  treat1-treatA2   treat1-treatB  treat1-treatB2   treat1-treatC   treat1-treatD 
#>           FALSE           FALSE            TRUE            TRUE            TRUE 
#>  treat1-treatA1   treat1-treatX  treat2-treatA2   treat2-treatB  treat2-treatB2 
#>            TRUE            TRUE           FALSE           FALSE            TRUE 
#>   treat2-treatC   treat2-treatD  treat2-treatA1   treat2-treatX  treatA2-treatB 
#>            TRUE            TRUE            TRUE            TRUE           FALSE 
#> treatA2-treatB2  treatA2-treatC  treatA2-treatD treatA2-treatA1  treatA2-treatX 
#>           FALSE           FALSE           FALSE            TRUE            TRUE 
#>  treatB-treatB2   treatB-treatC   treatB-treatD  treatB-treatA1   treatB-treatX 
#>           FALSE           FALSE           FALSE            TRUE            TRUE 
#>  treatB2-treatC  treatB2-treatD treatB2-treatA1  treatB2-treatX   treatC-treatD 
#>           FALSE           FALSE            TRUE           FALSE           FALSE 
#>  treatC-treatA1   treatC-treatX  treatD-treatA1   treatD-treatX  treatA1-treatX 
#>           FALSE           FALSE           FALSE           FALSE           FALSE 

```
