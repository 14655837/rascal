/*
    Test
    test
    test
    test
    test
    test
    test
    test
    test
    test
    test
    public Person() {
    }
    is the start
*/

public class Person {
    private String name;
    private int age;

    public Person() {
        this.name = "Unknown";
        this.age = 0;
    }

    // public Person(String name, int age) {
    //     this.name = name;
    //     this.age = age;
    // }

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public String getNameComments() {
        //Some string to test with
        //For a very long time 
        // As ypu motherfuckers can see
        // I don't know what I write
        return name;
    }

    public String getNameEmptyLines() {




        return name;
    }

    public String getNameMuliLineComment() {
        /* 
        This is a multi-line comment in Java.
        It can span multiple lines.
        The compiler ignores everything inside this comment.
        */
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void sayHello() {
        System.out.println("Hello, my name is " + name + " and I am " + age + " years old.");
    }

    @Override
    public String toString() {
        return "Person{name='" + name + "', age=" + age + "}";
    }
}
