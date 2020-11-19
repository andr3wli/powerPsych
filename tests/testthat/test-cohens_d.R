test_that("prints the correct calculation and interpretation", {
  expect_that(cohens_d(0, 1.4, 0.6, sd = "same"),
              prints_text("Cohen's d is 2.333 which is considered to be a relatively large effect size."))
  expect_that(cohens_d(0, 1, 0.5, 0.6, sd = "diff"),
              prints_text("Cohen's d is 1.811 which is considered to be a relatively large effect size."))
  expect_that(cohens_d(0, 0.1, 0.5, 0.6, sd = "diff"),
              prints_text("Cohen's d is 0.181 which is considered to be a relatively small effect size."))
  expect_that(cohens_d(0, 0.35, 0.5, 0.6, sd = "diff"),
              prints_text("Cohen's d is 0.634 which is considered to be medium effect size."))
})

test_that("expect error when sd.two is missing when sd = 'diff", {
  expect_error(cohens_d(0, 0.35, 0.5, sd = "diff"),
               "If the standard deviation of the groups are different, you must enter a value for sd.two")
  expect_error(cohens_d(1, 0.35, 0.5, sd = "diff"),
               "If the standard deviation of the groups are different, you must enter a value for sd.two")
})
