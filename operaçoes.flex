import java_cup.runtime.Symbol;

%%

%cup
%unicode
%line
%column
%class AnalisadorLexico

digito = [0-9]
inteiro = {digito}+

%%

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULT); }
"/"       { return new Symbol(sym.DIV); }
"%"       { return new Symbol(sym.RESTO); }
"^"       { return new Symbol(sym.POT); }
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espaços. */ }
.         { 
            System.err.println("\n Caractere inválido: " + yytext() +
                             "\n Linha: " + yyline +
                             "\n Coluna: " + yycolumn + "\n"); 
            return null; 
          }