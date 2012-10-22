#ifndef PARSER_H
#define PARSER_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <Rinternals.h>
#include <R_ext/Boolean.h>
#include <wchar.h>

extern Rboolean utf8locale, mbcslocale; 

int nlines( const char* ) ;

// #ifdef SUPPORT_MBCS
// # ifdef Win32
// #  define USE_UTF8_IF_POSSIBLE
// # endif
// #endif


# define attribute_visible 
# define attribute_hidden

/* Used as a default for string buffer sizes,
			   and occasionally as a limit. */
#define MAXELTSIZE 8192 

SEXP	NewList(void);
SEXP	GrowList(SEXP, SEXP);
SEXP	Insert(SEXP, SEXP);

/* File Handling */
#define R_EOF   -1

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    PARSE_NULL,
    PARSE_OK,
    PARSE_INCOMPLETE,
    PARSE_ERROR,
    PARSE_EOF
} ParseStatus;

#ifdef __cplusplus
}
#endif

# define yychar			Rf_yychar
# define yylval			Rf_yylval
# define yynerrs		Rf_yynerrs

#ifdef ENABLE_NLS
#include <libintl.h>
#ifdef Win32
#define _(String) libintl_gettext (String)
#undef gettext /* needed for graphapp */
#else
#define _(String) gettext (String)
#endif
#define gettext_noop(String) String
#define N_(String) gettext_noop (String)
#define P_(StringS, StringP, N) ngettext (StringS, StringP, N)
#else /* not NLS */
#define _(String) (String)
#define N_(String) String
#define P_(String, StringP, N) (N > 1 ? StringP: String)
#endif

/* Miscellaneous Definitions */
#define streql(s, t)	(!strcmp((s), (t)))

#define PUSHBACK_BUFSIZE 16
#define CONTEXTSTACK_SIZE 50

int file_getc(void) ;
FILE *	_fopen(const char *filename, const char *mode);
int	_fgetc(FILE*);


/* definitions for R 2.16.0 */

int utf8clen(char c);
# define Mbrtowc        Rf_mbrtowc
# define ucstomb        Rf_ucstomb
extern Rboolean utf8locale, mbcslocale;
size_t ucstomb(char *s, const unsigned int wc);
extern size_t Mbrtowc(wchar_t *wc, const char *s, size_t n, mbstate_t *ps);
#define mbs_init(x) memset(x, 0, sizeof(mbstate_t))

  
#endif

