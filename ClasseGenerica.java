public class ClasseGenerica {
 public static void main(String[] args){Caixa<String> texto=new Caixa<>("Aprendendo POO");Caixa<Integer> numero=new Caixa<>(2026);System.out.println(texto.get());System.out.println(numero.get());}
}
class Caixa<T> {private T conteudo;Caixa(T c){conteudo=c;}T get(){return conteudo;}void set(T c){conteudo=c;}}
