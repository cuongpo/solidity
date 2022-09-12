// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.1;

contract boolExample {
    bool public myBool;

    function setNewValue(bool _myBool) public {
        myBool = _myBool;
    }

    function negateBool() public {
        myBool = !myBool;
    }
    function retrieve() public view returns (bool) {
        return myBool;
    }
}
