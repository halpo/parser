
NAMESPACE <- environment()
MODULE <- Module( "parser_module" )

.onLoad <- function( libname, pkgname ){
	assign( "nlines", MODULE$nlines, NAMESPACE )
	assign( "count.chars", MODULE$count.chars, NAMESPACE )
	
	lockBinding( "nlines", NAMESPACE )
	lockBinding( "count.chars", NAMESPACE )
}

