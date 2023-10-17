//using assert

module 0x42::Assert{
    use std::debug;

    fun must_be_odd(num: u8): bool {
        assert!(num % 2 == 1, 88);
        return true;
    }

    fun must_be_even(num: u8): bool {
        assert!(num % 2 == 0,) abort 9;
        return true;
    }

    #[test]

    fun test_must_be_odd(){
        let x = must_be_odd(1);
        assert!(x == true, 0);
    }

    fun test_must_be_even(){
        let x = must_be_even(2);
        assert!(x == true, 0);
    }
}    