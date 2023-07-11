// SPDX-License-Identifier: MIT

pragma solidity 0.5.17;    
//pragma solidity 0.8.10;        

contract Overflowss 
{  
    uint8 public money=255;

    function setter() public returns(uint)
    {
        money=money+1;
    }
    
}