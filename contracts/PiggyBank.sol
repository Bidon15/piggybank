// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "hardhat/console.sol";

contract PiggyBank {
    address public owner;
    string name;
    uint256 public expirationDate;
    uint256 totalAmount;

    constructor(string memory _name, uint256 _expire) {
        name = _name;
        expirationDate = _expire;
        owner = msg.sender;
        console.log(name);
    }

    function setName(string memory _newName) public {
        assert(msg.sender == owner);
        name = _newName;
    }

    function getName() public view returns(string memory) {
        return name;
    }

    function donate() public payable {
        totalAmount += msg.value;
    } 

    function getTotalAmount() public view returns(uint256) {
        return totalAmount;
    }


}