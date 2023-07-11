//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract local
{
    string public name;
    uint public rollno;
    uint public count;

constructor(uint new_count) public  // constructor with parametres
 {
    name="Abhishek";
    rollno=3502;
    count = new_count;
 }
}