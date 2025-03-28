import { HardhatUserConfig } from "hardhat/config"
import "@nomicfoundation/hardhat-toolbox"
import "hardhat-gas-reporter"
import { config as dotenvConfig } from "dotenv"

dotenvConfig()

if (process.env.NODE_ENV !== "development" && !process.env.PRIVATE_KEY) {
    console.error("Please set your PRIVATE_KEY in a .env file")
    process.exit(1)
}

const config: HardhatUserConfig = {
    solidity: {
        version: "0.8.28",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
    networks: {
        hardhat: {
            chainId: 1337,
            allowUnlimitedContractSize: true
        },
        sepolia: {
            url: process.env.RPC_URL || "https://rpc2.sepolia.org",
            chainId: 11155111,
            accounts: [`0x${process.env.PRIVATE_KEY}`]
        },
        "optimism-sepolia": {
            url: process.env.RPC_URL || "https://sepolia.optimism.io",
            chainId: 11155420,
            accounts: [`0x${process.env.PRIVATE_KEY}`]
        }
    },
    gasReporter: {
        currency: "USD",
        enabled: process.env.REPORT_GAS === "true",
        coinmarketcap: process.env.COINMARKETCAP_API_KEY
    },
    etherscan: {
        apiKey: process.env.ETHERSCAN_API_KEY
    }
}

export default config
