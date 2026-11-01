public class InterfaceComDefault {
    public static void main(String[] args) {
        Notificacao email = new NotificacaoEmail();
        Notificacao sms = new NotificacaoSMS();

        email.enviar("Sua inscrição foi confirmada.");
        sms.enviar("Código: 4821");
    }
}

interface Notificacao {
    void enviar(String mensagem);

    default void exibirCanal() {
        System.out.println("Canal de notificação disponível.");
    }
}

class NotificacaoEmail implements Notificacao {
    @Override
    public void enviar(String mensagem) {
        exibirCanal();
        System.out.println("E-mail enviado: " + mensagem);
    }
}

class NotificacaoSMS implements Notificacao {
    @Override
    public void enviar(String mensagem) {
        exibirCanal();
        System.out.println("SMS enviado: " + mensagem);
    }
}
