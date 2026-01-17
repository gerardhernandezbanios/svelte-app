import tailwindcss from '@tailwindcss/vite';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({ 
    plugins: [tailwindcss(), sveltekit()],
    server: { 
        host: true, // Escucha en 0.0.0.0 → accesible desde el host 
        port: 5173, // Puerto estándar de SvelteKit 
        strictPort: true // Evita que Vite cambie de puerto silenciosamente 
    } 
});
