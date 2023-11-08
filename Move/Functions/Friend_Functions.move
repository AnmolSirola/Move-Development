
address my_addrx{

  module A{

    friend my_addrx::B; //declaring friends of module B

    public(friend) fun A_Car(): u8{  //declaring A_Car() as friend function

        return 123;

    } 
  }

  module B{

    fun B_Car(): u8{

        return my_addrx::A::A_Car();   //Module B can call A_Car() as B is in friend list of A

    }
  }  

  module C{

    fun C_Car():u8{
         
        return my_addrx::A::A_car () //ERROR - as module C is not in friend list of A
    }   
  }
}


