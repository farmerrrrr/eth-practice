// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20 {
  mapping(address => uint) private _balances;
  mapping(address => mapping(address => uint)) private _allowances;
  uint private _totalSupply;  // 총 발행량
  string private _name;       // ETHEREUM
  string private _symbol;     // ETH
  uint8 private _decimals;    // 18
  address public _owner;

  event Transfer(address indexed from, address indexed to, uint amount);
  event Approval(address indexed from, address  to, uint amount);

  modifier checkBalance(uint amount) {
    require(_balances[msg.sender] > amount, "Not sufficient balance");
    _;
  }

  modifier onlyOwner() {
    require(msg.sender == _owner, "Only owner");
    _;
  }

  constructor (string memory _name_, string memory _symbol_, uint8 _decimals_) {
    _name = _name_;
    _symbol = _symbol_;
    _decimals = _decimals_;
    _totalSupply = 10000000 * (10**18);
    _owner = msg.sender;
  }

  function name() public view returns (string memory) {
    return _name;
  }

  function symbol() public view returns (string memory) {
    return _symbol;
  }

  function decimals() public view returns (uint8) {
    return _decimals;
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address account) public view returns (uint256) {
    return _balances[account];
  }

  function transfer(address to, uint256 amount) public checkBalance(amount) returns (bool) {
    _balances[msg.sender] -= amount;
    _balances[to] += amount;
    emit Transfer(msg.sender, to, amount);
    return true;
  }

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowances[owner][spender];
  }

  function approve(address spender, uint256 amount) public checkBalance(amount) returns (bool) {
    _allowances[msg.sender][spender] = amount;
    emit Approval(msg.sender, spender, amount);
    return true;
  }

  function mint(address to, uint amount) public onlyOwner {
    _balances[to] += amount;
    _totalSupply += amount;
  }

  function burn(address to, uint amount) public onlyOwner {
    _balances[to] -= amount;
    _totalSupply -= amount;
  }

  function burnByUser(uint amount) public onlyOwner {
    transfer(address(0), amount);
    _totalSupply -= amount;
  }


  function transferFrom(address from, address to, uint256 amount) public returns (bool) {
    require(to == msg.sender, "Not allowed user");
    require(_balances[from] > amount, "Not sufficient balance");
    require(_allowances[from][to] > amount, "Not allowed amount");
    _balances[from] -= amount;
    _balances[to] += amount;
    emit Transfer(from, to, amount);
    return true;
  }
}
