import ViewSourceCode from "./ViewSourceCode"
import Link from "next/link"

export default function Footer() {
  return (
    <footer className="mt-20 mb-5 flex items-center justify-center space-x-5">
      <div>
        <Link href="/about" className="text-sky-300 hover:underline">
          About
        </Link>
      </div>
      <div>&#8226;</div>
      <div>
        <ViewSourceCode />
      </div>
    </footer>
  )
}
