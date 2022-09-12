// "SPDX-License-Identifier: UNLICENSED"  

pragma solidity ^0.5.13;

contract eventExample {
    mapping (address => uint) public tokenBalance;

    event TokenSent(address _from, address _to, uint _amount);

    constructor() public {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken (address payable _to, uint256 _amount) public {
        require(tokenBalance[msg.sender]>=_amount,"not enough token");
        assert(tokenBalance[msg.sender]-_amount<=tokenBalance[msg.sender]);
        assert(tokenBalance[_to]+_amount>=tokenBalance[_to]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        emit TokenSent(msg.sender,_to,_amount);
    }
}
