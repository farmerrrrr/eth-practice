// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ImpleV1 {
    address public implementation;
    uint public x = 0;

    function inc() external {
        x += 1;
    }
}