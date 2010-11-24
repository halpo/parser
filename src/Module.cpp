#include <Rcpp.h>

using namespace Rcpp ;
extern "C" {
    int nlines( const char* ) ;
    SEXP countchars( const char*, int) ;
}
extern Rboolean known_to_be_utf8 ;
extern Rboolean known_to_be_latin1 ;

/** 
 * R interface : 
 *  count.chars( file, encoding = "unknown" )
 */
SEXP do_countchars( const char* fname, const char* encoding ){
	Rboolean old_latin1=known_to_be_latin1,
	old_utf8=known_to_be_utf8, allKnown = TRUE;
	known_to_be_latin1 = known_to_be_utf8 = FALSE;
	if(!strcmp(encoding, "latin1")) {
		known_to_be_latin1 = TRUE;
		allKnown = FALSE;
    }
    if(!strcmp(encoding, "UTF-8"))  {
		known_to_be_utf8 = TRUE;
		allKnown = FALSE;
    }
	int nl = nlines( fname ) ;
	IntegerMatrix result = countchars( fname, nl ) ;
	known_to_be_latin1 = old_latin1;
    known_to_be_utf8 = old_utf8;
	result.attr( "dimnames" ) = List::create( 
	    seq_len( nl ), 
	    CharacterVector::create( "char", "byte" )
	    ) ;
    return result ;
}


RCPP_MODULE(parser_module){
    function( "nlines", &nlines ) ;
    function( "count.chars", &do_countchars ) ;
}

