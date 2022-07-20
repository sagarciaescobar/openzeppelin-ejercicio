// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/governance/TimelockController.sol";

contract TimeLockerControllerContract is TimelockController {
  
    bytes32 public constant ROLE_MODERATOR = keccak256("ROLE_MODERATOR");
    mapping (address => bool) public bannedUsers;

    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors
    ) TimelockController(minDelay,proposers,executors) {
      _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function banUser(address account) public onlyRole(ROLE_MODERATOR){
        bannedUsers[account] = true;
    }

    function unbanUser(address account) public onlyRole(ROLE_MODERATOR){
        if (bannedUsers[account]) delete bannedUsers[account];
    }
}
