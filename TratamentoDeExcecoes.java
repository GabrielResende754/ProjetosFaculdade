import java.util.Scanner;

public class TratamentoDeExcecoes {
    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);

        try {
            System.out.print("Digite um número inteiro: ");
            int numero = Integer.parseInt(entrada.nextLine());

            System.out.println("Dobro: " + (numero * 2));
        } catch (NumberFormatException erro) {
            System.out.println(
                "Entrada inválida: digite um número inteiro."
            );
        } finally {
            System.out.println("Programa finalizado.");
            entrada.close();
        }
    }
}
