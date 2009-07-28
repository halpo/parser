#' a roxygen comment
f <- function( x = 3 ){
	
	# a regular comment
	rnorm( n = 10, mean = 2 ) + runif( 10 )
	
	y <- if( "a" %in% letters ) 2 else 3 
	
	for( i in 1:5){
		if( i == 3 ){   
			break
		}
	}
}


