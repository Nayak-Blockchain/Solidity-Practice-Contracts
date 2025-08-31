// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*This contract allows users store name and age
  Let's them update it, 
  Allow them retrieve it,
  owned by a deployer
*/

contract UserStorage {
    address public owner;// owner variable, stores contract deployer's address
    
    struct UserData {
        //This struct contains users data
        string name;
        uint256 age;
        string email;  
    }

    mapping (address => UserData) private userDetails;//This mapping links users address to their respective details (struct)

    constructor() {
        owner = msg.sender; //This ensures the owner is the message sender
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;    
    }

    //This function store users data (name, age, email)
    function store(string memory _name, uint256 _age, string memory _email) public {
        userDetails[msg.sender] = UserData(_name, _age, _email);
    }

    //This function uses an address input to get user details from the struct (which was mapped to the address)
    function getDetails(address _user) public view returns (string memory, uint256, string memory) {
        UserData memory user = userDetails[_user];
        return (user.name, user.age, user.email);
    }

    //This function enable user update their own data
    function updateDetail(string memory _name, uint256 _age, string memory email) public {
        UserData memory updateData = UserData({name: _name, age: _age, email: email});
        userDetails[msg.sender] = updateData;
    }

    //  This function enable user to delete data input (name, age, email)
    function deleteUser(address _user) public {
        delete userDetails[_user];
    }

    // This function gets the contract deployer address
    function getOwner() public view returns (address) {
        return owner;
    }
}