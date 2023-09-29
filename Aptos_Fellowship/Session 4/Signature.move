/* Signer : It is an in-built resource type for move. signer values cannot be created via literals.
signers should come first in the list of arguments for a function in script. we will be looking at two functions:
signer::address_of(&signer):address --> Returns the address wrapped by this signer &singer
signer::borrow_address(&signer):&address --> Returns a reference to the address wrapped by this signer */

module MyAddr::signature{
  use aptos_std::debug;
  use aptos_std::signer;

  // While running this test, you can first check the output by commenting line 17.
  // After checking the first output, you can first then comment lines 16 and 17 and check its output.
  // Lastly comment lines 16 and 18 and check output. 

  #[test(sn = @0x1)]
  public entry fun mainsign(sn:signer){
    // let a:signer = @ox42;
    //let addr = address_of(&sn);
    let addr = signer::address_of(&sn);
    debug::print<address>(&addr);
    }
}

/* The above code will print the address of the signer.