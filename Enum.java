public class Enum {
    public static void main(String[] args) {
        Pedido pedido = new Pedido(125.90, StatusPedido.EM_PREPARACAO);

        System.out.println(pedido);

        pedido.atualizarStatus(StatusPedido.ENVIADO);

        System.out.println("Foi enviado? " + pedido.foiEnviado());
        System.out.println(pedido);
    }
}

enum StatusPedido {
    RECEBIDO,
    EM_PREPARACAO,
    ENVIADO,
    ENTREGUE,
    CANCELADO
}

class Pedido {
    private double valor;
    private StatusPedido status;

    public Pedido(double valor, StatusPedido status) {
        this.valor = valor;
        this.status = status;
    }

    public void atualizarStatus(StatusPedido novoStatus) {
        this.status = novoStatus;
    }

    public boolean foiEnviado() {
        return status == StatusPedido.ENVIADO
                || status == StatusPedido.ENTREGUE;
    }

    @Override
    public String toString() {
        return String.format(
            "Pedido{valor=R$ %.2f, status=%s}", valor, status
        );
    }
}
