pragma solidity ^0.8.13;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract TokenRupiah is ERC20{
    constructor() ERC20("Token Rupiah", "IDRTOK"){}

    function mint(address _to, uint256 amount) public {
        _mint(_to, amount);
    }
}