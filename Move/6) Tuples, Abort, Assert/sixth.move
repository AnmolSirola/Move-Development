//tuples

module 0x42::Tuple{
    use std::debug;

    fun lots_of_thing(): (u8, vector<u8>, bool) {
        let x = 0;
        let name = b"Anmol";
        let truthy = true;
        (x, name, truthy)
    }

    #[test]
    fun test_lots_of_thing(){
        let (x, name, truthy) = lots_of_thing();

        debug::print(&x);
        debug::print(&name);
        debug::print(&truthy);
    }
}