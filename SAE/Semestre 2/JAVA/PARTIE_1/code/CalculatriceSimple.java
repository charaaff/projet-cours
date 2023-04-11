public class CalculatriceSimple {
    public static void main(String[] args) {
        try {
            Nombre six = new Nombre(6);
            Nombre dix = new Nombre(10);
            Nombre zero = new Nombre(0);

            Operation s = new Addition(dix, six);
            System.out.println(s + " = " + s.valeur());

            Operation s1 = new Soustraction(dix, six);
            System.out.println(s1 + " = " + s1.valeur());

            Operation s2 = new Multiplication(dix, six);
            System.out.println(s2 + " = " + s2.valeur());

            Operation s3 = new Division(dix, six);
            System.out.println(s3 + " = " + s3.valeur());

            Operation s4 = new Division(dix, zero);
            System.out.println(s4 + " = " + s4.valeur());

        } catch (ArithmeticException e) {
            System.out.println("Erreur tu ne peux pas diviser par 0, choisis un autre nombre");

        }
    }
}
