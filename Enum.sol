//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract state
{
    enum user{allowed,not_allowed,wait}

    user public u1 = user.allowed;

    // allowed assigned with 0
    // not_allowed assinged with 1
    // wait assingned with 2

    uint public lottery=1000;
    
    function owner() public
    {
        if(u1==user.allowed)
        {
            lottery=0;
        }
    }
    function changeOwner() public
    {
        u1=user.not_allowed;
    }

}