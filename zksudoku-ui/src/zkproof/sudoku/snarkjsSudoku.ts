import { generateGroth16CallData } from "../generate-groth16-calldata"

export async function sudokuCalldata(unsolved: number[][], solved: number[][]) {
    const input = {
        unsolved: unsolved,
        solved: solved
    }

    let dataResult

    try {
        dataResult = await exportCallDataGroth16(input, "/zk-artifacts/sudoku.wasm", "/zk-artifacts/sudoku_final.zkey")
    } catch (error) {
        // console.log(error);
        window.alert("Wrong answer")
    }

    return dataResult
}
