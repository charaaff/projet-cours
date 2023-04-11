public class Multiplication extends Operation {

    public Multiplication(Expression Nombre1, Expression Nombre2) {

        super(Nombre1, Nombre2);
    }

    public int valeur() {

        int a = this.getOPerande1().valeur();
        int b = this.getOPerande2().valeur();
        int c = a * b;
        return c;

    }

    public String toString() {

        return "(" + this.getOPerande1() + "*" + this.getOPerande2() + ")";
    }

}