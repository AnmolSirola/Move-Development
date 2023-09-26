module MyAddr::owner{

  use aptos_std::debug;

  public fun printex(a:u8):u8{
    a
  }

  // While running this test, you can first check the output by commenting lines 17 and 18.
  // After checking the first output, you can first then comment lines 16 and 18 and check its output.
  // Lastly comment lines 16 and 17 and check output. 

  #[test(account = @0x1)]
  public entry fun ownership(){
    let a:u8=23;
    //let c:u8 = printex(copy a);
    let c:u8 = printex(move a);
    //c = printex(a);
    debug::print<u8>(&c);
  }
}