import Cell from "./Cell"

export type GameCardProps = {
  sudoku: number[][]
  setSelectedPosition: (position: [number, number]) => void
  sudokuBoolInitial: boolean[][] | null
  selectedPosition: [number, number] | null
}

export default function Board({
  sudoku,
  setSelectedPosition,
  sudokuBoolInitial,
  selectedPosition
}: GameCardProps) {
  return (
    <>
      {sudoku.map((row, i) => {
        return (
          <div className="grid grid-cols-9" key={i}>
            {row.map((col, j) => {
              return (
                <Cell
                  value={col}
                  col={j}
                  row={i}
                  setSelectedPosition={setSelectedPosition}
                  sudokuBoolInitial={sudokuBoolInitial}
                  selectedPosition={selectedPosition}
                  key={j}
                />
              )
            })}
          </div>
        )
      })}
    </>
  )
}
