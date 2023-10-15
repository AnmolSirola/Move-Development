//Vectors, Assert and type ablities
module 0xea::SocailNetwork{
    use std::debug;
    use std::vector; // 2) Importing primitive type vector from the standard library which allows us to create vectors containing any type

    struct Friend has store, key, drop{
        people: vector<Person> // Each element in this vector is going to be a vector of person
    }

    struct Person has store, key, drop{  // has drop means it has the ability to be dropped  1) giving person struct few more abilities it is going to have store and key whihc means it has the ability to be stored in something called  global storage
        name: vector<u8> 
        age: u8 
    }
    
    public fun create_fun(friend: Person, friends: &mut Friends): Person {         

        let newFriend = Person{ 
            name: friend.name
            age: friend.new_age
        }

        addFriend(newFriend, friends)
        return newFriend // 5) return the friend
    }

    public fun addFriend(_person: Person, friends: &mut Friends): Person {  // 3) addFriend function which takes a friend and a friends vector and returns a person
        vector::push_back(&mut friends.people, _person) // 4) push the friend into the vector
    }

    public fun set_age(new_age: u8): u8 /* it returns a u8 */ {
        let person = Person { age: new_age }; 
        debug::print(&person.age);
        person.age // or return person.age;
    }

}