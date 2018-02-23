package complex;

public class ComplexNumber {
    private double real;
    private double imagine;

    public ComplexNumber() {
    }

    public ComplexNumber(double real, double imagine) {
        this.real = real;
        this.imagine = imagine;
    }

    public ComplexNumber multiply(ComplexNumber a) {
        ComplexNumber b = new ComplexNumber();
        b.real = real * a.real - imagine * a.imagine;
        b.imagine = real * a.imagine + imagine * a.real;
        return b;
    }

    public static ComplexNumber multiply(ComplexNumber a, ComplexNumber b) {
        return a.multiply(b);
    }

    public String toString() {
        if (imagine > 0)
            return real + " + " + imagine + "* i";
        else
            return real + " " + imagine + "* i";

    }

    public double module() {
        return Math.sqrt(real*real + imagine*imagine);
    }

    public static double module(ComplexNumber a){
        return a.module();
    }

    public double arg() throws Exception {
       if (ComplexNumber.module(this) == 0)
           throw new IllegalStateException("module should not be zero");
       double acos = Math.acos(real/ComplexNumber.module(this));
       return (imagine >= 0) ? acos : 2 * Math.PI - acos;
    }
}
