// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract ViewAndPure 
{
    uint public age = 22;

    function addToAge(uint year) public view returns (uint) 
    {
        return age + year;
    }

    function add(uint i, uint j) public pure returns (uint) 
    {
        return i + j;
    }
}
