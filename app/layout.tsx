import Header from "@/components/common/Header";
import "./globals.css";
import Footer from "@/components/common/Footer";
import { OPEN_GRAPH } from "@/constants/seo";
import clsx from "clsx";

export const metadata = {
  title: "Nextjs-appdir-ts-tailwind-starter",
  description:
    "A Nextjs starter project with app directory, typescript, tailwindCSS and other beneficial starter tools",
  openGraph: OPEN_GRAPH,
};

const bodyClassName = clsx(
  "flex flex-col justify-start items-start",
  "min-h-screen"
);

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang='en'>
      <body className={bodyClassName}>
        <header className='flex-0'>
          <Header />
        </header>
        <main className='flex-1'>{children}</main>
        <footer className='flex-0'>
          <Footer />
        </footer>
      </body>
    </html>
  );
}
