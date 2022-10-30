const {ethers} = require("hardhat");

async function deploy() {

    const DEVToken = await ethers.getContractFactory("DEVToken");
    const DEVtoken = await DEVToken.deploy();
    await DEVtoken.deployed();

 console.log("DEVToken is deployed at address :",DEVtoken.address);

}

deploy().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  