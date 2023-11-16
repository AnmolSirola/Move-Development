
module my_addrx::Loops{
    
    use std::debug::print;

    fun Sum(n: u64): u64{

        let sum = 0;
        let i:u64 =1;
        while(i <=n){
            sum = sum + i;
            i = i + 1;
        }
        return sum 
    }

    #[test]
    fun testing{
        let Sum = sum(10);
        print(&Sum);
    }
}

