// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/// @title CryptoLock
/// @notice Lets users deposit Ether and withdraw it only after a chosen lock period.
contract CryptoLock {
    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Deposit) public deposits;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);

    /// @notice Deposit Ether and lock it for a number of seconds.
    /// @dev Additional deposits are accumulated. A new deposit can extend, but never shorten, the existing lock.
    function deposit(uint256 lockDurationSeconds) external payable {
        require(msg.value > 0, "Ether required");
        require(lockDurationSeconds > 0, "Lock duration must be greater than zero");

        Deposit storage userDeposit = deposits[msg.sender];
        uint256 proposedUnlockTime = block.timestamp + lockDurationSeconds;

        userDeposit.amount += msg.value;
        if (proposedUnlockTime > userDeposit.unlockTime) {
            userDeposit.unlockTime = proposedUnlockTime;
        }

        emit Deposited(msg.sender, msg.value, userDeposit.unlockTime);
    }

    /// @notice Withdraw the caller's full deposit after the lock expires.
    function withdraw() external {
        Deposit storage userDeposit = deposits[msg.sender];
        uint256 amount = userDeposit.amount;

        require(amount > 0, "No deposit found");
        require(block.timestamp >= userDeposit.unlockTime, "Deposit is still locked");

        // Checks-effects-interactions: clear state before transferring Ether.
        userDeposit.amount = 0;
        userDeposit.unlockTime = 0;

        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Ether transfer failed");

        emit Withdrawn(msg.sender, amount);
    }

    /// @notice Convenience read for the caller's deposit state.
    function getMyDeposit() external view returns (uint256 amount, uint256 unlockTime) {
        Deposit storage userDeposit = deposits[msg.sender];
        return (userDeposit.amount, userDeposit.unlockTime);
    }
}
