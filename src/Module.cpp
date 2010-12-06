#include <Rcpp.h>
#include "variables.h"

using namespace Rcpp ;
extern "C" {
    int nlines( const char* ) ;
    SEXP countchars( const char*, int) ;
}

/** 
 * R interface : 
 *  count.chars( file, encoding = "unknown" )
 */
SEXP do_countchars( const char* fname, const char* encoding ){
	Rboolean old_latin1=get_latin1(), old_utf8=get_utf8(), allKnown = TRUE;
	set_latin1(FALSE); 
	set_utf8(FALSE);
	if(!strcmp(encoding, "latin1")) {
		set_latin1(TRUE); 
		allKnown = FALSE;
    }
    if(!strcmp(encoding, "UTF-8"))  {
		set_utf8(TRUE);
		allKnown = FALSE;
    }
	int nl = nlines( fname ) ;
	IntegerMatrix result = countchars( fname, nl ) ;
	set_latin1(old_latin1);
    set_utf8(old_utf8);
	result.attr( "dimnames" ) = List::create( 
	    seq_len( nl ), 
	    CharacterVector::create( "char", "byte" )
	    ) ;
    return result ;
}

RCPP_MODULE(parser_module){
    function( "nlines", &nlines, 
        List::create( _["file"] = R_MissingArg ) ) ;
    function( "count.chars", &do_countchars, 
        List::create( _["file"] = R_MissingArg, _["encoding"] = "unknown" )
    ) ;
    
}

