public class Composicao {
    public static void main(String[] args) {
        Motor motor = new Motor("1.6 flex");
        Carro carro = new Carro("Hatch", motor);

        carro.ligar();
        System.out.println(carro);
    }
}

class Motor {
    private String modelo;

    public Motor(String modelo) {
        this.modelo = modelo;
    }

    public void ligar() {
        System.out.println("Motor " + modelo + " ligado.");
    }

    @Override
    public String toString() {
        return modelo;
    }
}

class Carro {
    private String modelo;
    private Motor motor;

    public Carro(String modelo, Motor motor) {
        this.modelo = modelo;
        this.motor = motor;
    }

    public void ligar() {
        motor.ligar();
    }

    @Override
    public String toString() {
        return "Carro{modelo='" + modelo + "', motor=" + motor + "}";
    }
}
