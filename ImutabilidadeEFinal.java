public class ImutabilidadeEFinal {
    public static void main(String[] args) {
        Endereco endereco = new Endereco(
            "Rua Central",
            120,
            "Fortaleza"
        );

        System.out.println(endereco);
    }
}

final class Endereco {
    private final String rua;
    private final int numero;
    private final String cidade;

    public Endereco(String rua, int numero, String cidade) {
        this.rua = rua;
        this.numero = numero;
        this.cidade = cidade;
    }

    public String getRua() {
        return rua;
    }

    public int getNumero() {
        return numero;
    }

    public String getCidade() {
        return cidade;
    }

    @Override
    public String toString() {
        return "Endereco{rua='" + rua + "', numero=" + numero
                + ", cidade='" + cidade + "'}";
    }
}
