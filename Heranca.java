public class Heranca {
    public static void main(String[] args) {
        Animal cachorro = new Cachorro("Rex", 4, "Labrador");
        Animal gato = new Gato("Mimi", 2);

        cachorro.emitirSom();
        gato.emitirSom();

        System.out.println(cachorro);
    }
}

class Animal {
    protected String nome;
    protected int idade;

    public Animal(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public void emitirSom() {
        System.out.println("Som de animal");
    }
}

class Cachorro extends Animal {
    private String raca;

    public Cachorro(String nome, int idade, String raca) {
        super(nome, idade);
        this.raca = raca;
    }

    @Override
    public void emitirSom() {
        System.out.println(nome + ": Au au!");
    }

    @Override
    public String toString() {
        return "Cachorro{nome='" + nome + "', idade=" + idade
                + ", raça='" + raca + "'}";
    }
}

class Gato extends Animal {
    public Gato(String nome, int idade) {
        super(nome, idade);
    }

    @Override
    public void emitirSom() {
        System.out.println(nome + ": Miau!");
    }
}
