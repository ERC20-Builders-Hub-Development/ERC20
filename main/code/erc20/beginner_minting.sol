// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title SimpleERC20 Token
/// @notice A basic ERC20 token example using OpenZeppelin
contract SimpleERC20 is ERC20 {
    /// @notice Mints initial supply to the deployer
    /// @param initialSupply Initial token supply (in wei units)
    constructor(uint256 initialSupply) ERC20("SimpleToken", "SIM") {
        _mint(msg.sender, initialSupply);
    }
}
