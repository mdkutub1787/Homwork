package factorial5;

/**
 * @author MD KUTUB UDDIN
 */
public class Factorial5 {

    public static void main(String[] args) {

        int number = 5;
        int factorial = 1;
        for (int i = number; i >= 1; i--) {
            factorial *= i;

        }
        System.out.println(factorial);

    }

}
