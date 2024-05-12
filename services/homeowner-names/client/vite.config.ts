/// <reference types="vitest" />
/// <reference types="vite/client" />

import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import reactRefresh from '@vitejs/plugin-react-refresh';

// https://vitejs.dev/config/
export default defineConfig({
	plugins: [
		react(),
		reactRefresh()
	],
	server: {
		host: process.env.LOCAL_HOST || '0.0.0.0',
		port: parseInt(process.env.CLIENT_PORT || '3000', 10),
		watch: {
			usePolling: true,
		},
	},
	test: {
		globals: true,
		environment: 'jsdom',
		setupFiles: './src/test/setup.ts',
		// CSS takes time to parse, only activate
		// If you need tests to take CSS into consideration.
		css: false
	},
});
