import java_cup.runtime.*;    
%% 
%class Lexer
%eofval{
  return null;
%eofval};
%line
%column  
%cup
%{   
    
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   
LineTerminator = \r|\n|\r\n
   
/* White space is a line terminator, space, tab, or form feed. */
WhiteSpace     = {LineTerminator} | [ \t\f]

id = [_a-zA-Z][_a-zA-Z0-9]* 
num = [0-9]+

comment = \/\*([^*]|\*[^/])*\*\/
   
%%
   
"if"               { return symbol(sym.IF); }
"else"             { return symbol(sym.ELSE); }
"int"              { return symbol(sym.INT); }
"return"           { return symbol(sym.RETURN); }
"void"             { return symbol(sym.VOID); }
"while"            { return symbol(sym.WHILE); }
"+"                { return symbol(sym.PLUS); }
"-"                { return symbol(sym.MINUS); }
"*"                { return symbol(sym.TIMES); }
"/"                { return symbol(sym.OVER); }
"<"                { return symbol(sym.LT); }
"<="               { return symbol(sym.LTE); }
">"                { return symbol(sym.GT); }
">="               { return symbol(sym.GTE); }
"=="               { return symbol(sym.EQ); }
"!="               { return symbol(sym.NEQ); }
"="                { return symbol(sym.ASSIGN); }
";"                { return symbol(sym.SEMI); }
","                { return symbol(sym.COMMA); }
"("                { return symbol(sym.LPAREN); }
")"                { return symbol(sym.RPAREN); }
"["                { return symbol(sym.LBRACKET); }
"]"                { return symbol(sym.RBRACKET); }
"{"                { return symbol(sym.LBRACE); }
"}"                { return symbol(sym.RBRACE); }
"input"            { return symbol(sym.INPUT); }
"output"           { return symbol(sym.OUTPUT); }
{num}              { return symbol(sym.NUM, yytext()); }
{id}               { return symbol(sym.ID, yytext()); }
{WhiteSpace}+      { /* skip whitespace */ }   
{comment}          { /* skip comments */ }
.                  { return symbol(sym.ERROR); }
