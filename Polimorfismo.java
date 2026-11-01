public class Polimorfismo {
    public static void main(String[] args) {
        Funcionario[] equipe = {
            new Funcionario("Carlos"),
            new Gerente("Marina"),
            new Desenvolvedor("João")
        };

        for (Funcionario funcionario : equipe) {
            System.out.println(
                funcionario.getNome() + " recebe bônus de R$ "
                + funcionario.calcularBonus()
            );
        }
    }
}

class Funcionario {
    private String nome;

    public Funcionario(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public double calcularBonus() {
        return 300.00;
    }
}

class Gerente extends Funcionario {
    public Gerente(String nome) {
        super(nome);
    }

    @Override
    public double calcularBonus() {
        return 1200.00;
    }
}

class Desenvolvedor extends Funcionario {
    public Desenvolvedor(String nome) {
        super(nome);
    }

    @Override
    public double calcularBonus() {
        return 700.00;
    }
}
