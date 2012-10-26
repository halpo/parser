library(testthat)
library(parser)
context("text")
test_that('text arguments', {
text <- 
"a <-1
b<<-2"
(p<-parser(text=text))
})
