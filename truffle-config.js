const path = require("path");
require('chai/register-should');

const HDWalletProvider = require("truffle-hdwallet-provider");
const Web3 = require("web3");

require('dotenv').config()
module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: "5777",       // Any network (default: none)
     },

    rinkeby: {
      provider: ()=>  new HDWalletProvider( process.env.MNENOMIC, "https://rinkeby.infura.io/v3/"+process.env.INFURA_API_KEY),
      network_id: 4,
      gas: 4612388 // Gas limit used for deploys
    }
  },
  compilers: {
    solc: {
      version: "0.5.5"
    }
  }
}
