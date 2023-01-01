// SPDX-License-Identifier: MIT
// author: achillegley
pragma solidity >=0.4.22 <0.9.0;

contract SimpleToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;

    constructor (string memory _name, string memory _symbol, uint8 _decimals, uint _totalSupply)  {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint _value) public {
        require(balanceOf[msg.sender] >= _value && _value > 0);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}
