const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Task 1 — SimpleStorage", function () {
  it("deploys with initial stored value 0", async function () {
    const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
    const storage = await SimpleStorage.deploy();
    await storage.waitForDeployment();
    expect(await storage.value()).to.equal(0n);
  });

  it("increments and verifies value increased", async function () {
    const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
    const storage = await SimpleStorage.deploy();
    await storage.waitForDeployment();

    await (await storage.increment()).wait();
    expect(await storage.value()).to.equal(1n);

    await (await storage.increment()).wait();
    expect(await storage.value()).to.equal(2n);
  });

  it("decrements and verifies value decreased", async function () {
    const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
    const storage = await SimpleStorage.deploy();
    await storage.waitForDeployment();

    await (await storage.increment()).wait();
    await (await storage.increment()).wait();
    await (await storage.decrement()).wait();
    expect(await storage.value()).to.equal(1n);

    await (await storage.decrement()).wait();
    expect(await storage.value()).to.equal(0n);
  });
});
