import { HardhatUserConfig } from "hardhat/config"
import "@nomicfoundation/hardhat-toolbox"
import "hardhat-gas-reporter"
import { config as dotenvConfig } from "dotenv"

dotenvConfig();

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
            url: "https://rpc2.sepolia.org",
            chainId: 11155111,
            accounts: process.env.NODE_ENV !== "development" && !process.env.PRIVATE_KEY ? [process.env.PRIVATE_KEY!] : []
        }
    },
    gasReporter: {
        currency: "USD",
        enabled: process.env.REPORT_GAS === "true",
        coinmarketcap: process.env.COINMARKETCAP_API_KEY
    },
}

export default config
