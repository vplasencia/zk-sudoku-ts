import { HardhatUserConfig } from "hardhat/config"
import "@nomicfoundation/hardhat-toolbox"

if (!process.env.PRIVATE_KEY) {
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
            chainId: 11155111,
            accounts: [process.env.PRIVATE_KEY]
        }
    }
}

export default config
