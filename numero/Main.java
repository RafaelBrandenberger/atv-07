import java.io.*;

public class Main {
    public static void main(String[] args) throws Exception {
        FileReader fr = new FileReader("patente_simulada.txt");
        Numero scanner = new Numero(fr);
        while (scanner.yylex() != -1) {
            // o scanner imprime o número quando encontra
        }
        fr.close();
    }
}