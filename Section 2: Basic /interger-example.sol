// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.1;

contract interger{
    uint public myUint;

    function setNewValue(uint _myUint) public {
        myUint = _myUint;
    }
}
