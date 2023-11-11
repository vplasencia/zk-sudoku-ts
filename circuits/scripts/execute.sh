#!/bin/bash

echo "----- Remove build folder -----"
./scripts/removeBuildFolder.sh

echo "----- Sudoku -----"
echo "----- Sudoku Groth16 -----"
./scripts/executeGroth16.sh
echo "----- Sudoku Plonk -----"
./scripts/executePlonk.sh
echo "----- Sudoku Fflonk -----"
./scripts/executeFflonk.sh



