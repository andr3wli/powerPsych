#' Calculate and plots Cohen's d given given some descriptive statistic
#'
#' @param mean.one consumes the mean of first group
#' @param mean.two consumes the mean of second group
#' @param sd.one consumes the standard deviation of first group
#' @param sd.two consumes the standard deviation of second group.
#' @param overlap default is set to true. Type false if you do not want an overlap in the plots.
#'
#' @return
#' a ggplot showing the effect for the given mean and standard deviation
#'
#' @export
#'
#' @examples
#' cohens_plot(0, 1, 0.5, 0.8, overlap = FALSE)
#' cohens_plot(0, 1, 0.5, 0.8)
#' cohens_plot(0, 1, 0.5, 0.8, overlap = TRUE)
cohens_plot <- function(mean.one, mean.two, sd.one, sd.two, overlap = TRUE) {

  cd <- (mean.two - mean.one) / sqrt(((sd.one^2) + (sd.two^2)) / 2)

  ES <- 0.8
  mean1 <- ES*1 + 1
  x <- seq(1 - 3*1, mean1 + 3*1, .01)

  # generate normal dist #1
  y1 <- stats::dnorm(x, mean.one, sd.one)
  df1 <- data.frame("x" = x, "y" = y1)

  # generate normal dist #2
  y2 <- stats::dnorm(x, mean.two, sd.two)
  df2 <- data.frame("x" = x, "y" = y2)

  # data for overlap
  y.poly <- pmin(y1,y2)
  poly <- data.frame("x" = x, "y" = y.poly)

  if(overlap == TRUE){
    plot <- ggplot2::ggplot(df1, ggplot2::aes_(x = ~ x, y = ~ y, color="treatment")) +
      ggplot2::geom_line(size=1) +
      ggplot2::geom_line(data=df2, ggplot2::aes(color="control"),size=1) +
      ggplot2::guides(color = FALSE) +
      ggplot2::scale_color_manual(values = c("#dd1c77", "#1d91c0")) +
      ggplot2::labs(x = "", y = "", title = paste("Cohen's d:", round(abs(cd), digits = 3))) +
      ggplot2::geom_vline(xintercept = mean.one, linetype="dotted") +
      ggplot2::geom_vline(xintercept = mean.two, linetype="dotted") +
      ggplot2::geom_polygon(ggplot2::aes(color=NULL), data=poly, fill="#969696", alpha=I(4/10)) +
      # xlim(-7, 7)
      ggplot2::theme_void()+
      ggplot2::theme(aspect.ratio = 4/10)
    return(plot)
  }

  if(overlap == FALSE){
    plot <- ggplot2::ggplot(df1, ggplot2::aes_(x = ~ x, y = ~ y, color="treatment")) +
      ggplot2::geom_line(size=1) +
      ggplot2::geom_line(data=df2, ggplot2::aes(color="control"),size=1) +
      ggplot2::guides(color = FALSE) +
      ggplot2::scale_color_manual(values = c("#dd1c77", "#1d91c0")) +
      ggplot2::labs(x = "", y = "", title = paste("Cohen's d:", round(abs(cd), digits = 3))) +
      ggplot2::geom_vline(xintercept = mean.one, linetype="dotted") +
      ggplot2::geom_vline(xintercept = mean.two, linetype="dotted") +
      # xlim(-7, 7)
      ggplot2::theme_void() +
      ggplot2::theme(aspect.ratio = 4/10)
    return(plot)
  }

}
