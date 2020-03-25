%{
#include "y.tab.h"
int i;
%}

%%
"\t"|"\r"|" "   { }
"\n"						{ errorline++;}
"#t"						{ yylval.num=1; return BOOLVAL; }
"#f"	          { yylval.num=0; return BOOLVAL; }
"+"|"-"|"*"|"/"|"<"|">"|"="|"("|")"	  { return yytext[0]; }
"print-num"		  { return PRINTNUM; }
"print-bool"		{ return PRINTBOOL; }
"mod"						{ return '%';}
"and"           { return AND; }
"or"		        { return OR; }
"not"		        { return NOT; }
"if"			      { return IF; }
"define"		    { return DEFINE; }
"fun"           { return FUN; }
0					      { yylval.num=atoi(yytext); return NUMBER; }
[1-9][0-9]*	    { yylval.num=atoi(yytext); return NUMBER; }
-[1-9][0-9]*	  { yylval.num=atoi(yytext); return NUMBER; }
[a-z]([a-z]|[0-9]|"-")*   { /*printf("id=%s\n", yytext);*/ strcpy(yylval.id, yytext); return ID; }		
%%


