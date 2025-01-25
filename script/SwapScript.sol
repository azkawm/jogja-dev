// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Swap} from "../src/Swap.sol";

contract SwapScript is Script {
    Swap public swap;

    function setUp() public {
    }

    function run() public {

      
    }
    function test_swap() public {
    swap.swap(100);
  }
}
