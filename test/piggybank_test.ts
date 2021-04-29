import { Contract } from "@ethersproject/contracts";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("PiggyBank", function () {
  let pbank: Contract;
  // const [alice, bob] = ethers.getSigners();

  beforeEach(async function () {
    const PiggyBank = await ethers.getContractFactory("PiggyBank");
    pbank = await PiggyBank.deploy("DemoBank", ethers.constants.MaxUint256);
    await pbank.deployed();
  });

  it("Should return the initialized name of the piggy bank", async function () {
    expect(await pbank.name()).to.equal("DemoBank");
  });

  it("Should change the name from DemoBank to Piggy Sliggy", async function () {
    await pbank.set_name("PiggySliggy");
    expect(await pbank.name()).to.equal("PiggySliggy");
  });

  it("Should show added 1 ETH to the piggy bank", async function () {
    expect(await pbank.get_total_amount()).to.equal(ethers.utils.parseEther("0"));
    let overrides = {
      value: ethers.utils.parseEther("1.0"),
    };
    let tx = await pbank.donate(overrides);
    expect(await pbank.get_total_amount()).to.equal(
      ethers.utils.parseEther("1.0")
    );
  });
});
