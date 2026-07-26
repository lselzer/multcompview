test_that("multcompTs works with logical vector", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("a-b", "a-c", "b-c")
  
  result <- multcompTs(dif3)
  expect_s3_class(result, "multcompTs")
})

test_that("multcompTs is consistent with dist options", {
  x <- array(1:9, dim = c(3, 3), dimnames = list(LETTERS[1:3], NULL))
  d3  <- dist(x)
  d3d <- dist(x, diag = TRUE)
  d3u <- dist(x, upper = TRUE)
  
  dxTs  <- multcompTs(d3,  compare = ">", threshold = 2)
  dxdTs <- multcompTs(d3d, compare = ">", threshold = 2)
  dxuTs <- multcompTs(d3u, compare = ">", threshold = 2)
  
  expect_equal(dxTs, dxdTs)
  expect_equal(dxTs, dxuTs)
})

test_that("multcompTs returns object of class multcompTs", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("a-b", "a-c", "b-c")
  
  res <- multcompTs(dif3)
  
  expect_s3_class(res, "multcompTs")
  expect_true(is.matrix(res))
  expect_true(all(res %in% c(-1, 0, 1)))
})

test_that("multcompTs with p-values returns correct class", {
  dif4 <- c(0.01, 0.02, 0.03, 1)
  names(dif4) <- c("a-b", "a-c", "b-d", "a-d")
  
  res <- multcompTs(dif4)
  expect_s3_class(res, "multcompTs")
})
