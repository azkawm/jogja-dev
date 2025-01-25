// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Swap} from "../src/Swap.sol";

contract SwapTest is Test {
    Swap public swap;

    function setUp() public {
        swap = new Swap();
        swap.setNumber(0);
    }

    function test_Increment() public {
        swap.increment();
        assertEq(swap.number(), 1);
    }

    function testFuzz_SetNumber(uint256 x) public {
        swap.setNumber(x);
        assertEq(swap.number(), x);
    }
}
