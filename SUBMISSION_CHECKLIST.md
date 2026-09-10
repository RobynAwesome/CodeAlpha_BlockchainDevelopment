# CodeAlpha Submission Checklist

- **Student ID:** CA/DF1/241945
- **Domain:** Blockchain Technology
- **Tasks completed:** 1, 3, 4
- **GitHub repository URL:** https://github.com/RobynAwesome/CodeAlpha_BlockchainDevelopment

## Technical evidence status

| Item | Status | Evidence |
|---|---|---|
| Compile status | **PASS** | GitHub Actions `Solidity Compile` run `34306972098` + local `npx hardhat compile` (0.8.30) |
| Local runtime-test status | **PASS** | `receipts/runtime-validation/` — 11/11 Hardhat tests |
| Remix-validation status | **PARTIAL / NOT EXECUTED in Remix UI** | Procedure + blocker receipt in `receipts/remix/REMIX_RECEIPT.md`; Cursor browser MCP could not retain remix.ethereum.org tabs. Screenshots still required. |
| LinkedIn video | **pending** | Script: `LINKEDIN_VIDEO_SCRIPT.md` |
| Submission form | **pending** | Human action after video + Remix evidence |

## Task map

| Task | Contract | Local runtime | Remix |
|---|---|---|---|
| 1 | SimpleStorage | PASS | pending |
| 3 | PollingSystem | PASS | pending |
| 4 | CryptoLock | PASS | pending |

## Remaining human actions

1. Complete Remix VM validation using `receipts/runtime-validation/REMIX_VALIDATION.md` (or confirm browser-agent receipts under `receipts/remix/`).
2. Capture Remix screenshots into `receipts/remix/task-1|task-3|task-4/`.
3. Record/post LinkedIn demo video (≤90s) using `LINKEDIN_VIDEO_SCRIPT.md`.
4. Fill CodeAlpha submission form with Student ID, repo URL, and LinkedIn post link.
5. Push local Hardhat tooling/receipts to GitHub if not already on `main` (do not claim Remix PASS until Remix evidence exists).

## Honesty gate

Do not mark Remix or LinkedIn as completed until those artifacts actually exist.
