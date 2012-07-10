#' Plot heirachrical view of parser data.
#' @author Andrew Redd
#'
#' Plots the parser data as a tree structure to show more clearly the 
#' relationships and connections.
#'
#' @usage 
#'  \method{plot}{parser}(x, y, ...)
#'
#' @param x a parser object
#' @param y the parser data table.
#' @param ... extra arguments
#'
#' @seealso \code{\link{parser}}, \code{\link{plot}}
#' @examples
#' p <- parser(text='a <- 1
#'              b <- x[[1]]
#'              m <- lm(x~y)')
#' plot(p)
#' 
#' @S3method plot parser
#' @export
plot.parser <- function(x, y=attr(x,'data'), ...){
    stopifnot(require(igraph))
    y$new.id <- seq_along(y$id)
    h <- graph.tree(0) + vertices(id = y$id, label= y$text)
    for(i in 1:nrow(y)){
        if(y[i, 'parent'])
            h <- h + edge(c(y[y$id == y[i, 'parent'], 'new.id'], y[i, 'new.id']))
    }
    plot(h, layout=layout.reingold.tilford, ...)   
}
