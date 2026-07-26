test_that("vec2mat works with logical vector", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("a-b", "a-c", "b-c")
  
  m <- vec2mat(dif3)
  
  expect_true(is.matrix(m))
  expect_equal(dim(m), c(3, 3))
  expect_equal(unname(diag(m)), c(FALSE, FALSE, FALSE))
  expect_equal(m["a", "b"], FALSE)
  expect_equal(m["b", "c"], TRUE)
})

test_that("vec2mat works with numeric vector", {
  dif3 <- 1:3
  names(dif3) <- c("a-b", "a-c", "b-c")
  
  m <- vec2mat(dif3)
  expect_equal(m["a", "b"], 1)
  expect_equal(m["b", "c"], 3)
})

test_that("vec2mat works with character vector", {
  dif.ch <- c("this", "is", "it")
  names(dif.ch) <- c("a-b", "a-c", "b-c")
  
  m <- vec2mat(dif.ch)
  expect_equal(m["a", "b"], "this")
})

test_that("vec2mat rejects invalid input", {
  expect_error(vec2mat(1:3), "Names required")
  expect_error(vec2mat(c(1, NA)), "NAs not allowed")
})

test_that("vec2mat2 works", {
  res <- vec2mat2(c("a-b", "a-c", "b-c"))
  expect_equal(dim(res), c(3, 2))
  expect_equal(res[1, ], c("a", "b"))
})

test_that("vec2mat returns a matrix of the correct class", {
  dif3 <- c(FALSE, FALSE, TRUE)
  names(dif3) <- c("a-b", "a-c", "b-c")
  
  m <- vec2mat(dif3)
  
  expect_true(is.matrix(m))
  expect_type(m, "logical")
  expect_equal(dim(m), c(3L, 3L))
})

test_that("vec2mat preserves input type", {
  # numeric
  dif_num <- c(0.01, 0.02, 0.5)
  names(dif_num) <- c("a-b", "a-c", "b-c")
  expect_type(vec2mat(dif_num), "double")
  
  # character
  dif_chr <- c("yes", "no", "maybe")
  names(dif_chr) <- c("a-b", "a-c", "b-c")
  expect_type(vec2mat(dif_chr), "character")
})
