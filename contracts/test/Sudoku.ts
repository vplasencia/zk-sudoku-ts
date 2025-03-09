import { time, loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers"
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs"
import { expect } from "chai"
import hre from "hardhat"
import { groth16 } from "snarkjs"
import { generateGroth16CallData } from "./utils/generate-groth16-calldata"

describe("Sudoku", function () {
    // We define a fixture to reuse the same setup in every test.
    // We use loadFixture to run this setup once, snapshot that state,
    // and reset Hardhat Network to that snapshot in every test.
    async function deploySudokuFixture() {
        const SudokuVerifier = await hre.ethers.getContractFactory("SudokuVerifier")
        const sudokuVerifier = await SudokuVerifier.deploy()

        const Sudoku = await hre.ethers.getContractFactory("Sudoku")
        const sudoku = await Sudoku.deploy(sudokuVerifier)

        return { sudoku, sudokuVerifier }
    }

    describe("Sudoku", function () {
        it("Should generate a board", async function () {
            const { sudoku } = await loadFixture(deploySudokuFixture)
            let board = await sudoku.generateSudokuBoard(new Date().toString())
            expect(board.length).to.equal(9)
        })
        it("Should return true for valid proof on-chain", async function () {
            const { sudokuVerifier } = await loadFixture(deploySudokuFixture)
            const unsolved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 0, 7]
            ]

            const solved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 8, 7]
            ]

            const input = {
                unsolved: unsolved,
                solved: solved
            }

            const wasmPath = "./zk-artifacts/sudoku.wasm"
            const zkeyPath = "./zk-artifacts/sudoku_final.zkey"

            // Generate proof
            const { proof, publicSignals } = await groth16.fullProve(input, wasmPath, zkeyPath)

            // Get calldata for the contract
            let dataResult = await generateGroth16CallData(proof, publicSignals)

            // Call the verifier contract.
            let result = await sudokuVerifier.verifyProof(
                dataResult.a,
                dataResult.b,
                dataResult.c,
                dataResult.input
            )

            expect(result).to.equal(true)
        })
        it("Should return false for invalid proof on-chain", async function () {
            const { sudokuVerifier } = await loadFixture(deploySudokuFixture)
            let a = [0, 0]
            let b = [
                [0, 0],
                [0, 0]
            ]
            let c = [0, 0]
            let input = new Array(81).fill(0)

            let dataResult: any = { a, b, c, input }

            // Call the function.
            let result = await sudokuVerifier.verifyProof(dataResult.a, dataResult.b, dataResult.c, dataResult.input)
            expect(result).to.equal(false)
        })
        it("Should verify Sudoku successfully", async function () {
            const { sudoku } = await loadFixture(deploySudokuFixture)
            const unsolved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 0, 7]
            ]

            const solved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 8, 7]
            ]

            const input = {
                unsolved: unsolved,
                solved: solved
            }

            const wasmPath = "./zk-artifacts/sudoku.wasm"
            const zkeyPath = "./zk-artifacts/sudoku_final.zkey"

            // Generate proof
            const { proof, publicSignals } = await groth16.fullProve(input, wasmPath, zkeyPath)

            // Get calldata for the contract
            let dataResult = await generateGroth16CallData(proof, publicSignals)

            // Call the function.
            let result = await sudoku.verifySudoku(dataResult.a, dataResult.b, dataResult.c, dataResult.input)
            expect(result).to.equal(true)
        })
        it("Should be reverted on Sudoku verification because the board is not in the board list", async function () {
            const { sudoku } = await loadFixture(deploySudokuFixture)
            const unsolved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 8, 0]
            ]

            const solved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 8, 7]
            ]

            const input = {
                unsolved: unsolved,
                solved: solved
            }

            const wasmPath = "./zk-artifacts/sudoku.wasm"
            const zkeyPath = "./zk-artifacts/sudoku_final.zkey"

            // Generate proof
            const { proof, publicSignals } = await groth16.fullProve(input, wasmPath, zkeyPath)

            // Get calldata for the contract
            let dataResult = await generateGroth16CallData(proof, publicSignals)

            await expect(sudoku.verifySudoku(dataResult.a, dataResult.b, dataResult.c, dataResult.input)).to.be.revertedWith("This board does not exist")
        })
        it("Should be reverted on Sudoku verification because the proof is incorrect", async function () {
            const { sudoku } = await loadFixture(deploySudokuFixture)
            const unsolved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 0, 7]
            ]

            const solved = [
                [1, 2, 7, 5, 8, 4, 6, 9, 3],
                [8, 5, 6, 3, 7, 9, 1, 2, 4],
                [3, 4, 9, 6, 2, 1, 8, 7, 5],
                [4, 7, 1, 9, 5, 8, 2, 3, 6],
                [2, 6, 8, 7, 1, 3, 5, 4, 9],
                [9, 3, 5, 4, 6, 2, 7, 1, 8],
                [5, 8, 3, 2, 9, 7, 4, 6, 1],
                [7, 1, 4, 8, 3, 6, 9, 5, 2],
                [6, 9, 2, 1, 4, 5, 3, 8, 7]
            ]

            const input = {
                unsolved: unsolved,
                solved: solved
            }

            const wasmPath = "./zk-artifacts/sudoku.wasm"
            const zkeyPath = "./zk-artifacts/sudoku_final.zkey"

            // Generate proof
            const { proof, publicSignals } = await groth16.fullProve(input, wasmPath, zkeyPath)

            // Get calldata for the contract
            let dataResult = await generateGroth16CallData(proof, publicSignals)

            // Change the first element of the proof to make it incorrect
            dataResult.a[0] = "10"

            await expect(sudoku.verifySudoku(dataResult.a, dataResult.b, dataResult.c, dataResult.input)).to.be.revertedWith("Filed proof check")
        })
    })
})
