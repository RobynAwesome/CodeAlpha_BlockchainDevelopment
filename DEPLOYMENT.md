# Remix Deployment & Validation Guide

This repository is intentionally dependency-free. The required internship validation can be completed directly in Remix IDE.

## Recommended environment

- Remix IDE
- Solidity compiler: any 0.8.x version compatible with `pragma solidity ^0.8.20`
- Environment: Remix VM for fast local validation

## Repeat for each selected task

1. Open Remix IDE.
2. Create a `.sol` file with the same filename as the contract in this repository.
3. Paste the contract source.
4. Open **Solidity Compiler**.
5. Select a compatible 0.8.x compiler and compile.
6. Confirm there are no compiler errors.
7. Open **Deploy & Run Transactions**.
8. Select **Remix VM** as the environment.
9. Deploy the contract.
10. Run the exact test sequence from the task's `TESTING.md`.
11. Capture evidence before resetting Remix.

## Task-specific notes

### Task 1 — Simple Storage
No constructor parameters or Ether are required. Use the generated `value` getter plus `increment()` and `decrement()`.

### Task 3 — Polling System
`createPoll` takes a title, an array of string options, and a duration in seconds. Use at least two Remix accounts to prove that voting is tracked per address.

### Task 4 — Crypto Lock
Set a transaction value before calling `deposit(lockDurationSeconds)`. Use a short duration such as 30–60 seconds for demonstration. An immediate `withdraw()` must fail; a withdrawal after expiry must succeed.

## Evidence to capture

For each contract record:

- compiler version;
- deployment environment/network;
- deployed contract address;
- deployment transaction hash if Remix exposes one;
- relevant interaction transaction hashes;
- screenshot showing the expected state or revert;
- UTC timestamp of validation.

Use `receipts/README.md` as the receipt ledger.

## Submission gate

A task is **implemented** when its source exists and matches the assigned requirement.

A task is **validated** only after the Remix compile/deploy/test evidence has been captured.

Do not describe a task as deployed or tested successfully before those receipts exist.
