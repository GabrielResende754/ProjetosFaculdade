public class Encapsulamento {
    public static void main(String[] args) {
        Conta conta = new Conta("Ana", 500.00);

        conta.depositar(100.00);
        conta.sacar(80.00);

        System.out.println(conta);
        System.out.println("Tem R$ 600? " + conta.temSaldo(600.00));
    }
}

class Conta {
    private String titular;
    private double saldo;

    public Conta(String titular, double saldo) {
        this.titular = titular;
        this.saldo = Math.max(0, saldo);
    }

    public double getSaldo() {
        return saldo;
    }

    public void depositar(double valor) {
        if (valor > 0) {
            saldo += valor;
        }
    }

    public boolean sacar(double valor) {
        if (valor > 0 && valor <= saldo) {
            saldo -= valor;
            return true;
        }
        return false;
    }

    public boolean temSaldo(double valor) {
        return saldo >= valor;
    }

    @Override
    public String toString() {
        return String.format(
            "Conta{titular='%s', saldo=R$ %.2f}", titular, saldo
        );
    }
}
