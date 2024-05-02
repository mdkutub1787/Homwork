package pkgswitch;

import java.util.Scanner;

/**
 *
 * @author Kutub Uddin
 */
public class Switch {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

//        System.out.print("Enter day Number : ");
//        int numberOfDay = scanner.nextInt();
//        String dayName;
//
//        switch (numberOfDay) {
//            case 1:
//                dayName = "Saturday";
//                break;
//            case 2:
//                dayName = "Sunday";
//                break;
//            case 3:
//                dayName = "Monday";
//                break;
//            case 4:
//                dayName = "Tuesday";
//                break;
//            case 5:
//                dayName = "Wednesday";
//                break;
//            case 6:
//                dayName = "Thursday";
//                break;
//            case 7:
//                dayName = "Friday";
//                break;
//            default:
//                dayName = "Invalid day number";
//        }
//
//        System.out.println("Day name is : " + dayName);
        System.out.print("Please Enter first number : ");
        float number1 = scanner.nextFloat();
        System.out.print("Please Enter Second number : ");
        float number2 = scanner.nextFloat();
        System.out.println("Add(+)Press 1 \n Sub(-) Press 2 \n Multiply(*) Press 3 \nDivision(/) press 4 \nMod(%) Press 5");

        int choice = scanner.nextInt();

        float result = 0.0f;

        switch (choice) {
            case 1:
                result = number1 + number2;
                break;
            case 2:
                result = number1 - number2;
                break;
            case 3:
                result = number1 * number2;
                break;
            case 4:
                result = number1 / number2;
                break;
            case 5:
                result = number1 % number2;
                break;
            default:
                System.out.println("invalid choice");
        }
        System.out.println("result is " + result);
    }

}
