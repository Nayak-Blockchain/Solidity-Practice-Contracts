// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listofSimpleStorageContracts; // Consistent variable name

    event ContractCreated(address contractAddress);

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listofSimpleStorageContracts.push(newSimpleStorageContract); // Fixed typo
        emit ContractCreated(address(newSimpleStorageContract));
    }

    function sfStore(uint256 _index, uint256 _favoritenumber) public {
        require(_index < listofSimpleStorageContracts.length, "Index out of bounds");
        SimpleStorage mySimpleStorage = listofSimpleStorageContracts[_index];
        mySimpleStorage.store(_favoritenumber);
    }

    function sfGet(uint256 _index) public view returns (uint256) {
        require(_index < listofSimpleStorageContracts.length, "Index out of bounds");
        SimpleStorage mySimpleStorage = listofSimpleStorageContracts[_index];
        return mySimpleStorage.retrieve();
    }
}