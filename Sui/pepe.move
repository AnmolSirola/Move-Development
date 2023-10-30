module Sui::pepe{

    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct PEPE has drop {}

    fun init(witness: PEPE, ctx: &mut TxContext) {

        let (treasury, metadata) = coin::create_currency(witness, 9, b"PE", b"PEPE", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))

    }

    public entry fun mint(
        treasury: &mut coin::TreasuryCap<PEPE>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }
}
module Sui::pepe{

    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct PEPE has drop {}

    fun init(witness: PEPE, ctx: &mut TxContext) {

        let (treasury, metadata) = coin::create_currency(witness, 9, b"PE", b"PEPE", b"", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))

    }

    public entry fun mint(
        treasury: &mut coin::TreasuryCap<PEPE>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury, amount, recipient, ctx)
    }
}
