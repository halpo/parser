library(testthat)
context('C++ Module Functions')

is_greater_than <- function (expected, label = NULL, ...) 
{
    if (is.null(label)) {
        label <- testthat:::find_expr("expected")
    }
    else if (!is.character(label) || length(label) != 1) {
        label <- deparse(label)
    }
    function(actual) {
        same <- try(actual > expected)
        expectation(identical(same, TRUE), paste0("not greather than", 
            label, "\n", paste0(same, collapse = "\n")))
    }
}
is_not_equal_to <- function (expected, label = NULL, ...) 
{
    if (is.null(label)) {
        label <- testthat:::find_expr("expected")
    }
    else if (!is.character(label) || length(label) != 1) {
        label <- deparse(label)
    }
    function(actual) {
        not.same <- expected != actual
        expectation(identical(not.same, TRUE), paste0("not equal to ", 
            label, "\n", paste0(not.same, collapse = "\n")))
    }
}


test_that("nlines can be called", {
    file <- system.file("CITATION", package='base')
    expect_that(file, is_not_equal_to(""))
    if(file != "")
        expect_that(nlines(file), is_greater_than(0))
})
test_that("count.chars can be called", {
    file <- system.file("CITATION", package='base')
    expect_that(file, is_not_equal_to(""))
    if(file != "")
        expect_that(count.chars(file), is_a('matrix'))
        expect_that(sum(count.chars(file)), is_greater_than(0))
})
