module 0x42::Generics {
    use std::vector;
    use std::debug;
    /* Part 1
    struct Flexi<AnyType>{
        x: AnyType
    }

    fun new_flexi(_x: u8): Flexi<u8> {
        return Flexi{
            x: _x 
        }
    }

    #[test]
    fun test_new_flexi(){
        let flexi = new_flexi(8);
        debug::print(&flexi);
    } */
 
    // Part 2
   
    struct Flexi<T1, T2> has drop{
        x: T1,
        y: vector<T2>,
    }

    fun new_flexi(_x: bool, _y: vector<u8>): Flexi<bool, u8> {
        return Flexi{
            x: _x,
            y: _y, 
        }
    }

    fun generic_func<HelloType>(t: HelloType): HelloType {
        return t;
    }

    fun new_vector<T>(arg:T): vector<T> {
        let vec = vector::empty<T>();
        vector::push_back(&mut vec, arg);
        return vec;
    }

    #[test]
    fun test_new_flexi(){
        let y = vector<bool>{true, false, true, true};
        let flexi = new_flexi(8, y);
        debug::print(&flexi);
    } 

    #[test]
    fun test_generic_func(){
        let vec = vector<bool>[true, true, true, false];
        let thing = generic_func(vec);
        debug::print(&thing);
    }

    #[test]
    fun test_new_vector(){
        let vec = new_vector(b"vectorrrr");
        debug::print(&vec);
    }
}