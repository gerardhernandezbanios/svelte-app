import { writable } from 'svelte/store';

export const theme = writable<string>('modern');
export const availableThemes = ['modern', 'classic', 'dark', 'light'];