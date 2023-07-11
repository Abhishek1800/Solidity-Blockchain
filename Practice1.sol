//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0 ;

contract Identity
{
    string name;
    uint age;
    uint rollno;

    constructor() public
    {
        name="Abhishek";
        age=21;
        rollno= 1 ;
    }
    function getName() view public returns (string memory)
    {
        return name;
    }
    function getAge() view public returns (uint)
    {
        return age;
    }
    function getRollno() view public returns (uint)
    {
        return rollno; 
    }
    function setAge() public 
    {
        age=age+1;
    }
}