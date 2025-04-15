// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAuction {
    address public owner;
    address public highestBidder;
    uint256 public highestBid;
    bool public auctionEnded;
    
    // Mapping to track bids of each address
    mapping(address => uint256) public bids;

    // Events to log actions
    event NewBid(address indexed bidder, uint256 amount);
    event AuctionEnded(address winner, uint256 amount);

    // Modifier to ensure only the owner can end the auction
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can end the auction");
        _;
    }

    // Modifier to ensure that the auction has not ended
    modifier auctionNotEnded() {
        require(!auctionEnded, "Auction has already ended");
        _;
    }

    constructor() {
        owner = msg.sender; // Set contract creator as owner
        highestBid = 0;
        auctionEnded = false;
    }

    // Function to place a bid
    function placeBid() public payable auctionNotEnded {
        require(msg.value > highestBid, "Bid must be higher than the current highest bid");

        // Refund previous highest bidder
        if (highestBidder != address(0)) {
            payable(highestBidder).transfer(highestBid);
        }

        highestBidder = msg.sender;
        highestBid = msg.value;

        // Log the new highest bid
        emit NewBid(msg.sender, msg.value);
    }

    // Function to end the auction and send the funds to the owner
    function endAuction() public onlyOwner auctionNotEnded {
        auctionEnded = true;
        emit AuctionEnded(highestBidder, highestBid);

        // Transfer the funds to the owner
        payable(owner).transfer(highestBid);
    }

    // Function to withdraw any remaining balance (in case of overpayments)
    function withdraw() public {
        uint256 amount = bids[msg.sender];
        require(amount > 0, "No funds to withdraw");

        bids[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}
