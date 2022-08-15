pragma solidity ^0.8.4;                  //version

contract defaultName {                 //name of coin
    uint public totalSupply = 7;         //data type integer
    address public minter;   
    address public sender;             //only message sender can mint

    mapping(address => uint) public balances;   //mapping is a dictionary key maps to value (key => value) public map name
                                                 //contract changes declared(one way logging of transaction) sent, transfer, allowed
    event Sent(address from, address to, uint amount);//a function is just a bundle of instructions . constructor called only once

    function mint(address receiver, uint amount) public {
           require(msg.sender == minter);
           balances[receiver] +=  amount;  //+= is same as .. balances[receiver]
          
    }

    function send(address receiver, uint amount) public {
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

    constructor () {
        minter = msg.sender; 
    }
}