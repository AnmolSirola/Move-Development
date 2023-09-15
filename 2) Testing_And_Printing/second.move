
module 0x57::SocialNetwork{
    use std::debug;

    struct Person has drop{  // has drop means it has the ability to be dropped
        age:u8 
    }

    public fun set_age(new_age: u8): u8 /* it returns a u8 */ {
        let person = Person { age: new_age }; 
        debug::print(&person.age);
        person.age // or return person.age;
    }

    #[test]
    fun test_set_age(){                                  
        let age = set_age(10);
        debug::print(&age);
    }
}