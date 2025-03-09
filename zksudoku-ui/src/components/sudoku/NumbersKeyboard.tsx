export type NumbersKeyboardProps = {
  updatePosition: (number: number) => void
}

export default function NumbersKeyboard({ updatePosition }: NumbersKeyboardProps) {
  return (
    <div className="grid grid-cols-1 place-items-center gap-10">
      <div className="flex justify-center items-center">
        <button
          onClick={() => updatePosition(0)}
          className="transition-colors duration-150 py-3 px-5 text-lg font-medium rounded-md bg-sky-700 hover:bg-sky-800"
        >
          Erase Number
        </button>
      </div>
      <div className="grid grid-cols-3 gap-3">
        {[...Array(9)].map((e, i) => {
          return (
            <button
              key={i + 1}
              onClick={() => updatePosition(i + 1)}
              className="flex justify-center transition-colors duration-150 text-2xl items-center h-16 w-16 rounded-md bg-sky-700 hover:bg-sky-800"
            >
              {i + 1}
            </button>
          )
        })}
      </div>
    </div>
  )
}
