public abstract class Operation extends Expression {

    private Expression Nombre1;
    private Expression Nombre2;

    public Operation(Expression Nombre1, Expression Nombre2) {

        this.Nombre1 = Nombre1;
        this.Nombre2 = Nombre2;
    }

    public abstract int valeur();

    // getters nb1 et nb2
    public Expression getOPerande1() {

        return this.Nombre1;

    }

    public Expression getOPerande2() {

        return this.Nombre2;

    }
}