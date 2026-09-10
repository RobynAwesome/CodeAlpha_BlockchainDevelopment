const { expect } = require("chai");
const { ethers } = require("hardhat");
const { time } = require("@nomicfoundation/hardhat-network-helpers");

describe("Task 3 — PollingSystem", function () {
  async function deployPoll() {
    const [voterA, voterB] = await ethers.getSigners();
    const PollingSystem = await ethers.getContractFactory("PollingSystem");
    const polling = await PollingSystem.deploy();
    await polling.waitForDeployment();
    return { polling, voterA, voterB };
  }

  it("deploys and creates a poll with valid options", async function () {
    const { polling } = await deployPoll();
    expect(await polling.pollCount()).to.equal(0n);

    const tx = await polling.createPoll(
      "Best Blockchain Platform?",
      ["Ethereum", "Hyperledger"],
      60
    );
    await tx.wait();

    expect(await polling.pollCount()).to.equal(1n);
    const poll = await polling.getPoll(1);
    expect(poll.title).to.equal("Best Blockchain Platform?");
    expect(poll.options).to.deep.equal(["Ethereum", "Hyperledger"]);
    expect(poll.voteCounts.map((v) => v.toString())).to.deep.equal(["0", "0"]);
  });

  it("votes from one address and verifies vote count", async function () {
    const { polling, voterA } = await deployPoll();
    await (await polling.createPoll("Best Blockchain Platform?", ["Ethereum", "Hyperledger"], 60)).wait();

    await (await polling.connect(voterA).vote(1, 0)).wait();
    expect(await polling.hasAddressVoted(1, voterA.address)).to.equal(true);

    const poll = await polling.getPoll(1);
    expect(poll.voteCounts[0]).to.equal(1n);
    expect(poll.voteCounts[1]).to.equal(0n);
  });

  it("rejects a second vote from the same address", async function () {
    const { polling, voterA } = await deployPoll();
    await (await polling.createPoll("Best Blockchain Platform?", ["Ethereum", "Hyperledger"], 60)).wait();
    await (await polling.connect(voterA).vote(1, 0)).wait();

    await expect(polling.connect(voterA).vote(1, 1)).to.be.revertedWith(
      "Address has already voted"
    );
  });

  it("rejects voting after the deadline", async function () {
    const { polling, voterA } = await deployPoll();
    await (await polling.createPoll("Best Blockchain Platform?", ["Ethereum", "Hyperledger"], 60)).wait();

    await time.increase(61);

    await expect(polling.connect(voterA).vote(1, 0)).to.be.revertedWith("Voting has ended");
  });

  it("returns winner after deadline", async function () {
    const { polling, voterA, voterB } = await deployPoll();
    await (await polling.createPoll("Best Blockchain Platform?", ["Ethereum", "Hyperledger"], 60)).wait();
    await (await polling.connect(voterA).vote(1, 0)).wait();
    await (await polling.connect(voterB).vote(1, 1)).wait();

    await time.increase(61);

    const [winningIndex, winningOption, winningVotes] = await polling.getWinningOption(1);
    expect(winningIndex).to.equal(0n);
    expect(winningOption).to.equal("Ethereum");
    expect(winningVotes).to.equal(1n);
  });
});
