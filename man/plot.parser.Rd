\name{plot.parser}
\alias{plot.parser}
\title{Plot heirachrical view of parser data.}
\usage{
  \method{plot}{parser}(x, y, ...)
}
\arguments{
  \item{x}{a parser object}

  \item{y}{the parser data table.}

  \item{...}{extra arguments}
}
\description{
  Plot heirachrical view of parser data.
}
\examples{
p <- parser(text='a <- 1
             b <- x[[1]]
             m <- lm(x~y)')
plot(p)
}
\author{
  Andrew Redd

  Plots the parser data as a tree structure to show more
  clearly the relationships and connections.
}
\seealso{
  \code{\link{parser}}, \code{\link{plot}}
}

