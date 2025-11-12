import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
        tailwindcss(),
    ],

    //server configuration  vite dev 
    server: {
        host: '0.0.0.0',
        port: 8000,
        hmr: process.env.VITE_PUBLIC_URL 
            ? {
                host: 'https://jgxtnj8x-8000.use2.devtunnels.ms/',
                port: 443,
                protocol: 'wss',
            }
            : {
                host: 'localhost',
                port: 8000,
                protocol: 'ws',
            },
        strictPort: false,
        cors: true,
    },
});
