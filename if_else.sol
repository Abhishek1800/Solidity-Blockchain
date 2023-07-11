//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract Array
{
    function check(int a) public pure returns (string memory)
    {
        string memory value;

        if(a>0)
        {
            value="Greater then zero";
        }
        else if(a==0)
        {
            value="Equal to zero";
        }
        else
        {
            value="Less then zero";
        }
        return value;
    }
}