
import java.util.Scanner;

public class MaxMin {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter First Number");
        int number1 = input.nextInt();

        System.out.println("Enter Second Number");
        int number2 = input.nextInt();

        int maxNumber, minNumber;

        maxNumber = number1;
        minNumber = number1;

        if (number2 > maxNumber) {
            maxNumber = number2;
        } else if (number2 < minNumber) {
            minNumber = number2;
        }

        System.out.println("Maximum number is: " + maxNumber);
        System.out.println("Minimum number is: " + minNumber);
    }
}
