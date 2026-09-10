# Remix Validation Procedure — Exact Contracts

Source of truth: this repository’s Solidity files.
Environment: Remix IDE VM only (no mainnet / no real ETH).
Compiler target: Solidity `0.8.30` (any `0.8.x` ≥ `0.8.20` is acceptable).

This document is the browser/Remix checklist. Local Hardhat tests are separate evidence and do **not** replace Remix for CodeAlpha’s brief.

---

## Task 1 — SimpleStorage

| Field | Value |
|---|---|
| Contract filename | `SimpleStorage.sol` |
| Source path | `task-1-simple-storage/SimpleStorage.sol` |
| Compiler version | `0.8.30` (`pragma solidity ^0.8.20`) |
| Constructor inputs | none |
| Remix VM environment | Remix VM (Shanghai / Cancun / London — any local VM) |

### Deployment steps
1. Open https://remix.ethereum.org
2. Create `SimpleStorage.sol` and paste the repository source verbatim
3. Solidity Compiler → select `0.8.30` → Compile
4. Deploy & Run → Environment: **Remix VM** → Deploy (no value, no constructor args)

### Functions to call (exact)
| Step | Call | Parameters | Expected result |
|---|---|---|---|
| 1 | `value` (getter) | — | `0` |
| 2 | `increment` | — | tx success |
| 3 | `value` | — | `1` |
| 4 | `increment` | — | tx success |
| 5 | `value` | — | `2` |
| 6 | `decrement` | — | tx success |
| 7 | `value` | — | `1` |
| 8 | `decrement` | — | tx success |
| 9 | `value` | — | `0` |

### Screenshots to capture
- Deployed contract instance with address
- `value` showing `0` after deploy
- `value` showing `1` after first `increment`
- `value` showing `0` after final `decrement`

---

## Task 3 — PollingSystem

| Field | Value |
|---|---|
| Contract filename | `PollingSystem.sol` |
| Source path | `task-3-polling-system/PollingSystem.sol` |
| Compiler version | `0.8.30` (`pragma solidity ^0.8.20`) |
| Constructor inputs | none |
| Remix VM environment | Remix VM |

### Deployment steps
1. Create `PollingSystem.sol` with repository source
2. Compile with `0.8.30`
3. Deploy on Remix VM (no constructor args)

### Exact example parameter values
`createPoll` inputs:
- `title`: `Best Blockchain Platform?`
- `options`: `["Ethereum", "Hyperledger"]` (Remix array field: two string entries)
- `votingDurationSeconds`: `60`

### Functions to call (exact)
| Step | Call | Parameters | Expected result |
|---|---|---|---|
| 1 | `createPoll` | title / options / `60` as above | returns `pollId` `1`; emit `PollCreated` |
| 2 | `pollCount` | — | `1` |
| 3 | `getPoll` | `1` | title match; options `Ethereum`,`Hyperledger`; voteCounts `[0,0]`; future `endTime` |
| 4 | `vote` | `1`, `0` | success from Account #0 |
| 5 | `hasAddressVoted` | `1`, Account #0 address | `true` |
| 6 | `vote` | `1`, `1` (same account) | revert: `Address has already voted` |
| 7 | Switch to Account #1 → `vote` | `1`, `1` | success |
| 8 | `getPoll` | `1` | voteCounts `[1,1]` |
| 9 | After ~60s (or advance VM time if available) → `vote` | `1`, `0` | revert: `Voting has ended` |
| 10 | `getWinningOption` | `1` | `(0, "Ethereum", 1)` — lowest index wins ties |

### Screenshots to capture
- `createPoll` success / `pollCount == 1`
- First vote + `hasAddressVoted == true`
- Double-vote revert message
- `getWinningOption` after deadline

---

## Task 4 — CryptoLock

| Field | Value |
|---|---|
| Contract filename | `CryptoLock.sol` |
| Source path | `task-4-crypto-lock/CryptoLock.sol` |
| Compiler version | `0.8.30` (`pragma solidity ^0.8.20`) |
| Constructor inputs | none |
| Remix VM environment | Remix VM |

### Deployment steps
1. Create `CryptoLock.sol` with repository source
2. Compile with `0.8.30`
3. Deploy on Remix VM

### Exact example parameter values
- Transaction Value field: `1 ether`
- `deposit` argument: `60` (lock duration seconds)

### Functions to call (exact)
| Step | Call | Parameters / value | Expected result |
|---|---|---|---|
| 1 | `deposit` | arg `60`, value `1 ether` | success; emit `Deposited` |
| 2 | `getMyDeposit` | — | amount `1000000000000000000`; unlockTime > deposit timestamp |
| 3 | `withdraw` (immediately) | — | revert: `Deposit is still locked` |
| 4 | Wait ≥60s (or advance Remix VM time) → `withdraw` | — | success; emit `Withdrawn` |
| 5 | `getMyDeposit` | — | amount `0`, unlockTime `0` |

### Screenshots to capture
- Deposit tx with value `1 ether`
- `getMyDeposit` non-zero amount + unlockTime
- Early `withdraw` revert
- Successful post-unlock `withdraw` and zeroed state

---

## Evidence destinations
- Screenshots: `receipts/remix/task-1/`, `task-3/`, `task-4/`
- Ledger: `receipts/remix/REMIX_RECEIPT.md`
- Local Hardhat receipts (separate): `receipts/runtime-validation/`
