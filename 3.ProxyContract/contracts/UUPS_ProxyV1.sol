// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract ProxyContractV1 is Initializable {
    uint256 public count;

    function initialize() public initializer {
        count = 10;
        _Ownable_init();
    }

    function _authorizeUpgrade(address) internal override onlyOwner {

    }
    
    function increase() external {
        count++;
    }
}