**Resumen:** **Aquí tienes un `README.md` paso a paso, probado y alineado, para crear un scaffold completo y estable de SvelteKit + TypeScript + Vite + TailwindCSS + Skeleton usando `pnpm` — incluye comandos, archivos a revisar y recomendaciones para evitar fricciones entre versiones**. Sigue los pasos en orden en un entorno Unix-like (WSL, Linux, macOS).

---

# Scaffold: SvelteKit + TypeScript + Vite + TailwindCSS + Skeleton

## 1. Requisitos previos

- **Node >= 18** y **pnpm** instalados.
- Ejecuta en **WSL** o entorno Unix-like en Windows para evitar problemas de EOL/permisos.
- Abre una terminal en la carpeta donde quieres crear el proyecto.

## 2. Crear el proyecto base (SvelteKit + TypeScript)

```bash
mkdir my-app && cd my-app
pnpm dlx sv create --template minimal --types ts .
```

- **`sv create`** es la CLI oficial para crear proyectos SvelteKit; acepta `--template` y `--types` para automatizar la creación.
- Si la CLI pregunta por el gestor de paquetes, elige **pnpm** o usa `--install pnpm` si tu versión lo soporta.

## 3. Instalar dependencias

```bash
pnpm install
```

- Verifica que **`package.json`** existe antes de ejecutar `pnpm install`. Si no existe, vuelve a ejecutar `sv create` en el directorio correcto.

## 4. Añadir TailwindCSS, PostCSS y Autoprefixer

```bash
pnpm add -D tailwindcss postcss autoprefixer @tailwindcss/forms
npx tailwindcss init tailwind.config.cjs -p
```

- Configura `tailwind.config.cjs` para que incluya `./src/**/*.{html,js,svelte,ts}` y los estilos de Skeleton (ver paso 6).

## 5. Instalar Skeleton UI

```bash
pnpm add @skeletonlabs/skeleton @skeletonlabs/skeleton-svelte
```

- Importa los estilos de Skeleton en tu CSS global (ej. `src/app.css`).

## 6. Archivos clave y contenido mínimo

- **`src/app.css`**

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
@import '@skeletonlabs/skeleton/styles/all.css';
```

- **`tailwind.config.cjs`**

```js
module.exports = {
	content: ['./src/**/*.{html,js,svelte,ts}', './node_modules/@skeletonlabs/**/*.{js,ts,svelte}'],
	theme: { extend: {} },
	plugins: []
};
```

- Asegura que `src/routes/+layout.svelte` importe `../app.css` al inicio:

```svelte
<script lang="ts">
	import '../app.css';
</script>
```

## 7. Linters, tests y herramientas recomendadas

```bash
pnpm add -D eslint prettier eslint-config-prettier eslint-plugin-svelte3 \
  @typescript-eslint/parser @typescript-eslint/eslint-plugin svelte-check \
  vitest @testing-library/svelte jsdom
```

- Añade scripts en `package.json`: **dev**, **build**, **preview**, **lint**, **format**, **test**, **typecheck**.

## 8. Ajustes en `vite.config.*`

- **No reordenar plugins** manualmente salvo que sepas lo que haces; comprueba que `sveltekit()` esté presente y que Vite use la configuración por defecto. Si usas plugins Vite específicos para Tailwind, añádelos antes de `sveltekit()` según la documentación.

## 9. Comprobaciones finales

- Ejecuta:
  ```bash
  pnpm dev
  pnpm lint
  pnpm test
  pnpm typecheck
  ```
- Revisa que **no haya warnings de compatibilidad** entre versiones en la consola.

---

## Riesgos y recomendaciones

- **Compatibilidad:** fija versiones en `package.json`/`pnpm-lock.yaml` para evitar roturas por actualizaciones mayores.
- **Interactividad de `sv create`:** puede pedir confirmaciones; ejecuta en un directorio vacío para evitar prompts inesperados.
- **Entorno Windows:** usa WSL para evitar problemas de permisos/EOL.

---

**Fuentes:** Documentación oficial de la CLI `sv create` y guía de creación de proyectos SvelteKit.
