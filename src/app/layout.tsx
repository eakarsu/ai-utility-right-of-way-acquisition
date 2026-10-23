import type { Metadata } from "next";
import "./globals.css";
import Providers from "@/components/Providers";

export const metadata: Metadata = {
  title: "Utility Right-of-Way Acquisition",
  description: "Manage parcels, owners, negotiated easements, compensation approvals, signatures and recording receipts.",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
<script src="/feature-pack/feature-pack.js" defer />
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
