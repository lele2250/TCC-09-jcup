/* Definição: seção para código do usuário. */
import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */
%cup
%unicode
%line
%column
%class AnalisadorLexico

digito = [0-9]
inteiro = {digito}+

%%

/* Regras e Ações */
{inteiro}  { return new Symbol(sym.INTEIRO, yyline, yycolumn, Integer.valueOf(yytext())); }
"+"        { return new Symbol(sym.MAIS); }
"-"        { return new Symbol(sym.MENOS); }
"*"        { return new Symbol(sym.MULT); }
"/"        { return new Symbol(sym.DIV); }
"%"        { return new Symbol(sym.MOD); }
"^"        { return new Symbol(sym.POT); }
"("        { return new Symbol(sym.PARENTESQ); }
")"        { return new Symbol(sym.PARENTDIR); }
";"        { return new Symbol(sym.PTVIRG); }
\n         { /* Ignora */ }
[ \t\r]+   { /* Ignora */ }
.          { System.err.println("Caractere inválido: " + yytext()); }