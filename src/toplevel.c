#include "parser.h"

SEXP top_level( SEXP parent ){
	int n = LENGTH(parent) ;
	SEXP top = PROTECT( allocVector( INTSXP, n ) ) ;
	int current = 0 ;
	int* p_parent = INTEGER(parent) ;
	int* p_top = INTEGER(top) ;
	for( int i=0; i<n; i++){
		p_top[i] = current ;
		if( p_parent[i] <= 0 ) current++ ;
	}
	UNPROTECT(1);
	return top ;
}
