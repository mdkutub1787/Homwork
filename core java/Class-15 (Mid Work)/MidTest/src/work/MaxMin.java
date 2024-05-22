package work;

import java.util.Scanner;

/**
 * @author MD KUTUB UDDIN
 */
public class MaxMin {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int maxNumber;
        int minNumber;

        System.out.println("Enter first number :");
        int num1 = input.nextInt();

        System.out.println("Enter second number :");
        int num2 = input.nextInt();

        System.out.println("Enter third number :");
        int num3 = input.nextInt();

        if (num1 > num2 && num1 > num3) {
            maxNumber = num1;
        } else if (num2 > num1 && num2 > num3) {
            maxNumber = num2;
        } else {
            maxNumber = num3;
        }

        if (num1 < num2 && num1 < num3) {
            minNumber = num1;
        } else if (num2 < num1 && num2 < num3) {
            minNumber = num2;
        } else {
            minNumber = num3;
        }

        System.out.println("Max Number : " + maxNumber);
        System.out.println("Min Number : " + minNumber);

    }

}
