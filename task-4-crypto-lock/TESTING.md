# Task 4 — Crypto Lock Testing

## Goal
Confirm Ether deposits are recorded per user, `block.timestamp` enforces the lock, early withdrawal fails, and withdrawal succeeds after expiry.

## Remix procedure

1. Compile `CryptoLock.sol` with a Solidity 0.8.x compiler compatible with `^0.8.20`.
2. Deploy in Remix VM.
3. Set the Remix transaction value to `1 ether`.
4. Call `deposit(60)` to lock the Ether for 60 seconds.
5. Call `getMyDeposit()` and confirm:
   - amount equals `1 ether` in wei;
   - unlock time is later than the deposit block timestamp.
6. Immediately call `withdraw()`. Expected: revert with `Deposit is still locked`.
7. After the lock time passes, call `withdraw()` again. Expected: success.
8. Call `getMyDeposit()` after withdrawal. Expected: amount `0`, unlock time `0`.
9. Optional: make a second deposit before expiry with a longer duration and confirm the lock time extends rather than shortens.

## Receipt checklist

- [ ] Compiler version recorded
- [ ] Deployment address recorded
- [ ] Deposit transaction captured
- [ ] Stored amount/unlock time captured
- [ ] Early-withdrawal rejection captured
- [ ] Successful withdrawal captured
- [ ] Post-withdrawal zero state captured

Do not mark this task validated until the runtime evidence is captured in `../receipts/README.md`.
