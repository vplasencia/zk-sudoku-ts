"use client"

import Head from "next/head"
import GoBack from "@/components/GoBack"
import Board from "@/components/sudoku/Board"
import NumbersKeyboard from "@/components/sudoku/NumbersKeyboard"
import React, { useEffect, useState, useCallback } from "react"
import { Contract, JsonRpcProvider } from "ethers"
import { groth16 } from "snarkjs"
import { packGroth16Proof } from "@zk-kit/utils/proof-packing"
import styles from "./sudoku.module.css"
import contractAddress from "../../../utils/contractaddress.json"
import contractAbi from "../../../utils/abiFiles/Sudoku.json"

const sudokuContractAddress = contractAddress.sudokuContract
const sudokuContractAbi = contractAbi.abi
const RPC_URL = process.env.NEXT_PUBLIC_RPC_URL
const provider = new JsonRpcProvider(RPC_URL)
const contractNoSigner = new Contract(sudokuContractAddress, sudokuContractAbi, provider)

export default function Sudoku() {
    const [sudokuInitial, setSudokuInitial] = useState<number[][]>([])
    const [sudoku, setSudoku] = useState<number[][]>([])
    const [sudokuBoolInitial, setSudokuBoolInitial] = useState<boolean[][] | null>(null)
    const [selectedPosition, setSelectedPosition] = useState<[number, number] | null>(null)

    const [loadingVerifyBtn, setLoadingVerifyBtn] = useState(false)
    const [loadingStartGameBtn, setLoadingStartGameBtn] = useState(false)

    const updatePosition = (number: number) => {
        if (selectedPosition && selectedPosition.length > 0) {
            if (sudokuBoolInitial !== null && !sudokuBoolInitial[selectedPosition[0]][selectedPosition[1]]) return
            const temp = [...sudoku]
            temp[selectedPosition[0]][selectedPosition[1]] = number
            setSudoku(temp)
            console.log("sudoku", sudoku)
        }
    }

    const verifySudoku = async () => {
        setLoadingVerifyBtn(true)
        console.log("sudokuInitial", sudokuInitial)
        console.log("sudoku", sudoku)

        const input = {
            unsolved: sudokuInitial,
            solved: sudoku
        }

        const wasmPath = "/zk-artifacts/sudoku.wasm"
        const zkeyPath = "/zk-artifacts/sudoku_final.zkey"

        try {
            // Generate proof
            const { proof, publicSignals } = await groth16.fullProve(input, wasmPath, zkeyPath)

            // Pack a Snarkjs Groth16 proof into a single list usable as calldata in Solidity (public signals are not included).
            const points = packGroth16Proof(proof)

            try {
                // Verify proof
                const result = await contractNoSigner.verifySudoku(points, publicSignals)
                console.log("result", result)
                setLoadingVerifyBtn(false)
                alert("Successfully verified")
            } catch (error) {
                setLoadingVerifyBtn(false)
                console.log(error)
                alert("Wrong solution")
            }
        } catch {
            setLoadingVerifyBtn(false)
            alert("Failed to generate proof")
        }
    }

    const renderVerifySudoku = () => {
        return (
            <button
                className="flex justify-center items-center disabled:cursor-not-allowed space-x-3 verify-btn text-lg font-medium rounded-md px-5 py-3 w-full bg-gradient-to-r from-sky-600 to-emerald-600 hover:from-sky-500 hover:to-emerald-500"
                onClick={verifySudoku}
                disabled={loadingVerifyBtn}
            >
                {loadingVerifyBtn && <div className={styles.loader}></div>}
                <span>Verify Sudoku</span>
            </button>
        )
    }

    const initializeBoard = useCallback(async () => {
        try {
            const board = await contractNoSigner.generateSudokuBoard(new Date().toString())

            const newArray = board.map((arr: string[]) => {
                return arr.slice().map(Number)
            })
            setSudokuInitial(newArray.map((row: number[]) => [...row]))
            setSudoku(newArray)

            // Generates a 9x9 grid (2D array) filled with `false` values, representing an empty boolean matrix.
            const temp = Array.from({ length: 9 }, () => Array(9).fill(false))

            for (let i = 0; i < newArray.length; i++) {
                for (let j = 0; j < newArray.length; j++) {
                    if (newArray[i][j] === 0) {
                        temp[i][j] = true
                    }
                }
            }
            setSudokuBoolInitial(temp)
        } catch {
            alert("Failed fetching Sudoku board")
        }
    }, [])

    const renderNewGame = () => {
        return (
            <button
                className="flex justify-center items-center disabled:cursor-not-allowed space-x-3 verify-btn text-lg font-medium rounded-md px-5 py-3 w-full bg-gradient-to-r from-sky-600 to-emerald-600 hover:from-sky-500 hover:to-emerald-500"
                onClick={async () => {
                    setLoadingStartGameBtn(true)
                    await initializeBoard()
                    setLoadingStartGameBtn(false)
                }}
                disabled={loadingStartGameBtn}
            >
                {loadingStartGameBtn && <div className={styles.loader}></div>}
                <span>New Game</span>
            </button>
        )
    }

    const renderSudoku = () => {
        if (sudoku.length !== 0) {
            return (
                <>
                    <div>
                        <Board
                            sudoku={sudoku}
                            setSelectedPosition={(pos) => setSelectedPosition(pos)}
                            selectedPosition={selectedPosition}
                            sudokuBoolInitial={sudokuBoolInitial}
                        />
                    </div>
                    <div>
                        <div className="flex justify-center items-center my-10">{renderNewGame()}</div>
                        <NumbersKeyboard updatePosition={updatePosition} />
                        <div className="flex justify-center items-center my-10">{renderVerifySudoku()}</div>
                    </div>
                </>
            )
        } else {
            return (
                <div className="flex justify-center items-center space-x-3">
                    <div className={styles.loader}></div>
                    <div>Loading Game</div>
                </div>
            )
        }
    }

    useEffect(() => {
        initializeBoard()
    }, [initializeBoard])
    return (
        <div>
            <Head>
                <title>zkSudoku</title>
                <meta name="title" content="zkSudoku" />
                <meta name="description" content="Zero Knowledge Sudoku Games" />
            </Head>
            <div className="mb-10">
                <GoBack />
            </div>
            <div className="flex">
                <div className="mx-5 mb-10 text-3xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-emerald-500 ">
                    Sudoku
                </div>
            </div>
            <div className="flex flex-wrap gap-20 justify-center items-center text-slate-300">{renderSudoku()}</div>
            <div className="flex place-content-center mt-20 text-lg text-slate-300">
                <div className="md:w-6/12">
                    <div className="text-center my-5 font-semibold">Sudoku rules:</div>
                    <div className="space-y-5">
                        <p>
                            <span className="font-semibold">Sudoku</span> (also known as &quot;Number Place&quot;) is a
                            placement puzzle. The puzzle is most frequently a 9 x 9 grid made up of 3 x 3 subgrids
                            (called &quot;regions&quot;). Some cells already contain numbers, known as
                            &quot;givens&quot;.
                        </p>
                        <ul className="list-disc space-y-2 pl-5">
                            <li>
                                The goal is to fill in the empty cells, one number in each, so that each column, row,
                                and region contains the numbers 1 through 9 exactly once.
                            </li>
                            <li>
                                Each number in the solution therefore occurs only once in each of three
                                &quot;directions&quot;, hence the &quot;single numbers&quot; implied by the
                                puzzle&apos;s name.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    )
}
