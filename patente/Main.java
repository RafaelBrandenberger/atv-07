import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            FileReader fr = new FileReader("patente_simulada.txt");
            Patente scanner = new Patente(fr);
            while (scanner.yylex() != -1) {
                // O scanner imprime os campos encontrados.
            }
            fr.close();
        } catch (Exception e) {
            System.err.println("Erro: " + e.getMessage());
        }
    }
}