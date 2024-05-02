package resultgrade;

import java.util.Scanner;

/**
 *
 * @author MD KUTUB UDDIN(1281514)
 */
public class ResultGrade {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Enter the mark & check ur grade");
        double mark=input.nextDouble();
        
        if(mark <33){
            System.out.println("F");
        }
        else if(mark <40){
            System.out.println("D");
        }
        else if(mark <50){
            System.out.println("C");
        }
        else if(mark <60){
            System.out.println("B");
        }
        else if(mark <70){
            System.out.println("A-");
        }
        else if(mark <80){
            System.out.println("A");
        }
        else if(mark <=100){
            System.out.println("A+");
        }
        else{
            System.out.println("Invalid Number");
        }    
        
//        System.out.println("Enter Mark: ");
//        float mark = input.nextFloat();
//
//        if (mark > 100 || mark < 0) {
//            System.out.println("Invalid Mark");
//
//        } else if (mark < 32) {
//            System.out.println("F");
//        } else if (mark < 40) {
//            System.out.println("D");
//        } else if (mark < 50) {
//            System.out.println("C");
//        } else if (mark < 60) {
//            System.out.println("B");
//        } else if (mark < 70) {
//            System.out.println("A-");
//        } else if (mark < 80) {
//            System.out.println("A");
//        } else {
//            System.out.println("A+");
//        }

    }

}
