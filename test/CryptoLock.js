const { expect } = require("chai");
const { ethers } = require("hardhat");
const { time } = require("@nomicfoundation/hardhat-network-helpers");

describe("Task 4 — CryptoLock", function () {
  async function deployLock() {
    const [user] = await ethers.getSigners();
    const CryptoLock = await ethers.getContractFactory("CryptoLock");
    const lock = await CryptoLock.deploy();
    await lock.waitForDeployment();
    return { lock, user };
  }

  it("deploys and accepts a deposit with unlock timestamp", async function () {
    const { lock, user } = await deployLock();
    const depositValue = ethers.parseEther("1");
    const lockSeconds = 60n;

    const before = await time.latest();
    await (await lock.connect(user).deposit(lockSeconds, { value: depositValue })).wait();

    const [amount, unlockTime] = await lock.connect(user).getMyDeposit();
    expect(amount).to.equal(depositValue);
    expect(unlockTime).to.be.gte(BigInt(before) + lockSeconds);

    const stored = await lock.deposits(user.address);
    expect(stored.amount).to.equal(depositValue);
    expect(stored.unlockTime).to.equal(unlockTime);
  });

  it("reverts early withdrawal while still locked", async function () {
    const { lock, user } = await deployLock();
    await (await lock.connect(user).deposit(60, { value: ethers.parseEther("1") })).wait();

    await expect(lock.connect(user).withdraw()).to.be.revertedWith("Deposit is still locked");
  });

  it("withdraws after unlock and clears deposit state", async function () {
    const { lock, user } = await deployLock();
    const depositValue = ethers.parseEther("1");
    await (await lock.connect(user).deposit(60, { value: depositValue })).wait();

    const balanceBefore = await ethers.provider.getBalance(user.address);
    await time.increase(61);

    const tx = await lock.connect(user).withdraw();
    const receipt = await tx.wait();
    const gasUsed = receipt.gasUsed * receipt.gasPrice;

    const [amount, unlockTime] = await lock.connect(user).getMyDeposit();
    expect(amount).to.equal(0n);
    expect(unlockTime).to.equal(0n);

    const balanceAfter = await ethers.provider.getBalance(user.address);
    expect(balanceAfter).to.equal(balanceBefore + depositValue - gasUsed);
  });
});
