package leapyear;

import java.util.Scanner;

/**
 *
 * @author Kutub Uddin
 */
public class LeapYear {

    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        System.out.print("Enter year :");
        int year = scanner.nextInt();

        boolean isLeapYear = (year % 4 == 0);
        System.out.println(year + "  is Leap Year " + isLeapYear);

        
//        Scanner scanner=new Scanner(System.in);
//        System.out.print("Enter a year : ");
//        int year = scanner.nextInt();
// 
//        boolean isLeapYear= (year % 4 == 0 && year % 100 != 0)|| (year % 400 == 0);
//
//        System.out.println(year+" is leap year " +isLeapYear );
    }

}
