// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

error YouAreNotAdmin();

contract SolidityErrors {
    address public admin; // Make admin public
    uint256 balance; // Remove unnecessary initialization

    constructor(uint256 initialBalance, address allowedAddress) {
        balance = initialBalance;
        admin = allowedAddress;
    }

    modifier isAdmin() {
        if (msg.sender != admin) {
            revert YouAreNotAdmin();
        }
        _; // Ensure function execution continues
    }

    function addBalance(uint256 toAddBalance) public isAdmin {
        balance += toAddBalance;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
