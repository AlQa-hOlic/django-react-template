import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'
import viteCompression from 'vite-plugin-compression'

// https://vitejs.dev/config/
export default defineConfig({
  build: { manifest: true },
  base: process.env.mode === 'production' ? '/static/' : '/',
  root: './web',
  plugins: [react(), viteCompression()],
})
