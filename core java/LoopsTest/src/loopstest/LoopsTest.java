package loopstest;

import java.util.Scanner;

/**
 *
 * @author Kutub Uddin
 */
public class LoopsTest {

    public static void main(String[] args) {
        
        
//        Scanner s = new Scanner(System.in);
//        System.out.println("Enter start point value");
//        int startPoint = s.nextInt();
//
//        System.out.println("Enter End  point value");
//        int endPoint = s.nextInt();

//        while (startPoint <= endPoint) {
//            System.out.println(startPoint + " Hello Java ");
//            startPoint++;
//        }


//             3/5 !=0;
        Scanner s = new Scanner(System.in);
        System.out.println("Enter start point value");
        int startPoint = s.nextInt();

        System.out.println("Enter End point value");
        int endPoint = s.nextInt();

        while (startPoint <= endPoint) {
            if (startPoint % 3 != 0 || startPoint % 5 != 0) {
                System.out.println(startPoint);
            }
            
            startPoint++;
        }

    }

}
