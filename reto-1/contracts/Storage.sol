// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage is AccessControl {
    uint256 number;
    bytes32 public constant ROLE_ADMIN = keccak256("ROLE_ADMIN");
    bytes32 public constant ROLE_WRITER = keccak256("ROLE_WRITER");

    constructor() {
        _grantRole(ROLE_ADMIN, msg.sender);
    }

    modifier onlyAdmin() {
        require(
            hasRole(ROLE_ADMIN, msg.sender),
            "Esta funcion solo puede ser utilizada por el ADMIN"
        );
        _;
    }

    modifier onlyWriter() {
        require(
            hasRole(ROLE_WRITER, msg.sender),
            "Function valid for the Writer of the contract"
        );
        _;
    }

    function addRoleWriterToUser(address account) public onlyAdmin {
        _grantRole(ROLE_WRITER, account);
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public onlyWriter {
        number = num;
    }

    /**
     * @dev Return value
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256) {
        return number;
    }
}
