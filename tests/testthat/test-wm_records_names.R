context("wm_records_names")

test_that("wm_records_names - works", {
  skip_on_cran()

  aa <- wm_records_names(name = 'Platanista gangetica')

  expect_is(aa, "list")
  expect_is(aa[[1]], "tbl_df")
  expect_is(aa[[1]], "data.frame")
  expect_true(all(grepl("Platanista", aa[[1]]$scientificname)))
  expect_equal(NROW(aa[[1]]), 1)
})

test_that("wm_records_names - fuzzy parameter", {
  skip_on_cran()

  aa <- wm_records_names(name = 'Platanista gangetica', fuzzy = TRUE)

  expect_is(aa, "list")
  expect_is(aa[[1]], "tbl_df")
  expect_is(aa[[1]], "data.frame")
  expect_true(all(grepl("Platanista", aa[[1]]$scientificname)))
  expect_gt(NROW(aa[[1]]), 1)
})

test_that("wm_records_names fails well", {
  skip_on_cran()

  expect_error(wm_records_names(), "argument \"name\" is missing")
  expect_error(wm_records_names(55555), "name must be of class character")
  expect_error(wm_records_names("asdfs", "Adf"), "fuzzy must be of class logical")
  expect_error(wm_records_names("asdfs", marine_only = 5), "marine_only must be of class logical")
})
