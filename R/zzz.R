#' @importFrom utils data
#' @import Rcpp 
#' @useDynLib parser
.onLoad <- function( libname, pkgname ){
    # loadRcppModules()
	loadModule("parser_module", T)
}

