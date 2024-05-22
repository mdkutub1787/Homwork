package vehiclemanagement;

import animal.Dog;
import vehicle.Truck;

/**
 * @author MD KUTUB UDDIN
 */
public class VehicleManagement {

    public static void main(String[] args) {

//        Truck truck = new Truck();
//        truck.setRegularprice(200);
//        truck.setWeight(2001);
//
//        System.out.println(truck.getSalePrice());
//         Dog d=new Dog();
//         d.setAge(2);
//         d.setBreed("Germany Shefard");
//         
//         d.makeSound();
        Dog d = new Dog("Germany Shafer", "Hasib", 2);
        d.makeSound();
    }

}
