// "SPDX-License-Identifier: UNLICENSED"

pragma solidity ^0.8.0;

contract rollOverExamplev8 {
    uint8 public myUint8;

    function descrement() public {
        unchecked {
            myUint8--;
        }
    }

    function increment() public {
        myUint8++;
    }
}
