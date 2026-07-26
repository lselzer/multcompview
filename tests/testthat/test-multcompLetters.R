test_that("multcompLetters works with logical vector", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("A-B", "A-C", "B-C")
  
  res <- multcompLetters(dif3)
  
  expect_s3_class(res, "multcompLetters")
  expect_named(res$Letters)
  expect_true(all(c("A", "B", "C") %in% names(res$Letters)))
})

test_that("multcompLetters works with p-values", {
  dif4 <- c(0.01, 0.02, 0.03, 1)
  names(dif4) <- c("a-b", "a-c", "b-d", "a-d")
  
  res <- multcompLetters(dif4)
  expect_s3_class(res, "multcompLetters")
})

test_that("multcompLetters is consistent across dist options", {
  x <- array(1:9, dim = c(3, 3), dimnames = list(LETTERS[1:3], NULL))
  d3  <- dist(x)
  d3d <- dist(x, diag = TRUE)
  d3u <- dist(x, upper = TRUE)
  
  r1 <- multcompLetters(d3,  compare = ">", threshold = 2)
  r2 <- multcompLetters(d3d, compare = ">", threshold = 2)
  r3 <- multcompLetters(d3u, compare = ">", threshold = 2)
  
  expect_equal(r1, r2)
  expect_equal(r1, r3)
})

test_that("reversed argument works", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("A-B", "A-C", "B-C")
  
  normal   <- multcompLetters(dif3)
  reversed <- multcompLetters(dif3, reversed = TRUE)
  
  expect_s3_class(reversed, "multcompLetters")
  expect_false(identical(normal$Letters, reversed$Letters))
})

test_that("multcompLetters2 and multcompLetters3 work", {
  set.seed(1)
  experiment <- data.frame(
    treatments = gl(4, 15, labels = c("A", "B", "C", "D")),
    y = c(rnorm(15, 10), rnorm(15, 12), rnorm(15, 20), rnorm(15, 21))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  res2 <- multcompLetters2(y ~ treatments, tuk$treatments[, "p adj"], experiment)
  res3 <- multcompLetters3("treatments", "y", tuk$treatments[, "p adj"], experiment)
  
  expect_s3_class(res2, "multcompLetters")
  expect_s3_class(res3, "multcompLetters")
})

test_that("multcompLetters4 works", {
  set.seed(1)
  experiment <- data.frame(
    treatments = gl(4, 15, labels = c("A", "B", "C", "D")),
    y = c(rnorm(15, 10), rnorm(15, 12), rnorm(15, 20), rnorm(15, 21))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  res4 <- multcompLetters4(fit, tuk)
  expect_type(res4, "list")
  expect_s3_class(res4$treatments, "multcompLetters")
})

test_that("multcompLetters returns object of class multcompLetters", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("A-B", "A-C", "B-C")
  
  res <- multcompLetters(dif3)
  
  expect_s3_class(res, "multcompLetters")
  expect_type(res, "list")
  expect_named(res, c("Letters", "monospacedLetters", "LetterMatrix"))
  expect_type(res$Letters, "character")
  expect_true(is.matrix(res$LetterMatrix))
  expect_type(res$LetterMatrix, "logical")
})

test_that("multcompLetters2 returns class multcompLetters", {
  set.seed(123)
  experiment <- data.frame(
    treatments = gl(4, 12, labels = c("A", "B", "C", "D")),
    y = c(rnorm(12, 10), rnorm(12, 12), rnorm(12, 20), rnorm(12, 22))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  res <- multcompLetters2(y ~ treatments, tuk$treatments[, "p adj"], experiment)
  
  expect_s3_class(res, "multcompLetters")
})

test_that("multcompLetters3 returns class multcompLetters", {
  set.seed(123)
  experiment <- data.frame(
    treatments = gl(4, 12, labels = c("A", "B", "C", "D")),
    y = c(rnorm(12, 10), rnorm(12, 12), rnorm(12, 20), rnorm(12, 22))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  res <- multcompLetters3("treatments", "y", tuk$treatments[, "p adj"], experiment)
  
  expect_s3_class(res, "multcompLetters")
})

test_that("multcompLetters4 returns a list of multcompLetters objects", {
  set.seed(123)
  experiment <- data.frame(
    treatments = gl(4, 12, labels = c("A", "B", "C", "D")),
    y = c(rnorm(12, 10), rnorm(12, 12), rnorm(12, 20), rnorm(12, 22))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  res <- multcompLetters4(fit, tuk)
  
  expect_type(res, "list")
  expect_true(all(vapply(res, function(x) inherits(x, "multcompLetters"), logical(1))))
})

test_that("print.multcompLetters works and returns character vector", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("A-B", "A-C", "B-C")
  res <- multcompLetters(dif3)
  
  # print returns the Letters invisibly
  printed <- print(res)
  expect_type(printed, "character")
  expect_named(printed)
})
