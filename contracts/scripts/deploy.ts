import { ethers } from "hardhat"

async function main() {
    const sudokuVerifier = await ethers.deployContract("SudokuVerifier")
    await sudokuVerifier.waitForDeployment()
    console.log("SudokuVerifier Contract deployed to:", sudokuVerifier.target)

    const sudoku = await ethers.deployContract("Sudoku", [sudokuVerifier.target])
    await sudoku.waitForDeployment()
    console.log("Sudoku Contract deployed to:", sudoku.target)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error)
    process.exitCode = 1
})
