// SPDX-License-Identifier: MIT

pragma solidity ^0.5.17;    
    
contract Contruct 
{   
    uint public count;

    constructor(uint newcount) public
    {
        count=newcount;
    } 

    function setCount() public returns(uint)
    {
        count++;
    }

  /*  
    int age;    
        
    constructor(int yourAge) public 
    {    
        age = yourAge;    
    }    
        
    function getYourAge() public view returns (int) 
    {    
        return age;    
    }*/     
}  