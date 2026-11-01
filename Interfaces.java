public class Interfaces {
    public static void main(String[] args) {
        Pagavel[] pagamentos = {
            new FuncionarioMensal("Lia", 3200.00),
            new PrestadorServico("Oficina", 6, 180.00)
        };

        for (Pagavel pagamento : pagamentos) {
            System.out.printf(
                "%s: R$ %.2f%n",
                pagamento.getDescricao(),
                pagamento.calcularPagamento()
            );
        }
    }
}

interface Pagavel {
    double calcularPagamento();

    String getDescricao();
}

class FuncionarioMensal implements Pagavel {
    private String nome;
    private double salario;

    public FuncionarioMensal(String nome, double salario) {
        this.nome = nome;
        this.salario = salario;
    }

    @Override
    public double calcularPagamento() {
        return salario;
    }

    @Override
    public String getDescricao() {
        return "Funcionário " + nome;
    }
}

class PrestadorServico implements Pagavel {
    private String servico;
    private int horas;
    private double valorHora;

    public PrestadorServico(String servico, int horas, double valorHora) {
        this.servico = servico;
        this.horas = horas;
        this.valorHora = valorHora;
    }

    @Override
    public double calcularPagamento() {
        return horas * valorHora;
    }

    @Override
    public String getDescricao() {
        return "Serviço: " + servico;
    }
}
