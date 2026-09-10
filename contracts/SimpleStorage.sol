// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/// @title SimpleStorage
/// @notice Stores an integer value that can be incremented, decremented, and read publicly.
contract SimpleStorage {
    uint256 public value;

    event ValueChanged(uint256 newValue);

    /// @notice Increase the stored value by one.
    function increment() external {
        value += 1;
        emit ValueChanged(value);
    }

    /// @notice Decrease the stored value by one.
    /// @dev Solidity 0.8+ automatically reverts if value is already zero.
    function decrement() external {
        value -= 1;
        emit ValueChanged(value);
    }
}
