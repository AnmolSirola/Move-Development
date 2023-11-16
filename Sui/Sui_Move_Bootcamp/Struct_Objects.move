
module Bootcamp::Struct{
    use std::string::String;
    use sui::object::{Self, UID};

    struct Messenger has key{
        id: UID;
        name: String;
        message: String;
        from: address;
        to: address;
    }

    public entry fun create_messenger(name: vector<u8>, message: vector<u8>, to: address){

    }

} 
