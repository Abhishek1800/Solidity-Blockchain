//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract Array
{
    bytes3 public b3; // 3 bytes array
    bytes4 public b4; // 4 bytes array

    function setter() public
    {
       b3='abh';
       b4='abhi';
    }
}