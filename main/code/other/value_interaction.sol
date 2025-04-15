// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleInteraction {
    address public owner;
    uint256 public value;

    event ValueUpdated(uint256 newValue);

    // Constructor to set the owner and initial value
    constructor() {
        owner = msg.sender;
        value = 0;
    }

    // Only the owner can update the value
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can update the value");
        _;
    }

    // Function to update the stored value
    function updateValue(uint256 newValue) public onlyOwner {
        value = newValue;
        emit ValueUpdated(newValue);
    }

    // Function to get the current value
    function getValue() public view returns (uint256) {
        return value;
    }
}
