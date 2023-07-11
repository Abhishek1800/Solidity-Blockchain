//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract local
{
    // string memory name="Abhishek"; // we cannot use the memory keyword at contract level
    // string name="Abhishek";  // correct way to declare string at contract level

    function store() pure public returns(uint)
    {
        // string name="Abhishek"; //cannot store a string inside a funtion wrong way
        // string memory name="Abhishek"; // correct way to declare using memory keyword
        uint age=10;
        return age;  
    }
}