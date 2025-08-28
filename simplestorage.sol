// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//contract to store or retrieve favorite number


contract SimpleStorage {

    uint256 public favoritenumber;

    struct Person {
        string name;
        uint256 favoritenumber;
    }

    Person[] public people;

    mapping (string => uint256) public nametofavoritenumber;


    //function for adding more persons name and favorite number
    function AddPerson(string memory _name, uint256 _favoritenumber) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(_favoritenumber > 0, "Favorite number must be positive");
        people.push(Person(_name, _favoritenumber));
        nametofavoritenumber[_name] = _favoritenumber;
    }


    //function for storing favorite number
    function store(uint256 _favoritenumber) public virtual  {
        favoritenumber = _favoritenumber;
    }

    //function for retrieving favorite number
    function retrieve() public view returns (uint256) {
        return favoritenumber;
    }
}
