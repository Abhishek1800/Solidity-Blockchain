//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery{

    address payable[] public participents;
    address public manager;

    constructor(){
        manager = msg.sender;
    }

    receive() payable external{
        require(msg.value == 1 ether);
        participents.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }

    function random() internal view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participents.length)));
    }

    function pickWinner() public{
        require(msg.sender == manager);
        require (participents.length >= 3);

        uint r = random();
        address payable winner;

        uint index = r % participents.length;
        winner = participents[index];
        winner.transfer(getBalance());
        participents = new address payable[](0);
    }
}
