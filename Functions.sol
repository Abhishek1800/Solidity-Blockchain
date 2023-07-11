//SPDX-License-Identifier:GPL-3.0

pragma solidity >= 0.5.0 < 0.9.0;

contract local
{
   uint age = 10;
   // uint public age = 20;

   string name = "Abhishek";

   function getter() public view returns(uint) // we use view or pure where we donot modify the variable value
   {                                           // in view we read the state variable value but write is not allowed
       return age;                             // in pure we are not allowed to read or write the state variable value
   }
   
   // function getter() public pure returns(uint) // example of using pure at the place of view
   // {
   //    uint rollno=100;
   //    return rollno;
   // }

   function setter(uint newage) public
   {
       age = newage;
   } 
}