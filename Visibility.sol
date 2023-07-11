//SPDX-License-Identifier:GPL-3.0

pragma solidity>=0.5.0 < 0.9.0;

contract visibility1
{
    function f1() public pure returns(uint)
    {
        return 1;
    }
    function f2() private pure returns(uint)
    {
        return 2;
    }
    function f3() internal pure returns(uint)
    {
        return 3;
    }
    function f4() external pure returns(uint)
    {
        return 4;
    }
}

contract visibility2 is visibility1
{
    uint public x=f3(); 
}

contract visibility3
{
    visibility1 obj=new visibility1();
    uint public y=obj.f4();
}