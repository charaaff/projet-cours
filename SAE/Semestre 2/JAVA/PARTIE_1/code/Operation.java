public abstract class Operation {

    private Nombre Nombre1;
    private Nombre Nombre2;

    public Operation(Nombre Nombre1, Nombre Nombre2) {

        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
    }

    public abstract int valeur();

    // getters nb1 et nb2
    public Nombre getOPerande1() {

        return this.Nombre1;

    }

    public Nombre getOPerande2() {

        return this.Nombre2;

    }
}