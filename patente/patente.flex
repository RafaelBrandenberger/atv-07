%%
%public
%class Patente
%unicode
%standalone

%%

"Numero:"[ \t]*([0-9]+) {
    System.out.println("Número da patente encontrado: " + yytext().replaceAll("\\D", ""));
}

("Titulo:"|"Título:")[ \t]*(.*) {
    String linha = yytext();
    String titulo = linha.replaceFirst("(?i)T[ií]tulo:[ \\t]*", "");
    System.out.println("Título encontrado: " + titulo);
}

("Data de publicação:"|"Data de Publicação:")[ \t]*(.*) {
    String linha = yytext();
    String data = linha.replaceFirst("(?i)Data de Publica[cç][aã]o:[ \\t]*", "");
    System.out.println("Data de publicação encontrada: " + data);
}

("Resumo:"|"Abstract:")[ \t]*(.*) {
    String linha = yytext();
    String resumo = linha.replaceFirst("(?i)(Resumo:|Abstract:)[ \\t]*", "");
    System.out.println("Resumo encontrado: " + resumo);
}

("Reivindicações:"|"Reivindicacoes:"|"Claims:")[ \t]*(.*) {
    String linha = yytext();
    String reivindicacoes = linha.replaceFirst("(?i)(Reivindica[cç][aã]o?es:|Claims:)[ \\t]*", "");
    System.out.println("Reivindicações encontradas: " + reivindicacoes);
}

[^\n]*    { /* ignora outras linhas */ }
\n        { /* ignora quebras de linha */ }