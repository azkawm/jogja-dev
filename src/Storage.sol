pragma solidity ^0.8.13;

contract StorageSlot{
    uint256 public price;
    address public owner;
    uint96 public decimals;
    uint256 public totalSupply;

//     ╭-------------+---------+------+--------+-------+-----------------------------╮
// | Name        | Type    | Slot | Offset | Bytes | Contract                    |
// +=============================================================================+
// | price       | uint256 | 0    | 0      | 32    | src/Storage.sol:StorageSlot |
// |-------------+---------+------+--------+-------+-----------------------------|
// | owner       | address | 1    | 0      | 20    | src/Storage.sol:StorageSlot |
// |-------------+---------+------+--------+-------+-----------------------------|
// | decimals    | uint96  | 1    | 20     | 12    | src/Storage.sol:StorageSlot |
// |-------------+---------+------+--------+-------+-----------------------------|
// | totalSupply | uint256 | 2    | 0      | 32    | src/Storage.sol:StorageSlot |
// ╰-------------+---------+------+--------+-------+-----------------------------╯



}