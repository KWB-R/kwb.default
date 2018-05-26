test_that("getDefault() works", {

  expect_error(kwb.default:::getDefault())
})

test_that(".hint_setDefault() works", {

  expect_error(kwb.default:::.hint_setDefault())
})

test_that("getDefaults() works", {

  kwb.default:::getDefaults()
})

test_that(".defaultName() works", {

  kwb.default:::.defaultName()
})

test_that("setDefaults() works", {

  kwb.default:::setDefaults()
})

test_that("functionAvailable() works", {

  kwb.default:::functionAvailable()
})

test_that(".getFunction() works", {

  expect_error(kwb.default:::.getFunction())
})

test_that("getArgumentNames() works", {

  expect_error(kwb.default:::getArgumentNames())
})

test_that("stopIfNoSuchFunction() works", {

  expect_error(kwb.default:::stopIfNoSuchFunction())
})

test_that("setDefault() works", {

  expect_error(kwb.default:::setDefault())
})

test_that("stopIfNoSuchArgument() works", {

  expect_error(kwb.default:::stopIfNoSuchArgument())
})

