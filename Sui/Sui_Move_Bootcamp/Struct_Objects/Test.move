
#[test_only]
module example::mesenger_test{
    use sui::test_scenario;
    use example::messenger::{Self, Messenger, Admin};

    #[test]
    fun test_create(){
        let owner = @0xA;
        let user1 = @0xB;
        let user2 = @0xC;

        let scenario_val = test_scenario::begin(owner);
        let scenario = &mut scenario_val;

        test_scenario::next_tx(scenario, owner);
        {
            messenger::init_for_testing(test_scenario::ctx(scenario));
        };

        test_scenario::next_tx(scenario, owner);
        {
            let admin = test_scenario::take_from_sender<Admin>(scenario);
        }
        
    }
}