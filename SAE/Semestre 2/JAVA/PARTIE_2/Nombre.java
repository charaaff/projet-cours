import javax.management.ValueExp;

public class Nombre extends Expression {

    private int valeurNombre;

    public Nombre(int valeurNombre) {
        // constructeur champ à champ

        this.valeurNombre = valeurNombre;

    }

    public String toString() {

        String r = this.valeurNombre + "";
        return r;

    }

    public int valeur() {

        return valeurNombre;

    }
}
