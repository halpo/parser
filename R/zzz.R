#' @importFrom utils data
#' @importFrom Rcpp populate Module loadRcppModules
#' @importClassesFrom Rcpp Module
#' @importMethodsFrom Rcpp formals<-
#' @useDynLib parser
.onLoad <- function( libname, pkgname ){
	loadRcppModules( direct = TRUE  )
}

