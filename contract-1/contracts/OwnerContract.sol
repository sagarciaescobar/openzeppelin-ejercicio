// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract OwnerContract is Ownable {
  
  function functionAccessByAll() public{
  }
  
  function functionAccessByOwner() public onlyOwner{
  }
}
