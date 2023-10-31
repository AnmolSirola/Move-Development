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

    fun new( speed: u8, acceleration: u8, handling: u8, ctx: &mut TxContext): Car{ // 2
        Car{
            id: ctx.new_uid(),
            speed: speed,
            acceleration: acceleration,
            handling: handling,
        }
    }
    
    public entry fun create(speed: u8, acceleration: u8, handling: u8, ctx: &mut TxContext){  //3
        let car = new(speed, acceleration, handling, ctx); 
        transfer::transfer(car, tx_context::sender(ctx));
    }
}l