// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract EtherWallet {
    
    mapping(address => uint256) private wallets;


    function deposit() public payable{
        wallets[msg.sender] += msg.value;
    }

    function transfer(address receiver, uint amount) public {
        require(wallets[msg.sender] >= amount , "Not enough money in the wallet");
        wallets[receiver] += amount;
        wallets[msg.sender] -= amount;
    }

        function withdraw(uint amount) public {
        address payable receiver = payable(msg.sender);
        require(
            wallets[msg.sender] >= amount,
            "Not enough money in the wallet"
        );
        wallets[msg.sender] -= amount;
        receiver.transfer(amount);
    }
    
  function myBalance() public view returns (uint) {
        return wallets[msg.sender];
    }

}