
module 0x57::SocialNetwork{

    struct Person has drop{  // has drop means it has the ability to be dropped
        age:u8 
    }

    public fun set_age(new_age: u8): u8 /* it returns a u8 */ {
        let person = Person { age: new_age } 
        person.age // or return person.age;
    }
}