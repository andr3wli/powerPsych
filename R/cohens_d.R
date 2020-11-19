#' Calculate Cohen's d given some descriptive statistics
#'
#' @param mean.one consumes the mean of first group
#' @param mean.two consumes the mean of second group
#' @param sd.one consumes the standard deviation of first group
#' @param sd.two consumes the standard deviation of second group. This can be left empty if the groups share the same standard deviation.
#' @param sd Type "same" if both groups have the same sd. Type "diff" if the groups do not have the same standard deviation. In this case, the pooled standard deviation is used.
#'
#' @return
#' A string containing Cohen's d statistic that informs user of effect size
#'
#' @export
#'
#'
#'
#' @examples
#' cohens_d(0, 1.4, 0.6, sd = "same")
#' cohens_d(mean.one = 0, mean.two = 1, sd.one = 0.5, sd.two = 0.6, sd = "diff")
cohens_d <- function(mean.one, mean.two, sd.one, sd.two, sd = c("same", "diff")) {

  if(sd == "same") {
    cd_same <- (mean.two - mean.one) / sd.one

    if(cd_same <= 0.2) {
      return(cat("Cohen's d is", round(abs(cd_same), digits = 3), "which is considered to be a relatively small effect size."))
    }
    if(cd_same > 0.5 & cd_same < 0.8) {
      return(cat("Cohen's d is", round(abs(cd_same), digits = 3), "which is considered to be medium effect size."))
    }
    if(cd_same > 0.8) {
      return(cat("Cohen's d is", round(abs(cd_same), digits = 3), "which is considered to be a relatively large effect size."))
    }
  }


  if(sd == "diff" & missing(sd.two)) {
    stop("If the standard deviation of the groups are different, you must enter a value for sd.two")
}

  if(sd == "diff") {
    cd_diff <- (mean.two - mean.one) / sqrt(((sd.one^2) + (sd.two^2)) / 2)


    if(cd_diff <= 0.2) {
      return(cat("Cohen's d is", round(abs(cd_diff), digits = 3), "which is considered to be a relatively small effect size."))
    }
    if(cd_diff > 0.5 & cd_diff < 0.8) {
      return(cat("Cohen's d is", round(abs(cd_diff), digits = 3), "which is considered to be medium effect size."))
    }
    if(cd_diff > 0.8) {
      return(cat("Cohen's d is", round(abs(cd_diff), digits = 3), "which is considered to be a relatively large effect size."))

    }
  }

}
