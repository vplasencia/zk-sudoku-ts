import { groth16, type Groth16Proof, type PublicSignals, type NumericString } from "snarkjs"

export type CallDataGroth16 = {
    a: [NumericString, NumericString]
    b: [[NumericString, NumericString], [NumericString, NumericString]]
    c: [NumericString, NumericString]
    input: NumericString[]
}

export async function generateGroth16CallData(
    proof: Groth16Proof,
    publicSignals: PublicSignals
): Promise<CallDataGroth16> {
    const calldata = await groth16.exportSolidityCallData(proof, publicSignals)

    const argv = calldata
        .replace(/["[\]\s]/g, "")
        .split(",")
        .map(BigInt)
        .map(String)

    const a: [NumericString, NumericString] = [argv[0], argv[1]]
    const b: [[NumericString, NumericString], [NumericString, NumericString]] = [
        [argv[2], argv[3]],
        [argv[4], argv[5]]
    ]
    const c: [NumericString, NumericString] = [argv[6], argv[7]]

    const input: NumericString[] = argv.slice(8)

    return { a, b, c, input }
}
