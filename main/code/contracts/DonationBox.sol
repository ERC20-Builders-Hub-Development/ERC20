// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Donation Box Contract
/// @author JSX1x1
/// @notice This contract allows users to donate ETH and lets the owner withdraw it
contract DonationBox {
    
    address public owner;
    uint256 public totalDonations;

    // Maps addresses to how much they donated
    mapping(address => uint256) public donations;

    // Event to log donations
    event Donated(address indexed donor, uint256 amount);
    event Withdrawn(uint256 amount);

    /// @notice Sets the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Donate ETH to the contract
    function donate() external payable {
        require(msg.value > 0, "Must send ETH");
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;

        emit Donated(msg.sender, msg.value);
    }

    /// @notice Withdraw all ETH from the contract (owner only)
    function withdraw() external {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 balance = address(this).balance;
        require(balance > 0, "No ETH to withdraw");

        payable(owner).transfer(balance);
        emit Withdrawn(balance);
    }

    /// @notice Get the contract's ETH balance
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
