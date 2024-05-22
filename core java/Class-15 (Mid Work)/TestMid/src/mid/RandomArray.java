package mid;

import java.util.Random;
import java.util.Scanner;

public class RandomArray {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Random random = new Random();

        int number = random.nextInt(10) + 1;
        int[] array = new int[number];

        System.out.println("Enter " + number + " numbers the array:");
        for (int i = 0; i < number; i++) {
            array[i] = scanner.nextInt();
        }

        System.out.println("Array contents:");
        for (int num : array) {
            System.out.println (num + " ");
        }

        scanner.close();
    }
}
