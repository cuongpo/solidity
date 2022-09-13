// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.1;

contract stringExample {
    string public myStr = "Hello worlllld";

    function setNewValue(string memory _myStr) public {
        myStr = _myStr;
    }
   
}
