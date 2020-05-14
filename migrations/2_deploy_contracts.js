const WrappedXRP = artifacts.require("WrappedXRP");
const WrappedADA = artifacts.require("WrappedADA");

require('@openzeppelin/test-helpers/configure')({ provider: web3.currentProvider, environment: 'truffle' });

const { singletons } = require('@openzeppelin/test-helpers');


module.exports = async function(deployer, network, accounts) {
  if (network === 'development') {
    // In a test environment an ERC777 token requires deploying an ERC1820 registry
    await singletons.ERC1820Registry(accounts[0]);
  }

  await deployer.deploy(WrappedXRP);
  await deployer.deploy(WrappedADA);
  const token = await WrappedXRP.deployed();
  const token2 = await WrappedADA.deployed();
  console.log("deployed token : ", token, " ; ", token2);
};
