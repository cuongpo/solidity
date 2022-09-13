// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.1;

contract addressExample {
    address public myAddress;

    function setNewValue(address _myAddress) public {
        myAddress = _myAddress;
    }
    function getBalanceAccount() public view returns (uint) {
        return myAddress.balance;
    }
}
