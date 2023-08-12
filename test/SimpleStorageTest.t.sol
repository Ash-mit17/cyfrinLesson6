//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract TestSimpleStorage{

    SimpleStorage public simpleStorage;

    function setUp() external{
        DeploySimpleStorage _deploySimpleStorage = new DeploySimpleStorage();
        simpleStorage = _deploySimpleStorage.run();
    }

    function testStore() public{
        uint256 expectedNumber=878;
        simpleStorage.store(expectedNumber);
        assert(simpleStorage.retrieve() == expectedNumber);
    }

    function testCreatePerson() public{
        string memory name="Ram";
        uint256 favoritenum=123;

        simpleStorage.addPerson(name, favoritenum);

        uint256 storednum=simpleStorage.nameToFavoriteNumber(name);

        assert(storednum == 123);
    }
}

