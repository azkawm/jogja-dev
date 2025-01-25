pragma solidity ^0.8.28;

import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

interface AavePool {
    function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) external;
    function borrow(address asset, uint256 amount, uint256 interestRateMode, uint16 referralCode, address onBehalfOf) external;
}

contract Lending{
    address public pool = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;

  // tokens
  address public usdc = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
  address public wbtc = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;

  function supplyAndBorrow(uint256 amountSupply,uint256 amountBorrow) external {
    // transfer dari user ke contract
    IERC20(wbtc).transferFrom(msg.sender,address(this),amountSupply);
    // supply
    IERC20(wbtc).approve(pool,amountSupply);
    AavePool(pool).supply(wbtc,amountSupply,address(this),0);

    // borrow
    AavePool(pool).borrow(usdc,amountBorrow,2,0,address(this));

    // transfer USDC ke msg.sender
    IERC20(usdc).transfer(msg.sender,amountBorrow);
  }

}