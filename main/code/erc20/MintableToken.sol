// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the ERC20 contract from OpenZeppelin
// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// Create a new contract that inherits from ERC20 and Ownable
contract MintableToken is ERC20, Ownable {
    // Constructor to initialize the token with a name and symbol
    constructor(uint256 initialSupply) ERC20("MintableToken", "MTK") {
        // Mint the initial supply of tokens to the deployer's address
        _mint(msg.sender, initialSupply);
    }

    // Mint function that can be called by the owner only
    function mint(address to, uint256 amount) public onlyOwner {
        // Mint the specified amount of tokens to the given address
        _mint(to, amount);
    }

    // Burn function that can be used to destroy tokens from the sender's account
    function burn(uint256 amount) public {
        // Burn the specified amount of tokens from the sender's account
        _burn(msg.sender, amount);
    }
}
