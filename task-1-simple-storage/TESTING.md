# Task 1 — Simple Storage Testing

## Goal
Confirm that the stored integer is externally readable and that increment/decrement change it by exactly one.

## Remix procedure

1. Compile `SimpleStorage.sol` with a Solidity 0.8.x compiler compatible with `^0.8.20`.
2. Deploy the contract in Remix VM.
3. Read `value` immediately after deployment. Expected result: `0`.
4. Call `increment()` once. Read `value`. Expected result: `1`.
5. Call `increment()` again. Read `value`. Expected result: `2`.
6. Call `decrement()` once. Read `value`. Expected result: `1`.
7. Call `decrement()` again. Read `value`. Expected result: `0`.
8. Optional safety check: call `decrement()` while `value == 0`. Expected result: transaction reverts because Solidity 0.8+ prevents unsigned integer underflow.

## Receipt checklist

- [ ] Compiler version recorded
- [ ] Deployment address recorded
- [ ] Initial value observed as 0
- [ ] Increment observed
- [ ] Decrement observed
- [ ] Screenshot or transaction evidence captured

Do not mark this task validated until the runtime evidence is captured in `../receipts/README.md`.
