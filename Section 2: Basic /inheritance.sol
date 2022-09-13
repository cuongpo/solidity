// "SPDX-License-Identifier: UNLICENSED"  

pragma solidity ^0.5.13;

import "./Owned.sol";
/* 
- Create new token
- Give owner token
- If you'renot the owner, you would buy a token
- Create & burn token 
- Send token
*/

contract Owned {
    address owner;

    constructor() public { 
        owner = msg.sender;
    } 
    modifier onlyOwner() {
         require(msg.sender == owner,"you are not allowed");
         _;
    }
}

contract inheritance is Owned {
    mapping (address => uint256) public tokenBalance;
    uint tokenPrice = 1 ether;

    constructor() public { 
        tokenBalance[owner] = 100;
    } 

    function createNewToken() public onlyOwner {
        tokenBalance[owner] += 1;
    }

    function burnToken() public onlyOwner {
        assert(tokenBalance[owner]>=1);
        tokenBalance[owner] -= 1;
    }

    function purchaseToken() public payable {
        require(tokenBalance[owner]*tokenPrice / msg.value > 1,"not enough");
        tokenBalance[owner] -= msg.value/tokenPrice;
        tokenBalance[msg.sender] += msg.value/tokenPrice;
    }

    function sendToken(address payable _to,uint _amount) public {
        require(tokenBalance[msg.sender]>=_amount, "not enough money");
        assert(tokenBalance[_to]+_amount>= tokenBalance[_to]);
        tokenBalance[msg.sender] -= _amount;
        _to.transfer(_amount);
    }


}
