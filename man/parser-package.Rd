\name{parser-package}
\Rdversion{1.1}
\alias{parser-package}
\docType{package}
\title{
Detailed R source code parser
}
\description{
Detailed R source code parser
}
\details{
\tabular{ll}{
Package: \tab parser\cr
Type: \tab Package\cr
Version: \tab 0.0-7\cr
Date: \tab 2009-12-13\cr
License: \tab GPL-3\cr
LazyLoad: \tab yes\cr
}

}
\author{
Romain Francois

Maintainer: Romain Francois <francoisromain@free.fr>
}
\seealso{
	The
	\code{\link{parser}} is a modified R parser using a very similar 
	grammar to the standard \code{\link[base]{parse}} function but presenting
	the information differently. 
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
\keyword{ package }

