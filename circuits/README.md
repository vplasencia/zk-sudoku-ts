# Circuits

This project contains the Sudoku circuit used in the zkSudoku application.

## Install dependencies

```sh
yarn
```

## Compile circuit

```sh
yarn compile
```

## Generate Witness

```sh
yarn generate-witness
```

## Execute Groth16

```sh
yarn groth16
```

## Execute Plonk

```sh
yarn plonk
```

## Execute Fflonk

```sh
yarn fflonk
```

## Execute all proving systems (Groth16, Plonk and Fflonk)

```sh
yarn execute
```

## Remove build folder

```sh
yarn remove-build-folder
```

## Run tests

```
yarn test
```

## Code formatting

Run [Prettier](https://prettier.io/) to check formatting rules:

```bash
yarn prettier
```

Or to automatically format the code:

```bash
yarn prettier:write
```