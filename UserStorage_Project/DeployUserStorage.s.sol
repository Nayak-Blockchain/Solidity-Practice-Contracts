// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {UserStorage} from "../src/UserStorage.sol";

contract UserStorageScript is Script {
    function run() external {
        vm.startBroadcast();
        UserStorage userStorage = new UserStorage();
        vm.stopBroadcast();
        console.log("Contract deployed at:", address(userStorage));
    }
}