// "SPDX-License-Identifier: UNLICENSED" 

pragma solidity ^0.5.13;

contract FunctionExample {
    mapping (address => uint) public balanceReceived;

    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender]+ msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney (address payable _to,uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount,"not enough balance");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

    function() external payable {
        receiveMoney();
    } 

    function getOwner() public view returns (address) {
        return owner;
    }

    function convertWeiToEther (uint _amountOfWei) public pure returns (uint) {
        return _amountOfWei/1 ether;
    }
}
