# Human Remix Steps (unblock submission)

Browser MCP in the agent session could not keep a Remix tab open. Complete these steps manually.

## Prep
1. Open https://remix.ethereum.org
2. Use **Remix VM** only (no Injected Provider / no real ETH)

## For each contract
Paste verbatim from:

| File in Remix | Disk path |
|---|---|
| SimpleStorage.sol | `task-1-simple-storage/SimpleStorage.sol` |
| PollingSystem.sol | `task-3-polling-system/PollingSystem.sol` |
| CryptoLock.sol | `task-4-crypto-lock/CryptoLock.sol` |

Compile with **0.8.30** (or 0.8.x ≥ 0.8.20).

## Task 1 — SimpleStorage
1. Deploy (no constructor args)
2. `value` → expect `0`
3. `increment` → `value` = `1`
4. `increment` → `value` = `2`
5. `decrement` → `value` = `1`
6. `decrement` → `value` = `0`
7. Screenshots → `receipts/remix/task-1/`

## Task 3 — PollingSystem
1. Deploy
2. `createPoll` title `Best Blockchain Platform?`, options `["Ethereum","Hyperledger"]`, duration `60`
3. `pollCount` → `1`
4. `getPoll(1)` → title/options, voteCounts `[0,0]`
5. `vote(1, 0)` from Account #0
6. `hasAddressVoted(1, Account#0)` → `true`
7. `vote(1, 1)` same account → revert `Address has already voted`
8. Switch Account #1 → `vote(1, 1)`
9. `getPoll(1)` → `[1,1]`
10. After 60s → `vote` reverts `Voting has ended`; `getWinningOption(1)` → index `0` on tie
11. Screenshots → `receipts/remix/task-3/`

## Task 4 — CryptoLock
1. Deploy
2. Value = `1 ether`, call `deposit(60)`
3. `getMyDeposit()` → amount 1e18, unlock in future
4. Immediate `withdraw` → revert `Deposit is still locked`
5. After 60s → `withdraw` success; `getMyDeposit` → `0`,`0`
6. Screenshots → `receipts/remix/task-4/`

Then mark `REMIX_RECEIPT.md` tasks PASS and Submission-ready YES.
