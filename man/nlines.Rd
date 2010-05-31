\name{nlines}
\alias{nlines}
\title{
	Counts the number of lines in a file
}
\description{
	Counts the number of lines in a file
}
\usage{
nlines(file)
}
\arguments{
  \item{file}{
The file path. This is \emph{not} using connections, so this expects 
a character string giving the name of the file
}
}
\value{
	The number of lines of the file
}
\author{
	Romain Francois <romain@r-enthusiasts.com>
}
\examples{
\dontrun{
f <- system.file( "grammar.output", package = "parser" )
nlines( f )
length( readLines( f ) )
}
}
\keyword{ manip }

