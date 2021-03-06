#' Time series warping envelops
#'
#' This function computes the envelops for DTW lower bound calculations with a Sakoe-Chiba band for
#' a given univariate time series using the streaming algorithm proposed by Lemire (2009).
#'
#' @export
#'
#' @param x A univariate time series.
#' @param window.size Window size for envelop calculation. See details.
#' @param error.check Check data inconsistencies?
#'
#' @template window
#'
#' @return A list with two elements (lower and upper envelops): `lower` and `upper`.
#'
#' @note
#'
#' This envelop is calculated assuming a Sakoe-Chiba constraint for DTW.
#'
#' @references
#'
#' Lemire D (2009). ``Faster retrieval with a two-pass dynamic-time-warping lower bound .'' *Pattern
#' Recognition*, **42**(9), pp. 2169 - 2180. ISSN 0031-3203,
#' \url{http://dx.doi.org/10.1016/j.patcog.2008.11.030},
#' \url{http://www.sciencedirect.com/science/article/pii/S0031320308004925}.
#'
#' @examples
#'
#' data(uciCT)
#'
#' H <- compute_envelop(CharTraj[[1L]], 18L)
#'
#' matplot(do.call(cbind, H), type = "l", col = 2:3)
#' lines(CharTraj[[1L]])
#'
compute_envelop <- function(x, window.size, error.check = TRUE) {
    if (error.check) {
        if (is_multivariate(list(x)))
            stop("The envelop can conly be computed for univariate series.")

        check_consistency(x, "ts")
    }

    window.size <- check_consistency(window.size, "window")
    window.size <- window.size * 2L + 1L

    ## NOTE: window.size is now window.size*2 + 1, thus the 2L below
    if (window.size > (2L * length(x)))
        stop("Window cannot be greater or equal than the series' length.")

    .Call(C_envelop, x, window.size, PACKAGE = "dtwclust")
}
