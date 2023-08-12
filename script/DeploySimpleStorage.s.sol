//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script{

    SimpleStorage simpleStorage;
    
    function run() public returns(SimpleStorage){

        vm.startBroadcast();

        simpleStorage=new SimpleStorage();
        
        vm.stopBroadcast();
        return simpleStorage;
    }

}