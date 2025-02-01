// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Vault is ERC20 {

  address public assetToken;
  address public owner;

  error AmountShouldNotZero();

  event Deposit(address user, uint256 amount, uint256 shares);
  event Withdraw(address user, uint256 amount, uint256 shares);

  constructor(address _assetToken) ERC20("Deposito Vault","DEPO") {
    assetToken = _assetToken;
    owner = msg.sender;
  }

  function deposit(uint256 amount) external {
    // shares yg akan diperoleh = deposit amount / total asset * total shares
    if(amount == 0) revert AmountShouldNotZero;
    uint256 shares = 0;
    uint256 totalAssets = IERC20(assetToken).balanceOf(address(this));

    if (totalSupply() == 0 ) {
      shares = amount;
    } else {
      shares = (amount * totalSupply() / totalAssets);
    }

    _mint(msg.sender,shares);
    IERC20(assetToken).transferFrom(msg.sender,address(this),amount);
  }

  function withdraw(uint256 shares) external {
    if (shares > balanceOf(msg.sender) || balanceOf(msg.sender) == 0) revert AmountShouldNotZero; 
    // amount withdraw = shares / total shares * total assets
    uint256 totalAssets = IERC20(assetToken).balanceOf(address(this));
    uint256 amount = (shares * totalAssets / totalSupply());

    _burn(msg.sender,shares);
    IERC20(assetToken).transfer(msg.sender,amount);
  }

  function distributeYield(uint256 amount) external {
    require(msg.sender == owner,"Only owner can distribute yield");
    IERC20(assetToken).transferFrom(owner, address(this), amount);
  }
}
