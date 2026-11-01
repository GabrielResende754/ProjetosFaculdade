public class SobrecargaDeMetodos {
    public static void main(String[] args) {
        Calculadora calculadora = new Calculadora();

        System.out.println(calculadora.somar(5, 8));
        System.out.println(calculadora.somar(2.5, 3.7));
        System.out.println(calculadora.somar(1, 2, 3));
    }
}

class Calculadora {
    public int somar(int a, int b) {
        return a + b;
    }

    public double somar(double a, double b) {
        return a + b;
    }

    public int somar(int a, int b, int c) {
        return a + b + c;
    }
}
