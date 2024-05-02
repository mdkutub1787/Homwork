package currenttime;

/**
 *
 * @author MD KUTUB UDDIN
 */
public class CurrentTime {

    public static void main(String[] args) {

        long totalMilliseconds = System.currentTimeMillis();

        long totatSeconds = totalMilliseconds / 1000;

        long currentSecond=totatSeconds % 60;
        
        long totalMinutes=totatSeconds /60;
        
        long currentMinute=totalMinutes % 60;
        
       long totalHours=(totalMinutes / 60)+6;
       
       long currentHour=totalHours % 24;
       
        System.out.println("Current time is " + currentHour + ":" 
                + currentMinute + ":" + currentSecond + " GMT ");
        
    }

}
