// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Simple Storage Contract
/// @author JSX1x1
/// @notice This contract allows you to store and retrieve a message
contract SimpleStorage {

    // This variable stores the message
    string private message;

    // Event to emit when message is updated
    event MessageUpdated(string newMessage);

    /// @notice Store a new message
    /// @param _message The message to be stored
    function setMessage(string calldata _message) external {
        message = _message;
        emit MessageUpdated(_message);
    }

    /// @notice Read the last stored message
    /// @return The currently stored message
    function getMessage() external view returns (string memory) {
        return message;
    }
}
