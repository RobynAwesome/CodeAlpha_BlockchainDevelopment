# Task 3 — Polling System Testing

## Goal
Confirm poll creation, deadline enforcement, one-vote-per-address protection, vote counting, and winner lookup.

## Remix procedure

1. Compile `PollingSystem.sol` with a Solidity 0.8.x compiler compatible with `^0.8.20`.
2. Deploy in Remix VM.
3. Call `createPoll` with:
   - title: `Best Blockchain Platform?`
   - options: `["Ethereum", "Hyperledger"]`
   - votingDurationSeconds: `60`
4. Confirm `pollCount()` returns `1`.
5. Call `getPoll(1)` and confirm the title, two options, future end time, and zero vote totals.
6. From the deploying account, call `vote(1, 0)`.
7. Call `hasAddressVoted(1, <deployer address>)`. Expected: `true`.
8. Attempt to call `vote(1, 1)` again from the same address. Expected: revert with `Address has already voted`.
9. Switch to a second Remix account and call `vote(1, 1)`.
10. Call `getPoll(1)` and confirm vote totals are `[1, 1]`.
11. After the deadline passes, call `vote(1, 0)`. Expected: revert with `Voting has ended`.
12. Call `getWinningOption(1)` after the deadline. With the `[1, 1]` tie above, expected winner index is `0` because the contract deterministically returns the lowest-index option on ties.

## Receipt checklist

- [ ] Compiler version recorded
- [ ] Deployment address recorded
- [ ] Poll creation transaction captured
- [ ] First vote captured
- [ ] Double-vote rejection captured
- [ ] Second-address vote captured
- [ ] Deadline rejection captured
- [ ] Winner query captured

Do not mark this task validated until the runtime evidence is captured in `../receipts/README.md`.
