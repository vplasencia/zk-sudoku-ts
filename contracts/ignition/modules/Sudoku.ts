// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules"

const SudokuModule = buildModule("SudokuModule", (m) => {
    const sudokuVerifier = m.contract("SudokuVerifier")

    const sudoku = m.contract("Sudoku", [sudokuVerifier])

    return { sudoku }
})

export default SudokuModule
