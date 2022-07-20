// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/@openzeppelin/contracts/access/AccessControl.sol";

contract OwnerContract is AccessControl {
  bytes32 public constant ROLE_ADMIN = keccak256("ROLE_ADMIN");
  bytes32 public constant ROLE_USER = keccak256("ROLE_USER");
  
  constructor(){
    _grantRole(ROLE_ADMIN, msg.sender);
  }

  function onlyAdmin() public view {
    require(hasRole(ROLE_ADMIN, msg.sender),"Esta funcion solo puede ser usada por el rol administrador");    
  }

  function onlyUser() public view{
    require(hasRole(ROLE_USER,msg.sender),"Esta funcion solo puede ser usada por el rol usuario");
  }

  function addRoleToAccount(bytes32 role, address account ) public{
    require(hasRole(ROLE_ADMIN, msg.sender),"Esta funcion solo puede ser usada por el rol administrador");
    _grantRole(role, account);
  }
}
