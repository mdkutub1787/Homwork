package sumsub;

import java.util.Scanner;

/**
 *
 * @author MD KUTUB UDDIN
 */
public class Sumsub {

    public static void main(String[] args) {

//        Scanner input = new Scanner(System.in);
//        System.out.println("Enter first number");
//        float num1 = input.nextFloat();
//
//        System.out.println("Second number");
//        float num2 = input.nextFloat();
//
//        int result = (int) (num1 + num2);
//        System.out.println("Total Sum :" + result);
        
        
        Scanner input = new Scanner(System.in);
        System.out.println("Enter first number");
        float num1 = input.nextFloat();

        System.out.println("Enter Second number");
        float num2 = input.nextFloat();

        int result = (int) (num1 - num2);
        System.out.println("Total Sub :" + result);

    }

}
