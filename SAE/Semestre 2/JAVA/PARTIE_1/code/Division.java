public class Division extends Operation {

    public Division(Nombre Nombre1, Nombre Nombre2) {

        super(Nombre1, Nombre2);
    }

    public int valeur() {

        int a = this.getOPerande1().valeur();
        int b = this.getOPerande2().valeur();
        int c = a / b;
        return c;

    }

    public String toString() {

        return "(" + this.getOPerande1().valeur() + "/" + this.getOPerande2().valeur() + ")";
    }
}