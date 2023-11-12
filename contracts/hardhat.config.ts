import { HardhatUserConfig } from "hardhat/config"
import "@nomicfoundation/hardhat-toolbox"
import "hardhat-gas-reporter"
import "dotenv/config"

const config: HardhatUserConfig = {
    solidity: {
        version: "0.8.19",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    networks: {
        sepolia: {
            url: `https://eth-sepolia.g.alchemy.com/v2/${process.env.ALCHEMY_PRIVATE_KEY}`,
            accounts: [process.env.PRIVATE_KEY!]
        }
    },
    gasReporter: {
        enabled: process.env.REPORT_GAS ? true : false
    }
}

export default config
