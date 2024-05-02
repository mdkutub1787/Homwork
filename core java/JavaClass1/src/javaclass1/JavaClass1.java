package javaclass1;

import java.util.Scanner;

public class JavaClass1 {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        System.out.println("Enter length");
        double length = input.nextInt();
        System.out.println("Enter width");
        double width = input.nextInt();

        double area = length * width;

        System.out.println("Area of Rectangle=" + area);

    }

}
