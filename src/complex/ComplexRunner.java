package complex;

public class ComplexRunner {
    public static void main(String[] args) throws Exception {
        ComplexNumber a = new ComplexNumber(1, 2);
        ComplexNumber b = new ComplexNumber(1, 2);
        ComplexNumber c = new ComplexNumber(-1, -2);
        a.multiply(b);
        System.out.println(a.multiply(b));
        System.out.println(a.multiply(c));
        System.out.println(ComplexNumber.multiply(a, b));
        System.out.println(a.arg());
    }
}


