import type { Metadata } from "next"
import { Inter } from "next/font/google"
import "./globals.css"
import Header from "@/components/Header"
import Footer from "@/components/Footer"

const inter = Inter({ subsets: ["latin"] })

export const metadata: Metadata = {
    title: "zkSudoku",
    description: "zkSudoku App"
}

export default function RootLayout({
    children
}: Readonly<{
    children: React.ReactNode
}>) {
    return (
        <html lang="en" suppressHydrationWarning>
            <body className={inter.className} suppressHydrationWarning>
                <div className="flex flex-col min-h-screen px-2 bg-slate-900 text-slate-300">
                    <Header />
                    <main className="mb-auto">{children}</main>
                    <Footer />
                </div>
            </body>
        </html>
    )
}
