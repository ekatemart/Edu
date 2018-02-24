package complex;

public class ComplexNumber {
    private double real;
    private double imagine;

    public ComplexNumber() { //Constructor
    }

    public ComplexNumber(double real, double imagine) { //Constructor
        this.real = real;
        this.imagine = imagine;
    }

    public static ComplexNumber multiply(ComplexNumber a, ComplexNumber b) { //Static multiplication
        return a.multiply(b);
    }

    public static double module(ComplexNumber a){ //Static module
        return a.module();
    }

    public static ComplexNumber add(ComplexNumber a, ComplexNumber b){ //Static addition
        return a.add(b);
    }

    public static ComplexNumber subtract(ComplexNumber a, ComplexNumber b) { //Static subtraction
        return a.subtract(b);
    }

    public static ComplexNumber conjugate(ComplexNumber a) { //Static complex-conjugate number
        return a.conjugate();
    }

    public static ComplexNumber divide(ComplexNumber a, ComplexNumber b) { //Static division
        return a.divide(b);
    }

    public String toString() { //Convert to String
        if (real != 0) {
            if (imagine > 0)
                return real + " + " + imagine + " * i";
            else if (imagine < 0)
                return real + " - " + Math.abs(imagine) +  " * i";
            else if (imagine == 0)
                return real + "";
        }
        else {
            if (imagine != 0)
                return imagine + "";
            else
                return "0";
        }
        return null;
    }

    public ComplexNumber multiply(ComplexNumber a) { //Multiplication
        ComplexNumber b = new ComplexNumber();
        b.real = real * a.real - imagine * a.imagine;
        b.imagine = real * a.imagine + imagine * a.real;
        return b;
    }

    public double module() { //Module
        return Math.sqrt(real*real + imagine*imagine);
    }

    public double arg() throws Exception { //Taking an argument
       if (ComplexNumber.module(this) == 0)
           throw new IllegalStateException("module should not be zero");
       double acos = Math.acos(real/ComplexNumber.module(this));
       return (imagine >= 0) ? acos : 2 * Math.PI - acos;
    }

/*    public boolean equals(Object number) {
        console.info(number instanceof ComplexNumber);
        return false;
    }*/

    public ComplexNumber add(ComplexNumber a){ //Addition
        ComplexNumber b = new ComplexNumber();
        b.real = real + a.real;
        b.imagine = imagine + a.imagine;
        return b;
    }

    public ComplexNumber subtract(ComplexNumber a){ //Subtraction
        ComplexNumber b = new ComplexNumber();
        b.real = real - a.real;
        b.imagine = imagine - a.imagine;
        return b;
    }

    public ComplexNumber conjugate(){ //Complex-conjugate number
        ComplexNumber b = new ComplexNumber();
        b.real = real;
        b.imagine = -imagine;
        return b;
    }

    public ComplexNumber divide(ComplexNumber a) { //Division
        ComplexNumber b = new ComplexNumber();
        b.real = ComplexNumber.multiply(this, conjugate(a)).real / multiply(a, conjugate(a)).real;
        b.imagine = ComplexNumber.multiply(this, conjugate(a)).imagine / multiply(a, conjugate(a)).real;
        return b;
    }
}