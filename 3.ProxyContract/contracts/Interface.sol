// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Counter {
    uint public count;

    function getCount() external view returns (uint) {
        return count;
    }

    function increase() external {
        count++;
    }
}

interface ICounter {
    function getCount() external view returns (uint);
    function increase() external;
}

// not delegateCall
contract MyContract {
    function incrementCount(address _counter) external {
        ICounter(_counter).increase();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).getCount();
    }
}