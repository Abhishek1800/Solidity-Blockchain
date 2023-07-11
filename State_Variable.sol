//SPDX-License-Identifier:GPL-3.0

pragma solidity>= 0.5.0 < 0.9.0;

contract State
{
    uint public age;  // uint public age=10; <-- This method is also correct to declare state variable value
 
    constructor() public // first way to get value into state variable
    {
       age=10;
    }

    function setAge() public  // Second way to get value into state variable
    {
        age=age+1;
    }
}
