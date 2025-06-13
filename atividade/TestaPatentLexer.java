import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;

public class TestaPatentLexer {
    public static void main(String[] args) throws IOException {
        PatentLexer lexer = new PatentLexer(new FileReader("patente.html"));
        while (lexer.yylex() != PatentLexer.YYEOF) {
            // O analisador só atualiza os campos
        }
        System.out.println("Número: " + lexer.number);
        System.out.println("Título: " + lexer.title);
        System.out.println("Data de publicação: " + lexer.publicationDate);
        System.out.println("Resumo: " + lexer.abstractText);
        System.out.println("Reivindicações: " + lexer.claims.toString());
    }
}