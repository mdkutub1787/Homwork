
import java.util.Scanner;

public class Prime {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter Number");
        int number = input.nextInt();

        int count = 0;

        for (int i = 1; i <= number; i++) {

            if (number % i == 0) {
                count += 1;
            }
        }

        if (count == 2) {
            System.out.println("It is Prime Number");
        } else {
            System.out.println("It is Not bPrime Number");
        }

    }
}
