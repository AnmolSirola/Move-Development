module car::car_admin{

    use sui::object::{Self, UID}; 
    use sui::tx_context::{Self, TxContext}; 
    use sui::transfer;

    struct AdminCapability has key{
        id: UID
    }

    fun init(ctx: &mut TxContext){

    // This calls the transfer::transfer() function to transfer a new AdminCapability object to the sender of the transaction        
        transfer::transfer(AdminCapability {

    /* it creates a new AdminCapability object by calling the object::new() function. The object::new() function 
    takes a transaction context as an argument and generates a unique identifier (UID) for the new object. */     

            id: object::new(ctx),
            
    //The AdminCapability object has a single field, id, which is a UID. The id field is used to identify the AdminCapability object.

    // The tx_context::sender() function is used to get the sender of the current transaction.


        },  tx_context::sender(ctx))
    }
}