//the code imports the UID type from the Sui object module. The UID type is a unique identifier for Sui objects.
module Unit_2::Student {

    //the code imports the UID type from the Sui object module. The UID type is a unique identifier for Sui objects
    use sui::object::{UID};

   /* this  imports the Self and TxContext types from the Sui tx_context module.Self refers to the current module. This is useful 
   for avoiding name collisions when using types from other modules.TxContext is a struct that contains information about the current transaction. 
   This includes the sender's address, the transaction's epoch, and the transaction's gas budget.*/
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

/*The struct has the key attribute, which means that the id field is used as the key for the struct. 
  This means that TranscriptObject structs can be stored in a hash table, where the key is used to lookup the struct. */
  
    struct TranscriptObject has key { 
        id: UID,
        history: u8,
        math: u8,
        literature: u8,
    }
    public entry fun create_transcript_object(history: u8, math: u8, literature: u8, ctx: &mut TxContext) {

        let transcriptObject = TranscriptObject {        
            id: object::new(ctx),
            history,
            math,
            literature,
        };
         transfer::transfer(transcriptObject, tx_context::sender(ctx))
    }

    // You are allowed to retrieve the score but cannot modify it
    public fun view_score(transcriptObject: &TranscriptObject): u8{
        transcriptObject.literature
    }

    // You are allowed to view and edit the score but not allowed to delete it
    public entry fun update_score(transcriptObject: &mut TranscriptObject, score: u8){
        transcriptObject.literature = score
    }

    // You are allowed to do anything with the score, including view, edit, delete the entire transcript itself.
    public entry fun delete_transcript(transcriptObject: TranscriptObject){
        let TranscriptObject {id, history: _, math: _, literature: _ } = transcriptObject;
        object::delete(id);
    }
}  