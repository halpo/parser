#ifndef PARSER_VARIABLES_H
#define PARSER_VARIABLES_H

#ifdef __cplusplus
extern "C" {
#endif    
    Rboolean get_latin1() ;
    void set_latin1( Rboolean) ;
    
    Rboolean get_utf8() ;
    void set_utf8(Rboolean ) ;
#ifdef __cplusplus
}
#endif

#endif
