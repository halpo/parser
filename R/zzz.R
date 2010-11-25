
NAMESPACE <- environment()
MODULE <- Module( "parser_module" )

.onLoad <- function( libname, pkgname ){
	populate( MODULE, NAMESPACE )
}

