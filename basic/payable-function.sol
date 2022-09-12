// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.5.13;

contract SendMoneyExample {

    uint public balanceReceived;
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function withDrawMoney() public {
        address payable to = msg.sender;
        to.transfer(getBalance());
    }

    function withDrawMoneyTo(address payable _to) public {
        _to.transfer(getBalance());
    }
} 
