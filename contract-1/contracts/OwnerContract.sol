// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OwnerContract is Ownable {
  
  function functionAccessByAll() public{
  }

  function functionAccessByOwner() public onlyOwner{
  }
}