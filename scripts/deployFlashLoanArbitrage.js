// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

        const _addressProvider="";
        const _uniswapRouterAddress="";
        const _sushiswapRouterAddress="";
        const _weth="";
        const _dai="";
 

  const FlashLoanArbitrage = await hre.ethers.getContractFactory("FlashLoanArbitrage.sol");
  const flashLoanArbitrage = await FlashLoanArbitrage.deploy(_addressProvider,_uniswapRouterAddress,_sushiswapRouterAddress,_weth,_dai);

  await flashLoanArbitrage.deployed();

  console.log(
    `FlashLoan Arbitrage  deployed to ${flashLoanArbitrage.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
