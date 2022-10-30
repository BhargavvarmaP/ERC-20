const {ethers} = require("hardhat");

async function main() {

    const DEVToken = await ethers.getContractFactory("DEVToken");
    const DEVtoken = await DEVToken.deploy();
    await DEVtoken.deployed();

 console.log("DEVToken is deployed at address :",DEVtoken.address);

}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  