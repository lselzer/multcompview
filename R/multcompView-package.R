#' Summarize multiple paired comparisons
#'
#' Convert a logical vector, a vector of p-values, or a difference/distance
#' matrix into a display identifying the pairs for which the differences were
#' not significantly different, or for which the difference exceeded a
#' threshold.
#'
#' \tabular{ll}{
#'   Package: \tab multcompView\cr
#'   Type:    \tab Package\cr
#'   Version: \tab 0.1-1\cr
#'   Date:    \tab 2006-08-06\cr
#'   License: \tab GPL\cr
#' }
#'
#' Convert a logical vector, a vector of p-values, or a difference/distance
#' matrix into either a letter-based display using \code{\link{multcompLetters}}
#' or a graphic roughly like a \dQuote{T} using \code{\link{multcompTs}} to
#' identify factor levels or similar groupings that are or are not
#' significantly different.
#'
#' Designed for use in conjunction with the output of functions like
#' \code{\link[stats]{TukeyHSD}}, \code{diststats}, \code{simint},
#' \code{simtest}, \code{csimint}, \code{csimtestmultcomp},
#' \code{friedmanmc}, \code{kruskalmcpgirmess}.
#'
#' @name multcompView-package
#' @aliases multcompView-package multcompView
#' @author Spencer Graves, Hans-Peter Piepho and Luciano Selzer with help from Sundar Dorai-Raj
#' @references
#' Piepho, Hans-Peter (2004) \dQuote{An Algorithm for a Letter-Based
#' Representation of All-Pairwise Comparisons}, \emph{Journal of Computational and
#' Graphical Statistics}, 13(2), 456--466.
#'
#' Donaghue, John R. (2004) \dQuote{Implementing Shaffer's multiple comparison
#' procedure for a large number of groups}, pp. 1--23 in Benjamini, Bretz and
#' Sarkar (eds) \emph{Recent Developments in Multiple Comparison Procedures}
#' (Institute of Mathematical Statistics Lecture Notes--Monograph Series, vol. 47).
#' @keywords package aplot dplot htest
#' @examples
#' dif3 <- c(FALSE, FALSE, TRUE)
#' names(dif3) <- c("a-b", "a-c", "b-c")
#' multcompTs(dif3)
#' multcompLe




