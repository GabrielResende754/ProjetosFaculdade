import java.util.ArrayList;

public class ArrayListDeObjetos {
    public static void main(String[] args) {
        ArrayList<Produto> produtos = new ArrayList<>();

        produtos.add(new Produto("Teclado", 120.00));
        produtos.add(new Produto("Mouse", 65.00));
        produtos.add(new Produto("Monitor", 850.00));

        System.out.println("Lista de produtos:");
        for (Produto produto : produtos) {
            System.out.println(produto);
        }

        produtos.removeIf(produto -> produto.getPreco() < 100);

        System.out.println("\nApós remover produtos abaixo de R$ 100:");
        produtos.forEach(System.out::println);
    }
}

class Produto {
    private String nome;
    private double preco;

    public Produto(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public double getPreco() {
        return preco;
    }

    @Override
    public String toString() {
        return String.format("%s - R$ %.2f", nome, preco);
    }
}
