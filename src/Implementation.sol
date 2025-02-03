// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Initializable} from "openzeppelin-contracts/contracts-upgradeable/proxy/utils/Initializable.sol";
contract Implementation is Inirializable {
    uint256 public price;
    address public assertToken;
    address owner;

    constructor(){
        _disableInitializers();
    }

    function initialize(uint256 _price, address _assertToken) public initializer {
        price = _price;
        assertToken = _assertToken;
        owner = msg.sender;
    }

    function setPrice(uint256 _price) public {
        require(msg.sender == owner, "Only owner can set price");
        price = _price;
    }
}