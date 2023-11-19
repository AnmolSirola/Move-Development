
module Bootcamp::Struct{
    use std::string::String; //1 
    use sui::object::{Self, UID};// 2
    use sui::tx_content::{Self, TxContent}; //3
    use sui::transfer //4

    struct Admin has key{
        id: UID; 
    }

    struct Messenger has key{
        id: UID; //2 
        name: String; //1 
        message: String;
        from: address;
        to: address;
    }

    public entry fun create_messenger(_:Admin ,name: vector<u8>, message: vector<u8>, to: address, ctx: &mut TxContent){   /// in entry fun u cant return a value

    // We need to add the transaction context as the last parameter to our functions
        let messager = Messenger{
            id: object::new(ctx),
            name: string::utf8(name), // it takes vector of u8 and converts it into string
            message: string::utf8(message),
            //from: tx_context::sender(ctx), //we will go to tx_context and from it we are going to call the sender that is ctx, it is going to give us the address
            from,
            to,
        };

        // we are going to transfer the object to the caller of the message so that they can have this object

        //transfer::transfer(messenger, tx_contex::sender(ctx)); // 4  we are going to transfer the object to the caller of the message so that they can have this object
        transfer::transfer(messenger, to);
    }

    fun init(ctx: &mut Tx_Context){  //this function will run once we deploy our contract
        transfer::transfer(Admin{id: object::new(ctx)}, tx_context::sender(ctx)); //we are transfering the admin object to the sender of the transaction  
    }
    #[test_only]
    public fun init_for_testing(ctx: &mut Tx_Contex){
        init(ctx);
    }
} 
