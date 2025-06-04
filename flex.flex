%%
%public
%class Patente
%unicode
%standalone

%%

// reconhece a linha do número da patente e imprime apenas os dígitos encontrados
"Numero:"[ \t]*([0-9]+) {
    // extrai e exibe o número da patente
    System.out.println("Número da patente encontrado: " + yytext().replaceAll("\\D", ""));
}

// reconhece a linha do título da patente, com ou sem acento, e imprime o texto após o prefixo
("Titulo:"|"Título:")[ \t]*(.*) {
    // extrai e exibe o título da patente
    String linha = yytext();
    String titulo = linha.replaceFirst("(?i)T[ií]tulo:[ \\t]*", "");
    System.out.println("Título encontrado: " + titulo);
}

// reconhece a linha da data de publicação, com ou sem acento, e imprime o texto após o prefixo
("Data de publicação:"|"Data de Publicação:")[ \t]*(.*) {
    // extrai e exibe a data de publicação da patente
    String linha = yytext();
    String data = linha.replaceFirst("(?i)Data de Publica[cç][aã]o:[ \\t]*", "");
    System.out.println("Data de publicação encontrada: " + data);
}

// reconhece a linha do resumo (ou abstract), aceita ambos prefixos, e imprime o texto após o prefixo
("Resumo:"|"Abstract:")[ \t]*(.*) {
    // extrai e exibe o resumo da patente
    String linha = yytext();
    String resumo = linha.replaceFirst("(?i)(Resumo:|Abstract:)[ \\t]*", "");
    System.out.println("Resumo encontrado: " + resumo);
}

// reconhece a linha das reivindicações (ou claims), aceita variações, e imprime o texto após o prefixo
("Reivindicações:"|"Reivindicacoes:"|"Claims:")[ \t]*(.*) {
    // extrai e exibe as reivindicações da patente
    String linha = yytext();
    String reivindicacoes = linha.replaceFirst("(?i)(Reivindica[cç][aã]o?es:|Claims:)[ \\t]*", "");
    System.out.println("Reivindicações encontradas: " + reivindicacoes);
}

// ignora qualquer outra linha que não seja um dos campos acima
[^\n]*    { /* ignora outras linhas */ }
\n        { /* ignora quebras de linha */ }