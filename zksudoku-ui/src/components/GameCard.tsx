import Link from "next/link"
import Image, { StaticImageData } from "next/image"

export type GameCardProps = {
    nameGame: string
    imageGame: StaticImageData
    urlGame: string
}

export default function GameCard({ nameGame, imageGame, urlGame }: GameCardProps) {
    return (
        <div className="flex flex-wrap justify-center items-center md:gap-20 gap-10">
            <Link href={urlGame}>
                <Image src={imageGame} priority={true} width={400} height={400} alt={nameGame} />
            </Link>
            <Link
                href={urlGame}
                className="flex justify-center items-center space-x-1 transition-colors duration-150 mb-4 text-lg text-slate-300 font-semibold py-3 px-5 rounded-md bg-gradient-to-r from-sky-600 to-emerald-600 hover:from-sky-500 hover:to-emerald-500"
            >
                <span>Play</span>
                <span>{nameGame}</span>
            </Link>
        </div>
    )
}
