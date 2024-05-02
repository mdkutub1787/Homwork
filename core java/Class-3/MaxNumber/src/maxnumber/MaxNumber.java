package maxnumber;

import java.util.Scanner;

/**
 *
 * @author MD KUTUB UDDIN
 */
public class MaxNumber {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
//        int maxNumber;
//
//        System.out.println("Enter first number");
//        int num1 = input.nextInt();
//
//        System.out.println("Enter second number");
//        int num2 = input.nextInt();
//
//        System.out.println("Enter third number");
//        int num3 = input.nextInt();
//
//        if (num1 > num2 && num1 > num3) {
//            maxNumber = num1;
//        } else if (num2 > num1 && num2 > num3) {
//            maxNumber = num2;
//        } else {
//            maxNumber = num3;
//        }
//        System.out.println("Max Number : " + maxNumber);
//        
        
        int maxNumber;
        System.out.println("Enter First Number");
       int firstNumber = input.nextInt();

        System.out.println("Enter Second Number");
        int secondNumber = input.nextInt();

        System.out.println("Enter Third Number");
        int thirdNumber = input.nextInt();

        if (firstNumber > secondNumber && firstNumber > thirdNumber) {
            maxNumber = firstNumber;
            
        } else if (secondNumber > firstNumber && secondNumber > thirdNumber) {
            maxNumber = secondNumber;
            
        } else {
            maxNumber = thirdNumber;
        }
        
        System.out.println("Max Number is : " + maxNumber);
    }
}
