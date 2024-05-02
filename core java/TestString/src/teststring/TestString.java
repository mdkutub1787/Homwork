package teststring;

import java.util.Scanner;

/**
 * @author kutub Uudin
 */
public class TestString {

    public static void main(String[] args) {

//        Scanner s = new Scanner(System.in);
//
//        System.out.println("Enter  Your Email Address:");
//        String userEmail = s.next();
//
//      
//        String message = String.format("welcome %s to Google", userEmail);
//
//        if (userEmail.equalsIgnoreCase("java")) {
//            System.out.println("Enter Your Password:");
//            
//            String password = s.next();
//            if (password.equals("Java1234")) {
//                System.out.println(message);
//
//            } else {
//                System.out.println("Incorrect Password");
//            }
//        } else {
//            System.out.println("Couldn't find Your Google Account");
//        }
//        Scanner s = new Scanner(System.in);
//
//        System.out.println("Enter  Your Name:");
//        String name = s.next();
//
//        String message = String.format("welcome %s ", name);
//        System.out.println(message);
        Scanner s = new Scanner(System.in);

        System.out.println("Enter  Your Email Address:");
        String userName = s.next();
        String message = String.format("welcome %s ", userName);
        System.out.println("Enter  Password:");
        String password = s.next();
        
        if (userName.equalsIgnoreCase("java") && userName.length() < 4
                && password.equals("Java1234") && password.length() < 10) {
            System.out.println(message);
        } else {
            System.out.println("incorrect username & password");
        }

    }
}
