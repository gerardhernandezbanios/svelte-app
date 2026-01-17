**Resumen breve:** **Te propongo un script reproducible que usa `pnpm` para crear un proyecto SvelteKit con TypeScript, Tailwind (v4 compatible con Vite), e integrar Skeleton UI; además incluyo linters, Vitest para tests y comandos útiles para desarrollo y playground.** Las instrucciones siguen las guías oficiales de Skeleton y Tailwind para SvelteKit.

### Enfoque recomendado (rápido)

- **Scaffold** con `pnpm create svelte@latest` o el CLI de Skeleton para plantilla inicial.
- **Instalar Tailwind** usando el plugin oficial `@tailwindcss/vite` y seguir la guía de Tailwind para SvelteKit.
- **Agregar Skeleton** instalando los paquetes oficiales y añadiendo sus imports en tu CSS/global layout.

---

### Script de ejemplo (`scripts/setup-svelte.sh`)

Guarda esto en la raíz (`svelte-app/setup-svelte.sh`) y ejecútalo desde ahí:

```bash
#!/usr/bin/env bash
set -euo pipefail

APP_NAME="${1:-svelte-app}"
echo "Creando ${APP_NAME} con pnpm + SvelteKit + TS..."

# 1. Scaffold SvelteKit (TypeScript)
pnpm create svelte@latest "$APP_NAME" -- --template skeleton
cd "$APP_NAME"

# 2. Instalar dependencias base
pnpm install

# 3. Tailwind (plugin Vite) y Skeleton
pnpm add -D tailwindcss @tailwindcss/vite
pnpm add -D @skeletonlabs/skeleton @skeletonlabs/skeleton-svelte

# 4. Linters, formateo y test runner
pnpm add -D eslint prettier eslint-config-prettier eslint-plugin-svelte3 @typescript-eslint/parser @typescript-eslint/eslint-plugin
pnpm add -D vitest @testing-library/svelte jsdom svelte-check

# 5. Crear archivo CSS base e importar Tailwind + Skeleton
mkdir -p src
cat > src/app.css <<'CSS'
@import 'tailwindcss';
@import '@skeletonlabs/skeleton';
@import '@skeletonlabs/skeleton-svelte';
/* Añade aquí tu tema si procede */
CSS

# 6. Añadir plugin Tailwind a vite.config.ts (si no existe)
# (Inserta manualmente: import tailwindcss from '@tailwindcss/vite' y añadir a plugins)

echo "Setup inicial completado. Ejecuta: cd $APP_NAME && pnpm dev"
```

**Nota:** el flag `--template skeleton` es ilustrativo; si usas el CLI de Skeleton usa `npm create skeleton-app@latest` o sigue su guía para SvelteKit.

---

### `package.json` — scripts sugeridos

- **dev:** `pnpm dev`
- **build:** `pnpm build`
- **lint:** `eslint . --ext .ts,.svelte`
- **format:** `prettier --write .`
- **test:** `vitest`

---

### Integración y ajustes clave

- **Tailwind + Vite:** añade `@tailwindcss/vite` en `vite.config.ts` antes de `sveltekit()` para evitar problemas de PostCSS.
- **Skeleton:** importa sus estilos en tu CSS global y configura `data-theme` en `app.html` si quieres temas predefinidos.
- **Versiones:** Tailwind v4 puede estar en RC/alpha; si quieres estabilidad usa la versión estable o prueba v4 con precaución.
- **Devtools:** añade `svelte-check`, `typescript` y `playground` (por ejemplo Storybook o el propio Playground de Skeleton) según necesites.

---

### Riesgos y recomendaciones

- **Compatibilidad de versiones** entre SvelteKit, Tailwind y Skeleton; prueba en una rama y fija versiones en `pnpm-lock.yaml`.
- **CI:** añade checks de `lint` y `test` en tu pipeline.
- **Performance:** usa `pnpm` workspace si vas a tener paquetes monorepo.
