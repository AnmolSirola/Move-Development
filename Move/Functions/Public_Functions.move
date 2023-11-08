
address my_addrx{

  module A{
    public fun A_Car(): u8{  // private function

        return 123;

    } 
  }

  module B{

    use std::debug::print;
    fun B_Car(): u8{

        return my_addrx::A::A_Car();

    }

    #[test]

    fun testing_B(){
        let number = B_Car();
        print(&number);
    }
  }
}