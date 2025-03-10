import Link from "next/link"

export default function Header() {
    return (
        <header className="flex flex-wrap justify-between p-5 mb-5">
            <Link
                href="/"
                className="text-xl md:mb-auto mb-5 font-bold text-transparent bg-clip-text bg-gradient-to-r from-sky-500 to-emerald-500"
            >
                zkSudoku
            </Link>
        </header>
    )
}
