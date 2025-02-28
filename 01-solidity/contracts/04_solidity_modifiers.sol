// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract SolidityModifiers {
    address public admin; // Make admin public for easy access
    uint256 private balance; // Use private since balance is internal data

    constructor(uint256 initialBalance, address allowedAddress) {
        balance = initialBalance;
        admin = allowedAddress;
    }

    modifier isAdmin() {
        require(msg.sender == admin, "You are not allowed!");
        _; // Ensure function execution continues after this
    }

    function addBalance(uint256 toAddBalance) public isAdmin {
        balance += toAddBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    } // 🔥 FIXED: Added missing closing brace for function

} // 🔥 FIXED: Added missing closing brace for contract
