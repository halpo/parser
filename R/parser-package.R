

#' @name count.chars
#' @title Counts the number of characters and bytes in each line of a file
#' 
#' This follows the same rules as the parser to count the number of characters
#' and the number of bytes in each line of a file
#' 
#' 
#' @param file file \emph{path}
#' @param encoding encoding to assume for the file
#' @return A matrix with 2 columns and one line per line in the input file Each
#' line of the matrix gives : \item{}{the number of characters in the same line
#' in the file} \item{}{the number of bytes in the same line in the file}
#' @author Romain Francois <romain@@r-enthusiasts.com>
#' @seealso \code{\link{nlines}}, \code{\link{parse}}
#' @keywords manip
#' @examples
#' 
#' \dontrun{
#' f <- system.file( "grammar.output", package= "parser" )
#' head( count.chars( f ) ) 
#' }
#' @export
count.chars <- function(file, encoding="unknown"){}   # replace on load





#' @name nlines
#' @title Counts the number of lines in a file
#' 
#' 
#' @param file The file path. This is \emph{not} using connections, so this
#' expects a character string giving the name of the file
#' @return The number of lines of the file
#' @author Romain Francois <romain@@r-enthusiasts.com>
#' @keywords manip
#' @examples
#' 
#' \dontrun{
#' f <- system.file( "grammar.output", package = "parser" )
#' nlines( f )
#' length( readLines( f ) )
#' }
#' @export
nlines <- function(file){}    # replace on load





#' @title Detailed R source code parser
#' @name parser-package
#' @docType package
#' 
#' @author Romain Francois
#' 
#' Maintainer: Andrew Redd <Andrew.Redd@@hsc.utah.edu>
#' 
#' @seealso The \code{\link{parser}} is a modified R parser using a very
#' similar grammar to the standard \code{\link[base]{parse}} function but
#' presenting the information differently.
#' @keywords package
#' @examples
#' 
#' \dontrun{
#' tf <- tempfile()
#' dump( "glm" , file = tf )
#' 
#' # modified R parser
#' p <- parser( tf )
#' attr(p, "data") 
#' 
#' # clean up
#' unlink( tf )
#' }
#' 
NULL



