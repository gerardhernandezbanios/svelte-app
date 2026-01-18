import type { Config } from 'tailwindcss';
import { skeleton } from '@skeletonlabs/skeleton/tailwind';

const config: Config = {
    content: ['./src/**/*.{html,svelte,ts}'],
    theme: {
        extend: {}
    },
    plugins: [
        skeleton({
            themes: {
                preset: [
                    { name: 'skeleton', enhancements: true },
                    { name: 'modern', enhancements: true },
                    { name: 'crimson', enhancements: true }
                ]
            }
        })
    ]
};

export default config;
