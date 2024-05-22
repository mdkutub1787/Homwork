package work;

import java.util.Scanner;

/**
 * @author MD KUTUB UDDIN
 */
public class BreackContinue {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        double sum = 0;

        while (true) {
            System.out.println("Enter number :");
            double number = input.nextDouble();

            if (number < 0) {
                break;
            } else {
                sum += number;
            }
        }
        System.out.println("Total Sum : " + sum);

    }

}
