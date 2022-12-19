// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC721 {
    string private _name;
    string private _symbol;

    mapping(uint256 => string) private _tokenInfo;
    mapping(uint256 => address) private _owners;    
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    uint private totalSupply;

    event Transfer(address from, address to, uint tokenId);
    event Approval(address from, address to, uint tokenId);
    event ApprovalForAll(address from, address operator, bool approval);

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function balanceOf(address owner) public view returns (uint256) {
      
    }

    function ownerOf(uint256 tokenId) public view returns (uint256) {
      
    }
    
    function name() public view returns (string memory) {
      
    }
    
    function symbol() public view returns (string memory) {
      
    }
    
    function tokenURI(uint256 tokenId) public view returns (string memory) {
      
    }

    function getApproved(uint256 tokenId) public view returns (address) {
      
    }

    function isApprovedForAll(address owner, address operator) public view returns (bool) {

    }

    function transferFrom(address from, address to, uint256 tokenId) public {
      
    }

    function mint(address to, uint256 tokenId, string memory url) public {

    }

    function burn(uint256 tokenId) public {

    }

    function transfer(address to, uint256 tokenId) public {

    }

    function approve(address to, uint256 tokenId) public {

    }

    function setApprovalForAll(address owner, address operator, bool approved) public {

    }
}
