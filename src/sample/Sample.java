package sample;

import java.util.Collections;
import java.util.List;

public class Sample {

    public static void main(String[] args) {
        Person p1 = new Person("AAAA");
        List<Person> list = Collections.nCopies(20, p1);
        list.get(0).setName("New name");
        System.out.println(list.size());

        System.out.println(list);
        //The line will throw error as the immutable list can not be changed.
        Person p2 = new Person("BBBB");
        //list.add(p2);
    }
}

class Person {
    private String name;

    public Person(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return this.name;
    }
}