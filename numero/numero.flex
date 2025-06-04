%%
%public
%class Numero
%unicode
%standalone

%%

"Numero:"[ \t]*([0-9]+) {
    System.out.println("Número da patente encontrado: " + yytext().replaceAll("\\D", ""));
}

"Titulo:"[ \t]*(.*) {
    String linha = yytext();
    String titulo = linha.replaceFirst("Titulo:[ \\t]*", "");
    System.out.println("Título encontrado: " + titulo);
}

[^\n]*    { /* ignora outras linhas */ }
\n        { /* ignora quebras de linha */ }