public class ClassesAbstratas {
    public static void main(String[] args) {
        Forma[] formas = {
            new Circulo(3),
            new Retangulo(4, 5)
        };

        for (Forma forma : formas) {
            System.out.printf(
                "%s: área = %.2f%n",
                forma.getNome(),
                forma.calcularArea()
            );
        }
    }
}

abstract class Forma {
    private String nome;

    public Forma(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract double calcularArea();
}

class Circulo extends Forma {
    private double raio;

    public Circulo(double raio) {
        super("Círculo");
        this.raio = raio;
    }

    @Override
    public double calcularArea() {
        return Math.PI * raio * raio;
    }
}

class Retangulo extends Forma {
    private double largura;
    private double altura;

    public Retangulo(double largura, double altura) {
        super("Retângulo");
        this.largura = largura;
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return largura * altura;
    }
}
