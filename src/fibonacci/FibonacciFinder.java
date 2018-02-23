package fibonacci;

import complex.ComplexNumber;

public class FibonacciFinder {

    public static void main(String[] args) {
        int a = 1;
        int b = 0;
        for (int i = 0; i < 10; i++){
            System.out.println(a);
            int temp = a + b;
            b = a;
            a = temp;
        }
        }
}
