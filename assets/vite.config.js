import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default {
  server: { port: 5173 },
  plugins: [react()],
  resolve: [".tsx", ".ts", ".jsx", ".js"],
};
