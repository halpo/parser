
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
	b <- body( nlines )
	b[[2]] <- call( ".External", b[[2]][[2]], b[[2]][[3]], as.name( "file") )
	body( nlines ) <- b
	assign( "nlines", nlines, NAMESPACE )
	
	count.chars <- MODULE$count.chars
	b <- body( count.chars )
	b[[2]] <- call( ".External", b[[2]][[2]], b[[2]][[3]], as.name( "file"), as.name( "encoding" ) )
	body( count.chars ) <- b
	formals( count.chars ) <- alist( file = , encoding = "unknown" )
	assign( "count.chars", count.chars, NAMESPACE )
	
	lockBinding( "nlines", NAMESPACE )
	lockBinding( "count.chars", NAMESPACE )
}

