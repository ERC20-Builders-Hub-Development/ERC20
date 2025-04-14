// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Simple Interactions
/// @notice Demonstrates basic interactions with Ethereum for educational purposes
contract SimpleInteractions {
    // Store a simple message
    string public message;

    // Keep track of Ether sent to the contract
    uint256 public totalDonations;

    // Mapping of address to number of messages they’ve sent
    mapping(address => uint256) public messagesSent;

    // Event logs
    event MessageUpdated(address indexed user, string newMessage);
    event DonationReceived(address indexed donor, uint256 amount);

    /// @notice Set a new message and emit an event
    /// @param _message The message the user wants to store
    function setMessage(string calldata _message) external {
        message = _message;
        messagesSent[msg.sender] += 1;
        emit MessageUpdated(msg.sender, _message);
    }

    /// @notice Retrieve the current message
    /// @return The latest message stored
    function getMessage() external view returns (string memory) {
        return message;
    }

    /// @notice Donate some ETH to the contract
    function donate() external payable {
        require(msg.value > 0, "Must send some ETH");
        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    /// @notice Check the balance of this contract (in wei)
    /// @return Current ETH balance held by the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    /// @notice Withdraw all ETH to the deployer's address (for demo only)
    function withdrawAll() external {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    address private immutable owner;

    constructor() {
        owner = msg.sender;
    }
}
