# Validation Receipt Ledger

Runtime evidence belongs here. Source compilation and runtime behavior are tracked separately so the repository never claims more than the evidence proves.

## Source compilation receipt

- Status: `PASS`
- Validator: GitHub Actions — `Solidity Compile`
- Run ID: `34306972098`
- Commit: `c8c2d06595ba351fa33271134ea6d74f9cc77e44`
- Compiler package: `solc@0.8.30`
- Result: all three selected Solidity contracts compiled successfully
- Workflow conclusion: `success`
- Completed at (UTC): `2026-09-09T03:24:14Z`

## Local Hardhat runtime receipt

- Status: `PASS`
- Validator: Hardhat `2.22.18` + Solidity `0.8.30`
- Command: `npx hardhat test`
- Result: `11 passing`
- Completed at (UTC): `2026-09-09T21:59:34Z`
- Detail folder: [`runtime-validation/`](./runtime-validation/)

Local Hardhat PASS does **not** equal Remix PASS.

## Task 1 — Simple Storage

- Local runtime status: `PASS` — see `runtime-validation/task-1-simple-storage.txt`
- Remix runtime status: `PENDING`
- Remix compiler version: `PENDING`
- Environment/network: `PENDING`
- Contract address: `PENDING`
- Deployment transaction: `PENDING`
- Increment evidence: `PENDING`
- Decrement evidence: `PENDING`
- Screenshot/link: `PENDING`
- Remix validated at (UTC): `PENDING`

## Task 3 — Polling System

- Local runtime status: `PASS` — see `runtime-validation/task-3-polling-system.txt`
- Remix runtime status: `PENDING`
- Remix compiler version: `PENDING`
- Environment/network: `PENDING`
- Contract address: `PENDING`
- Deployment transaction: `PENDING`
- Poll creation evidence: `PENDING`
- First vote evidence: `PENDING`
- Double-vote rejection evidence: `PENDING`
- Deadline rejection evidence: `PENDING`
- Winner lookup evidence: `PENDING`
- Screenshot/link: `PENDING`
- Remix validated at (UTC): `PENDING`

## Task 4 — Crypto Lock

- Local runtime status: `PASS` — see `runtime-validation/task-4-crypto-lock.txt`
- Remix runtime status: `PENDING`
- Remix compiler version: `PENDING`
- Environment/network: `PENDING`
- Contract address: `PENDING`
- Deployment transaction: `PENDING`
- Deposit evidence: `PENDING`
- Early-withdrawal rejection evidence: `PENDING`
- Successful withdrawal evidence: `PENDING`
- Screenshot/link: `PENDING`
- Remix validated at (UTC): `PENDING`

## Evidence rule

A successful compile proves the source is syntactically accepted by the recorded compiler. Local Hardhat tests prove local-EVM behavior. Runtime Remix fields become `PASS` only after Remix interaction is observed and captured under `receipts/remix/`.
