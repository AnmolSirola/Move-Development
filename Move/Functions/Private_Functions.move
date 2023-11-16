
address my_addrx{

  module A{
    fun A_Car(): u8{  // private function

        return 123;

    } 
  }

  module B{
    fun B_Car(): u8{

        return my_addrx::A::A_Car(); //ERROR - as A_Car() is a private function

    }

    #[test]

    fun testing_B(){
        let number = B_Car();
        print(&number);
    }
  }
}