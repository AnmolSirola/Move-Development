module car::car{

    use sui::object::{Self, UID}; //1 
    use sui::tx_context::{Self, TxContext}; //2 
    use sui::transfer; //3

    struct Car has key{   //1

        id: UID,
        speed: u8,
        acceleration: u8,
        handling: u8,
    }

    // ctx: A mutable reference to a TxContext object.

    fun new( speed: u8, acceleration: u8, handling: u8, ctx: &mut TxContext): Car{ // 2
        Car{
            id: ctx.new_uid(),  //used to generate a new unique identifier for the Car object. The new_uid() method is a member 
                                // of the TxContext object, which provides information about the current transaction.
            speed: speed,
            acceleration: acceleration,
            handling: handling,
        }
    }

    public entry fun create(speed: u8, acceleration: u8, handling: u8, ctx: &mut TxContext){  //3

        /*This code creates a new Car object using the new() function. The new() function takes the speed, acceleration, 
        handling, and TxContext object as parameters. */    

        let car = new(speed, acceleration, handling, ctx); 

        /*code transfers the new Car object to the sender of the current transaction using the transfer() function. 
        The transfer() function takes the Car object and the recipient's account address as parameters.*/

        transfer::transfer(car, tx_context::sender(ctx));
    }
}l