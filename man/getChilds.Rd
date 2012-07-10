\name{getChilds}
\alias{getChilds}
\title{Get the child expression of an expression in the parse tree}
\usage{
  getChilds(x, i = 0,
    parent = sapply(x[i], function(.) attr(., "id")))
}
\arguments{
  \item{x}{Output from the \code{\link{parser}} function}

  \item{i}{index of the top-level expressions we want the
  childs of. The default value (0) means all top level
  expressions}

  \item{parent}{id of the parent expressions as found in
  the id column}
}
\value{
  An integer vector giving all the ids of symbols that are
  childs of one of the parent expression
}
\description{
  Get the child expression of an expression in the parse
  tree
}
\author{
  Romain Francois <romain@r-enthusiasts.com>
}
\seealso{
  \code{\link{parser}}
}
\keyword{manip}

