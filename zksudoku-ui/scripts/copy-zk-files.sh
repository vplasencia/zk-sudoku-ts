#!/bin/bash

# Create the zk-artifacts folder inside the public folder if it does not exist
mkdir -p public/zk-artifacts

# Copy the wasm file
cp ../circuits/build/sudoku/groth16/sudoku_js/sudoku.wasm public/zk-artifacts

# Copy the final zkey
cp ../circuits/build/sudoku/groth16/sudoku_final.zkey public/zk-artifacts

# Create the abiFiles folder inside the utils folder if it does not exist
mkdir -p utils/abiFiles

# Copy the abi file
cp ../contracts/artifacts/contracts/Sudoku.sol/Sudoku.json utils/abiFiles