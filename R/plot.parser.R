plot.parser <- function(x, y=attr(p,'data'), ...){
    stopifnot(require(igraph))
    y$new.id <- seq_along(y$id)
    h <- graph.tree(0) + vertices(id = y$id, label= y$text)
    for(i in 1:nrow(y)){
        if(d[i, 'parent'])
            h <- h + edge(c(d[d$id == y[i, 'parent'], 'new.id'], y[i, 'new.id']))
    }
    plot(h, layout=layout.reingold.tilford)   
}
