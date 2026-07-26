test_that("extract_p works with TukeyHSD", {
  experiment <- data.frame(
    treatments = gl(3, 10, labels = c("A", "B", "C")),
    y = c(rnorm(10, 10), rnorm(10, 20), rnorm(10, 21))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  pvals <- extract_p(tuk)
  
  expect_type(pvals, "list")
  expect_true(all(pvals$treatments >= 0 & pvals$treatments <= 1))
})

test_that("extract_p.mc works if pgirmess is available", {
  skip_if_not_installed("pgirmess")
  
  experiment <- data.frame(
    treatments = gl(3, 10, labels = c("A", "B", "C")),
    y = c(rnorm(10, 10), rnorm(10, 20), rnorm(10, 21))
  )
  
  km <- pgirmess::kruskalmc(y ~ treatments, data = experiment)
  pvals <- extract_p(km)
  
  expect_true(is.logical(pvals) || is.numeric(pvals))
  expect_named(pvals)
})

test_that("extract_p.TukeyHSD returns a list of named numeric vectors", {
  experiment <- data.frame(
    treatments = gl(3, 10, labels = c("A", "B", "C")),
    y = c(rnorm(10, 10), rnorm(10, 20), rnorm(10, 21))
  )
  fit <- aov(y ~ treatments, data = experiment)
  tuk <- TukeyHSD(fit)
  
  pvals <- extract_p(tuk)
  
  expect_type(pvals, "list")
  expect_true(all(vapply(pvals, is.numeric, logical(1))))
  expect_true(all(vapply(pvals, function(x) !is.null(names(x)), logical(1))))
})

test_that("extract_p.mc returns a named vector", {
  skip_if_not_installed("pgirmess")
  
  experiment <- data.frame(
    treatments = gl(3, 10, labels = c("A", "B", "C")),
    y = c(rnorm(10, 10), rnorm(10, 20), rnorm(10, 21))
  )
  
  km <- pgirmess::kruskalmc(y ~ treatments, data = experiment)
  pvals <- extract_p(km)
  
  expect_true(is.logical(pvals) || is.numeric(pvals))
  expect_false(is.null(names(pvals)))
})
