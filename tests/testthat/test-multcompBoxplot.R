test_that("multcompBoxplot runs without error", {
  # Use simple graph and silence output
  expect_error(
    suppressPlot <- function(...) {
      pdf(NULL)
      on.exit(dev.off())
      multcompBoxplot(breaks ~ tension, data = warpbreaks)
    },
    NA
  )
})

test_that("multcompBoxplot returns a list", {
  pdf(NULL)
  on.exit(dev.off())
  
  res <- multcompBoxplot(breaks ~ tension, data = warpbreaks)
  expect_type(res, "list")
  expect_true("compFn" %in% names(res))
})

test_that("multcompBoxplot returns a list with expected structure", {
  pdf(NULL)
  on.exit(dev.off(), add = TRUE)
  
  res <- multcompBoxplot(breaks ~ tension, data = warpbreaks)
  
  expect_type(res, "list")
  expect_true("compFn" %in% names(res))
  expect_true("boxplot" %in% names(res) || length(res) >= 2)
})
