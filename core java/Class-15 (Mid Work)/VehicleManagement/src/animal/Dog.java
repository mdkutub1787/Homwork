package animal;

/**
 * @author MD KUTUB UDDIN
 */
public class Dog extends Animal {

    private String breed;

    public Dog() {
    }

    public Dog(String breed) {
        this.breed = breed;
    }

    public Dog(String breed, String name, int age) {
        super(name, age);
        this.breed = breed;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    @Override
    public void makeSound() {

        System.out.println(super.getName());
        System.out.println(super.getAge());
        System.out.println(this.breed);

    }

}
