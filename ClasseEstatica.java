public class ClasseEstatica {
 public static void main(String[] args){new Usuario("Bia");new Usuario("Rafa");System.out.println("Total: "+Usuario.getTotal());}
}
class Usuario {private String nome;private static int total=0;Usuario(String n){nome=n;total++;}static int getTotal(){return total;}public String toString(){return "Usuario{"+nome+"}";}}
