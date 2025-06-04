%%
%public
%class Numero
%unicode
%standalone

%%

"Numero:"[ \t]*([0-9]+) {
    System.out.println("Número da patente encontrado: " + yytext().replaceAll("\\D", ""));
}

[^\n]*    {  }
\n        {  }