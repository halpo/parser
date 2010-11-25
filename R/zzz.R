
NAMESPACE <- environment()
MODULE <- Module( "parser_module" )

#' counts the number of lines of a file
#' 
#' @param file file from which to count lines
# this gets replaced in .onAttach
nlines <- function( file ) NULL

#' counts the number of bytes and columns in each line of the file
#'
#' @param file file to analyze
#' @param encoding encoding to assume for the file
count.chars <- function( file, encoding = "unknown" ) NULL 


.onLoad <- function( libname, pkgname ){
	unlockBinding( "nlines" , NAMESPACE )
	unlockBinding( "count.chars" , NAMESPACE )
	
	nlines <- MODULE$nlines
	formals( nlines ) <- alist( file = )
	assign( "nlines", nlines, NAMESPACE )
	
	count.chars <- MODULE$count.chars
	formals( count.chars ) <- alist( file = , encoding = "unknown" )
	assign( "count.chars", count.chars, NAMESPACE )
	
	lockBinding( "nlines", NAMESPACE )
	lockBinding( "count.chars", NAMESPACE )
}

