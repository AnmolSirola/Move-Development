/* Module starts with the module keyword, which is followed by 
the module name and curly braces - inside them, module contents are placed: */

/*how importing works use 
    <Address/Alias>::<ModuleName>;*/

module Unit_1::hello_world {

    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext}; 
    
    /// An object that contains an arbitrary string
    struct HelloWorldObject has key, store {
  	    id: UID,
  	/// A string contained in the object
  	    text: string::String
         
    } 
  
/* Entry functions typically have an instance of TxContext as the last parameter. 
   This is a special parameter set by the Sui Move VM and does not need to be specified by the user calling the function.*/


//& is used to create a reference to an object. This means that the code does not own the object, but can only read and write its values.
//ctx, which is a reference to the current transaction context.
    
    public entry fun mint(ctx: &mut TxContext) {
        let object = HelloWorldObject {
            id: object::new(ctx),

//b is used to represent a byte literal. This is a string of bytes that can be used to represent any type of data, such as text, images, or binary code.
            text: string::utf8(b"Hello World!")
        };
        
 //This line transfers the HelloWorldObject object to the sender of the transaction. This means that the sender will now own the object and can do with it as they please.       
        transfer::transfer(object, tx_context::sender(ctx));
    }  
}