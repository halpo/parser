\docType{package}
\name{parser-package}
\alias{parser-package}
\title{Detailed R source code parser}
\description{
  Detailed R source code parser
}
\examples{
\dontrun{
tf <- tempfile()
dump( "glm" , file = tf )

# modified R parser
p <- parser( tf )
attr(p, "data")

# clean up
unlink( tf )
}
}
\author{
  Romain Francois

  Maintainer: Andrew Redd <Andrew.Redd@hsc.utah.edu>
}
\seealso{
  The \code{\link{parser}} is a modified R parser using a
  very similar grammar to the standard
  \code{\link[base]{parse}} function but presenting the
  information differently.
}
\keyword{package}

