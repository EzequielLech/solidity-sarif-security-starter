// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title TreasuryVault
/// @notice Minimal hardened treasury vault with non-reentrant withdrawals and explicit role checks.
contract TreasuryVault {
    error Unauthorized();
    error ZeroAmount();
    error InsufficientBalance();
    error ReentrancyBlocked();
    error TransferFailed();

    address public immutable guardian;
    uint256 private _locked = 1;
    mapping(address => uint256) public balances;

    event Deposited(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);

    modifier nonReentrant() {
        if (_locked != 1) revert ReentrancyBlocked();
        _locked = 2;
        _;
        _locked = 1;
    }

    modifier onlyGuardian() {
        if (msg.sender != guardian) revert Unauthorized();
        _;
    }

    constructor(address initialGuardian) {
        if (initialGuardian == address(0)) revert Unauthorized();
        guardian = initialGuardian;
    }

    function deposit() external payable {
        if (msg.value == 0) revert ZeroAmount();
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external nonReentrant {
        if (amount == 0) revert ZeroAmount();
        uint256 bal = balances[msg.sender];
        if (bal < amount) revert InsufficientBalance();

        // Effects before interactions
        balances[msg.sender] = bal - amount;
        emit Withdrawn(msg.sender, amount);

        (bool ok, ) = msg.sender.call{value: amount}("");
        if (!ok) revert TransferFailed();
    }
}
