# CodeAlpha Blockchain Development

CodeAlpha Blockchain Technology Internship submission repository containing three Solidity projects selected from the assigned task brief.

## Selected tasks

| Task | Project | Core requirements covered | Status |
|---|---|---|---|
| 1 | Simple Storage | Integer storage, increment, decrement, external read | Implemented + CI compile PASS + **local Hardhat runtime PASS** — Remix receipt pending |
| 3 | Polling System | Poll creation, options, deadline, one vote per address, winner lookup | Implemented + CI compile PASS + **local Hardhat runtime PASS** — Remix receipt pending |
| 4 | Crypto Locking | Ether deposit, per-user amount/unlock time, `block.timestamp`, locked withdrawal | Implemented + CI compile PASS + **local Hardhat runtime PASS** — Remix receipt pending |

Task 2 (Multi-Send) is intentionally not included because the CodeAlpha brief allows completion of any 2 or 3 of the 4 assigned blockchain tasks.

## Repository structure

```text
.
├── .github/workflows/solidity-compile.yml
├── contracts/                          # Hardhat sources (mirrors task folders)
├── test/                               # Local Hardhat runtime tests
├── task-1-simple-storage/
│   ├── SimpleStorage.sol
│   └── TESTING.md
├── task-3-polling-system/
│   ├── PollingSystem.sol
│   └── TESTING.md
├── task-4-crypto-lock/
│   ├── CryptoLock.sol
│   └── TESTING.md
├── receipts/
│   ├── README.md
│   └── runtime-validation/             # Local runtime evidence + Remix procedure
├── SUBMISSION_CHECKLIST.md
├── LINKEDIN_VIDEO_SCRIPT.md
├── DEPLOYMENT.md
├── hardhat.config.js
├── LICENSE
└── README.md
```

## Automated compile gate

GitHub Actions compiles all three selected contracts with `solc@0.8.30`. The first compile run completed successfully on 9 September 2026.

- Workflow: `Solidity Compile`
- Run ID: `34306972098`
- Result: `success`
- Receipt: [`receipts/README.md`](./receipts/README.md)

## Local runtime validation (executed)

Hardhat local EVM tests were executed successfully:

- Command: `npx hardhat test`
- Result: **11 passing**
- Timestamp (UTC): `2026-09-09T21:59:34Z`
- Evidence: [`receipts/runtime-validation/`](./receipts/runtime-validation/)

| Task | Receipt | Result |
|---|---|---|
| 1 | [`task-1-simple-storage.txt`](./receipts/runtime-validation/task-1-simple-storage.txt) | PASS |
| 3 | [`task-3-polling-system.txt`](./receipts/runtime-validation/task-3-polling-system.txt) | PASS |
| 4 | [`task-4-crypto-lock.txt`](./receipts/runtime-validation/task-4-crypto-lock.txt) | PASS |

Summary: [`receipts/runtime-validation/runtime-summary.md`](./receipts/runtime-validation/runtime-summary.md)

This compile + local runtime gate proves behavior on a local EVM. It does **not** replace CodeAlpha's requested Remix deployment and behavioral testing.

## Remix validation

Exact Remix procedure for these contracts: [`receipts/runtime-validation/REMIX_VALIDATION.md`](./receipts/runtime-validation/REMIX_VALIDATION.md)

Remix browser execution status: **PENDING** until `receipts/remix/REMIX_RECEIPT.md` exists.

## Tooling

The contracts target Solidity `^0.8.20` and remain deployable in Remix without dependencies. Optional local tooling:

```bash
npm install
npx hardhat compile
npx hardhat test
```

## Quick validation path (Remix)

1. Open Remix IDE.
2. Create a file for the selected contract and paste in the Solidity source from this repository.
3. Compile with a Solidity 0.8.x compiler compatible with `^0.8.20`.
4. Deploy to Remix VM for local validation.
5. Run the steps in that task's `TESTING.md` / `REMIX_VALIDATION.md`.
6. Record evidence under `receipts/remix/` before claiming Remix PASS.

See [`DEPLOYMENT.md`](./DEPLOYMENT.md) for the complete walkthrough.

## Validation principle

This repository does **not** claim Remix deployment passed until Remix evidence is recorded. Source implementation, CI compile, and local Hardhat runtime are complete; Remix receipts remain separate.

## License

Apache License 2.0. See [`LICENSE`](./LICENSE).
