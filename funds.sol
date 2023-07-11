// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract funds{
    struct Memo{
        string name;
        string message;
        uint timestamp;
        address from;
    }
    Memo[] memos;
    address payable owner;
    constructor(){
        owner=payable(msg.sender);
    }
    function Sendfunds(string memory name, string memory message) payable public{
        require(msg.value > 2, " Please pay something");
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg. sender));
    }
    function GetMemos() public view returns(Memo[] memory){
        return memos;
    }
}