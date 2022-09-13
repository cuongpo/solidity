// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.13;

contract B {
    uint public num;
    address public sender;
    uint public value;

    function setNewVal (uint _newNum) public payable {
        num = _newNum;
        sender = msg.sender;
        value = msg.value;
    }
}


contract B2 {
    uint public num;
    address public sender;
    uint public value;

    function setNewVal (uint _newNum) public payable {
        num = _newNum * 2;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public nun;
    address public sender;
    uint public value;

    function setNewVal(address _contract,uint _newNum) public payable {
        (bool success,) = _contract.delegatecall(
            abi.encodeWithSignature("setNewValue(uint256",_newNum)
        );
        require(success,"transaction failed");
    }
}
