import java.util.ArrayList;
public class ArrayListDeObjetos {
 public static void main(String[] args){ArrayList<Produto> ps=new ArrayList<>();ps.add(new Produto("Teclado",120));ps.add(new Produto("Mouse",65));ps.add(new Produto("Monitor",850));ps.forEach(System.out::println);ps.removeIf(p->p.getPreco()<100);System.out.println("Após filtro:");ps.forEach(System.out::println);}
}
class Produto {private String nome;private double preco;Produto(String n,double p){nome=n;preco=p;}double getPreco(){return preco;}public String toString(){return nome+" - R$ "+preco;}}
