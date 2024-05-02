package fahrenheittocelsius;

import java.util.Scanner;

/**
 *
 * @author MD KUTUB UDDIN
 */
public class FahrenheitToCelsius {

    public static void main(String[] args) {

//        Fahrenheit To Celsius

//        Scanner input=new Scanner(System.in);
//        System.out.println("Please Enter temperature in Fahrenheit: ");
//        float fahrenheit=input.nextFloat();
//        
//        float result=((fahrenheit-32)/9)*5;
//        System.out.println("Temperature in Celcius:" + result);


//        Celsius to Fahrenheit

        Scanner input = new Scanner(System.in);
        System.out.println("Please Enter temperature  : ");
        float celcius = input.nextFloat();

        float result = (celcius * 9 / 5) + 32;
        System.out.println("Temperature in fahrehite:" + result);

//    int x=5, z=10;
//    x++;
//    z--;   
//    System.out.println(x);
    }

}
