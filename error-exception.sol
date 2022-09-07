// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.5.13;

contract ExceptionExample {
    mapping (address => uint64) public balanceReceived;

    function receiveMoney() public payable {
        assert( balanceReceived[msg.sender] + uint64(msg.value)>= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney (address payable _to, uint64 _myMoney) public {
        require(balanceReceived[msg.sender]>=_myMoney,"not enough money");
        balanceReceived[msg.sender] -= _myMoney;
        _to.transfer(_myMoney);
    }
}
