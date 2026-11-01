public class ClasseGenerica {
    public static void main(String[] args) {
        Caixa<String> caixaTexto = new Caixa<>("Estudando Java");
        Caixa<Integer> caixaNumero = new Caixa<>(2026);

        System.out.println(caixaTexto.getConteudo());
        System.out.println(caixaNumero.getConteudo());
    }
}

class Caixa<T> {
    private T conteudo;

    public Caixa(T conteudo) {
        this.conteudo = conteudo;
    }

    public T getConteudo() {
        return conteudo;
    }

    public void setConteudo(T conteudo) {
        this.conteudo = conteudo;
    }
}
