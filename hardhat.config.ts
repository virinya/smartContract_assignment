import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-ethers";

const config: HardhatUserConfig = {
  defaultNetwork: "hardhat",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      chainId: 1337,
    },
    usdcmainnet: {
      url: '',
      chainId: 1,
    },
    usdcgoerli: {
      url: 'https://eth-goerli.g.alchemy.com/v2/ALINgi3wcxaz8aID_bVk1ea1PzubLQsL',
      chainId: 5,
    },
  },

  solidity: "0.8.17",
};

export default config;