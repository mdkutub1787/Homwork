package mid;

import java.util.Scanner;

public class Factorial {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter Number");
        int number = input.nextInt();
        
        int factorial = 1;
        for (int i = number; i >= 1; i--) {
            factorial *= i;

        }
        System.out.println(factorial);

    }

}
