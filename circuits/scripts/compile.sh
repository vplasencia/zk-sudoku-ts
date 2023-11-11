#!/bin/bash

# Variable to store the name of the circuit
CIRCUIT=sudoku

# Path to the directory where the circuit is located
PATH_CIRCUIT=./circuits/${CIRCUIT}

# In case there is a circuit name as input
if [ "$1" ]; then
    CIRCUIT=$1
fi

# In case there is a path as input
if [ "$2" ]; then
    PATH_CIRCUIT=$2
fi

# Build directory path
BUILD_DIR=build/${CIRCUIT}

# Delete the build folder, if it exists
rm -r -f ${BUILD_DIR}

# Create the build folder
mkdir -p ${BUILD_DIR}

# Compile the circuit
circom ${PATH_CIRCUIT}/${CIRCUIT}.circom --r1cs --wasm --sym --c -o ${BUILD_DIR}
