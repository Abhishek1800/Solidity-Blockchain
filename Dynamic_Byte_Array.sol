//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract Array
{
    bytes public b4="abhi";
    bytes public b5="abhis";

    function pushElement() public
    {
       b4.push('s');
       b5.push('h');
    }
    function getElement(uint i) public view returns(bytes1)
    {
        return b4[i];
    }
     function getElement1(uint j) public view returns(bytes1)
    {
        return b5[j];
    }
    function getLength() public view returns(uint)
    {
        return b5.length;
    }
}