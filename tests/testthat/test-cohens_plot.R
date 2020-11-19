test_that("Plot returns ggplot object",{
  p <- cohens_plot(0, 1, 0.5, 0.8, overlap = T)
  p2 <- cohens_plot(0, 1, 0.5, 0.8, overlap = F)
  expect_is(p,"ggplot")
  expect_is(p2,"ggplot")
})

# test_that("Plot layers match expectations",{
#   p <- cohens_plot(0, 1, 0.5, 0.8, overlap = T)
#   expect_identical(p$layers[[1]]$geom$objname, "line")
#   expect_identical(p$layers[[2]]$geom$objname, "line")
#   expect_identical(p$layers[[3]]$geom$objname, "vline")
#   expect_identical(p$layers[[4]]$geom$objname, "vline")
#   expect_identical(p$layers[[5]]$geom$objname, "polygon")
# })

# test_that("Plot uses correct data", {
#   p <- cohens_plot(0, 1, 0.5, 0.8, overlap = T)
#   expect_that(df1, equals(p$df1))
#
# })

test_that("y and x axis and title labelled correctly",{
  p <- cohens_plot(0, 1, 0.5, 0.8, overlap = T)
  p2 <- cohens_plot(0.3, 0.5, 0.5, 0.8, overlap = F)
  expect_identical(p$labels$y, "")
  expect_identical(p$labels$x, "")
  expect_identical(p$labels$title, "Cohen's d: 1.499")
  expect_identical(p2$labels$y, "")
  expect_identical(p2$labels$x, "")
  expect_identical(p2$labels$title, "Cohen's d: 0.3")
})
