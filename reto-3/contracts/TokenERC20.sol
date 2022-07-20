// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenERC20 is ERC20Burnable, Pausable, Ownable{
  constructor() ERC20Burnable() ERC20("testTK","TTK"){
    _mint(msg.sender, 10);
  }

  function pause() public onlyOwner{
    _pause();
  }

  function unPause() public onlyOwner{
    _unpause();
  }

  function burn(uint256 amount) public virtual override onlyOwner whenNotPaused{
    _burn(msg.sender, amount);
  }
}