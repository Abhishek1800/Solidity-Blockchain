//SPDX License-Identifier:MIT

pragma solidity>=0.5.0<0.9.0;

contract ViewAndPure
{
    uint public age=10;

    function myage(uint yourage) view public returns(uint)
    {
        return age + yourage;
    }
    function anotherage(uint i,uint j) pure public returns(uint)
    {
        return i+j;
    }
}