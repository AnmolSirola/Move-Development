/* Creating Reasorces:

Resources are special type of structs which can't be copied or discarded, Only the key can be used to store value.
Resorces are stored under account.
An account can hold only one resource of a given type at a time.

move_to<T>(&signer, T) --> to give a resource, will abort if account already has that resource.
move_from<T>(address):T --> delete T from account, will abort if account does not have T.
borrow_global_mut<T>(address):&mut T --> borrow Mutable reference.
borrow_global<T>(address):&T --> borrow Immutable reference.
exists<T>(address):bool --> checks if T exists at the address, won't abort at all.

when function accesses a resource usinf move_from, borrow_global or borrow_global_mut, 
the function must indicate that it "acquires" that resource.
This is then used by Move's type system to ensure the references into global storage are safe, 
specifically that there are no dangling references into global storage.

*/

module MyAddr::Colln{

  use std::vector; // https://aptos.dev/move/book/vector --> to know more about vectors.
  use std::signer;
  use std::debug;

  // a struct should have a name that starts with an upper case.
  struct Item has store,drop{} // struct Item is not a resource because we have mentioned the drop keyword. 

  struct Collection has store,key{
    items: vector<Item>,
  }

  public fun startCollection(account: &signer){
    move_to<Collection>(account, Collection{items: vector::empty<Item>()});
  }

  public fun existsAt(at:address):bool{
    exists<Collection>(at)
  }

  public fun add_item(account: &signer) acquires Collection{
    let addr = signer::address_of(account);
    // let collection = borrow_global<Collection>(addr);
    let collection = borrow_global_mut<Collection>(addr);
    vector::push_back(&mut collection.items, Item{});
  }

  public fun size(account: &signer):u64 acquires Collection{
    let addr = signer::address_of(account);
    let collection = borrow_global<Collection>(addr);
    vector::length(&collection.items)
  }

  public fun destroy(account: &signer) acquires Collection{
    let addr = signer::address_of(account);
    let collection = move_from<Collection>(addr);
    let Collection{items:_} = collection;
  }

  #[test(account = @0x42)]
  public entry fun resourceTest(account: signer) acquires Collection{
    MyAddr::Colln::startCollection(&account);
    let addr = signer::address_of(&account);
    let b:bool = MyAddr::Colln::existsAt(addr);
    debug::print<bool>(&b);
    MyAddr::Colln::add_item(&account);
    let collectionLength:u64 = MyAddr::Colln::size(&account);
    debug::print<u64>(&collectionLength);
    MyAddr::Colln::destroy(&account);
    // MyAddr::Colln::destroy(&account);
    let c:bool = MyAddr::Colln::existsAt(addr);
    debug::print<bool>(&c);
  }

}