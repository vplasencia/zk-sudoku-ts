#!/bin/bash

# Copy the verifier
cp ../circuits/build/sudoku/groth16/SudokuVerifier.sol contracts

# Create the zk-artifacts folder if it does not exist
mkdir -p zk-artifacts

# Copy the wasm file to test smart contracts
cp ../circuits/build/sudoku/groth16/sudoku_js/sudoku.wasm zk-artifacts

# Copy the final zkey file to test smart contracts
cp ../circuits/build/sudoku/groth16/sudoku_final.zkey zk-artifacts