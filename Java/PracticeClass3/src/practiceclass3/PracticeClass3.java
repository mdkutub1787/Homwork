
package practiceclass3;

/**
 *
 * @author MD KUTUB UDDIN
 */
public class PracticeClass3 {

    
    public static void main(String[] args) {
       
   
        long totalMilliseconds=System.currentTimeMillis();
        long totalSeconds=totalMilliseconds/1000;
        long currentSecond=totalSeconds %60;
        long totalMinutes=totalSeconds /60;
        long currentMinute=totalMinutes % 60;
        long totalHours=(totalMinutes /60)+6;
        long currentHore=totalHours %24;
        
        System.out.println("Current Time is: " + currentHore + " :"
                +currentMinute+" :" + currentSecond+ " :"+ "GMT" );
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        Fahrenheit To Celsius
//        Scanner input=new Scanner(System.in);
//        System.out.println("Enter fahrenheit & check the temperature ");
//        float fahrenheit=input.nextFloat();
//        
//        float result=((fahrenheit -32)/9)*5;
//        
//        System.out.println("temperature the celcius : " + result);
        
        
//          Celsius to Fahrenheit
        
//        Scanner input=new Scanner(System.in);
//        System.out.println("Enter fahrenheit & check the celcius");
//        float celcius=input.nextFloat();
//        
//        float resul=(celcius*9/5 +32);
//        
//        System.out.println("Celcius: "+ resul);
//        
        
    }
    
}
