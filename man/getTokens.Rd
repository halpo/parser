\name{getTokens}
\alias{getTokens}
\title{Gets the terminal tokens}
\usage{
  getTokens(x,
    data = attr(x, "data")[attr(x, "data")[["terminal"]], ],
    encoding = attr(x, "encoding"), file = attr(x, "file"),
    sort = TRUE)
}
\arguments{
  \item{x}{the parser object.}

  \item{data}{the data attribute of x}

  \item{encoding}{The encoding used on the file}

  \item{file}{the file x came from.}

  \item{sort}{Does the data need to be sorted?}
}
\description{
  Retrieve the terminal nodes from a parser object.
}

