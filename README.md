# CodeAlpha Blockchain Development

CodeAlpha Blockchain Technology Internship submission repository containing three Solidity projects selected from the assigned task brief.

## Selected tasks

| Task | Project | Core requirements covered | Status |
|---|---|---|---|
| 1 | Simple Storage | Integer storage, increment, decrement, external read | Implemented — Remix validation receipt pending |
| 3 | Polling System | Poll creation, options, deadline, one vote per address, winner lookup | Implemented — Remix validation receipt pending |
| 4 | Crypto Locking | Ether deposit, per-user amount/unlock time, `block.timestamp`, locked withdrawal | Implemented — Remix validation receipt pending |

Task 2 (Multi-Send) is intentionally not included because the CodeAlpha brief allows completion of any 2 or 3 of the 4 assigned blockchain tasks.

## Repository structure

```text
.
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
│   └── README.md
├── DEPLOYMENT.md
├── LICENSE
└── README.md
```

## Tooling

The contracts target Solidity `^0.8.20` and are intentionally dependency-free so they can be compiled, deployed, and tested directly in Remix IDE.

## Quick validation path

1. Open Remix IDE.
2. Create a file for the selected contract and paste in the Solidity source from this repository.
3. Compile with a Solidity 0.8.x compiler compatible with `^0.8.20`.
4. Deploy to Remix VM for local validation.
5. Run the steps in that task's `TESTING.md`.
6. Record the deployment address, transaction hashes where available, compiler version, network, and screenshots in `receipts/README.md` before submission.

See [`DEPLOYMENT.md`](./DEPLOYMENT.md) for the complete walkthrough.

## Validation principle

This repository does **not** claim a deployment or test passed until the corresponding Remix evidence is recorded. Source implementation is complete; runtime receipts are captured separately after execution.

## License

Apache License 2.0. See [`LICENSE`](./LICENSE).
