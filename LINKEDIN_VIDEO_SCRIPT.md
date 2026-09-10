# LinkedIn Video Script — CodeAlpha Blockchain (≤90 seconds)

Student ID: CA/DF1/241945  
Repo: https://github.com/RobynAwesome/CodeAlpha_BlockchainDevelopment  
Only claim what receipts support: compile PASS + local Hardhat runtime PASS. Remix screenshots still pending — do not say “Remix validated” until those exist.

---

## Spoken script (~75–85 seconds)

Hi, I’m Robyn. This is my CodeAlpha Blockchain Technology internship submission — Student ID CA/DF1/241945.

I completed three Solidity smart-contract tasks and published them on GitHub.

**Task 1 — Simple Storage:** an integer on-chain value with `increment`, `decrement`, and a public read. After deploy the value starts at zero; each call changes it by exactly one.

**Task 3 — Polling System:** create a timed poll with options, cast one vote per address, reject double votes and late votes, then read the winning option after the deadline.

**Task 4 — Crypto Lock:** deposit ETH with a lock duration, prove early withdrawal reverts while locked, then withdraw successfully after the unlock time.

All three contracts target Solidity 0.8.x, compile cleanly in CI, and pass local Hardhat runtime tests covering those behaviors. The repository also documents the Remix VM deployment and testing procedure for submission evidence.

GitHub link is in the post. Thanks for watching.

---

## On-screen checklist (while recording)

1. GitHub repo README (tasks table)
2. One Solidity file briefly (e.g. `PollingSystem.sol` or `CryptoLock.sol`)
3. Hardhat test output or `receipts/runtime-validation/runtime-summary.md` showing PASS
4. Optional: Remix open with a contract loaded — only if you actually ran it live for the recording

## Do not say

- That Remix validation passed (unless screenshots are already saved)
- That Task 2 was completed
- Any mainnet / paid hosting claims
