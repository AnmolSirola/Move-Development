module MyAddr::Math{
  use aptos_std::debug;

  /**
   * Adds two u8 numbers together and returns the result.
   */
  public fun sum(a:u8, b:u8):u8{
    (a+b)
  }

  /**
   * Adds a u64 number to a u8 number and returns the result.
   * The u8 number is automatically converted to a u64 before the addition.
   */
  public fun sum_incomp(a:u64, b:u8):u64{
    (a+ (b as u64))
  }

  /**
   * Returns the larger of two u8 numbers.
   */
  public fun max(a:u8, b:u8):u8{
    if(a > b)
    {a}
    else{b}
  }

  /**
   * Calculates the sum of the first n u8 numbers and returns the result.
   *
   * @param n The number of terms to sum.
   * @return The sum of the first n u8 numbers.
   */
  public fun whilen(n:u8):u8{
    let i:u8=1;
    let sum:u8=0;
    while(i<=n){
      sum = sum + i;
      i = i+1;
    };
    sum   
  }

  /**
   * Subtracts two u8 numbers and returns the result.
   */
  public fun sub(a:u8, b:u8):u8{
    (a-b)
  }

  /**
   * Multiplies two u8 numbers and returns the result.
   */
  public fun mul(a:u8, b:u8):u8{
    (a*b)
  }

  /**
   * Divides two u8 numbers and returns the result.
   */
  public fun div(a:u8, b:u8):u8{
    (a/b)
  }

 /*

 * The #[test(account = @0x1)] annotation tells the Move compiler to run this function as a test. The account = @0x1 part specifies that the test should be run with the account address @0x1.
 * The public entry keyword means that this function can be called from outside of the module.
 * The let c:u8 = sum(6,5); line in the calc() function creates a new variable called c and assigns it the result of calling the sum() function with the arguments 6 and 5.
 * The debug::print<u8>(&c) line in the calc() function prints the value of the variable c to the debug log.
 * The calc1() function is similar to the calc() function, but it calls the sum_incomp() function instead of the sum() function. The sum_incomp() function can add a u64 number to a u8 number.
 * The whiletest() function calculates the sum of the first 13 u8 numbers and prints the result to the debug log.

  */

  #[test(account = @0x1)]
  public entry fun calc(){
    let c:u8 = sum(6,5);
    debug::print<u8>(&c)
  }

  #[test(account = @0x1)]
  public entry fun calc1(){
    let c:u64 = sum_incomp(266,5);
    debug::print<u64>(&c)
  }

  #[test(account = @0x1)]
  public entry fun whiletest(){
    let c:u8 = whilen(13);
    debug::print<u8>(&c)
  }
   
}