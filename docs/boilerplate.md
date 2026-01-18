Me encanta lo que quieres montar, Gerard—esto huele a “Strava Pro” hecho a mano. Vamos a dejarte un boilerplate en **TypeScript**, con **SvelteKit 2 + Skeleton + Tailwind + themes + dark/light**, y toda la **navegación preparada** para las secciones que has descrito.

Voy a darte:

1. Estructura de rutas y concepto de navegación
2. Configuración base (TypeScript, SvelteKit, Tailwind, Skeleton)
3. Layout principal con menú moderno + selector de tema
4. Skeleton de cada sección (Dashboard, Actividades, Mapas, Estadísticas, Retos, Exportar, Perfil)
5. Sitios claros donde enchufar TimescaleDB/PostGIS y librerías de gráficas/mapas

---

### 1. Estructura de rutas

Propuesta de rutas SvelteKit:

```txt
src/
├── routes/
│   ├── +layout.svelte        # Layout global con nav + theme
│   ├── +layout.ts            # Load de datos globales si hace falta
│   ├── +page.svelte          # Dashboard / Inicio
│   ├── actividades/
│   │   └── +page.svelte
│   ├── mapas/
│   │   └── +page.svelte
│   ├── estadisticas/
│   │   └── +page.svelte
│   ├── retos/
│   │   └── +page.svelte
│   ├── exportar/
│   │   └── +page.svelte
│   └── perfil/
│       └── +page.svelte
├── lib/
│   ├── components/
│   │   ├── layout/
│   │   │   ├── AppShell.svelte
│   │   │   └── MainNav.svelte
│   │   ├── dashboard/
│   │   ├── charts/
│   │   └── maps/
│   ├── stores/
│   │   └── theme.ts
│   └── server/
│       └── db.ts
```

---

### 2. Configuración base (TypeScript + SvelteKit + Tailwind + Skeleton)

#### `svelte.config.ts`

```ts
import adapter from "@sveltejs/adapter-auto";
import { vitePreprocess } from "@sveltejs/kit/vite";

const config = {
  preprocess: vitePreprocess(),
  kit: {
    adapter: adapter(),
  },
};

export default config;
```

#### `vite.config.ts`

```ts
import { sveltekit } from "@sveltejs/kit/vite";
import tailwindcss from "@tailwindcss/vite";
import type { UserConfig } from "vite";

const config: UserConfig = {
  plugins: [tailwindcss(), sveltekit()],
};

export default config;
```

#### `tailwind.config.ts`

Aunque estés en Tailwind v4, mantenemos config para Skeleton:

```ts
import type { Config } from "tailwindcss";
import { skeleton } from "@skeletonlabs/skeleton/tailwind";

const config: Config = {
  content: ["./src/**/*.{html,svelte,ts}"],
  theme: {
    extend: {},
  },
  plugins: [
    skeleton({
      themes: {
        preset: [
          { name: "skeleton", enhancements: true },
          { name: "modern", enhancements: true },
          { name: "crimson", enhancements: true },
        ],
      },
    }),
  ],
};

export default config;
```

#### `src/app.d.ts`

```ts
// src/app.d.ts
declare global {
  namespace App {
    // interface Locals {}
    // interface PageData {}
    // interface Error {}
    // interface Platform {}
  }
}

export {};
```

#### `src/lib/stores/theme.ts`

```ts
import { writable } from "svelte/store";

export const theme = writable<string>("modern");
```

---

### 3. Layout principal con menú moderno + selector de tema

#### `src/lib/components/layout/MainNav.svelte`

Menú lateral/top responsive, minimalista:

```svelte
<script lang="ts">
	import { page } from '$app/stores';
	import { Home, Activity, Map, BarChart3, Target, FileDown, User } from 'lucide-svelte';

	const links = [
		{ href: '/', label: 'Inicio', icon: Home },
		{ href: '/actividades', label: 'Actividades', icon: Activity },
		{ href: '/mapas', label: 'Mapas', icon: Map },
		{ href: '/estadisticas', label: 'Estadísticas', icon: BarChart3 },
		{ href: '/retos', label: 'Retos', icon: Target },
		{ href: '/exportar', label: 'Exportar', icon: FileDown },
		{ href: '/perfil', label: 'Perfil', icon: User }
	];
</script>

<nav class="flex gap-2 md:flex-col">
	{#each links as link}
		{@const Icon = link.icon}
		<a
			href={link.href}
			class="flex items-center gap-2 rounded-lg px-3 py-2 text-sm transition-colors
				hover:bg-surface-200/70 dark:hover:bg-surface-800
				{($page.url.pathname === link.href) ? 'bg-surface-200 dark:bg-surface-800 font-semibold' : ''}"
		>
			<Icon class="w-4 h-4" />
			<span>{link.label}</span>
		</a>
	{/each}
</nav>
```

#### `src/lib/components/layout/AppShell.svelte`

Shell con header, nav y contenido:

```svelte
<script lang="ts">
	import MainNav from './MainNav.svelte';
	import { setTheme } from '@skeletonlabs/skeleton';
	import { onMount } from 'svelte';

	let currentTheme = 'modern';
	const themes = ['skeleton', 'modern', 'crimson'];

	onMount(() => {
		setTheme(currentTheme);
	});

	$: setTheme(currentTheme);
</script>

<div class="min-h-screen bg-background text-on-background transition-colors">
	<header class="border-b border-surface-200 bg-surface-50/80 dark:bg-surface-900/80 backdrop-blur">
		<div class="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
			<div class="flex items-center gap-2">
				<span class="h-8 w-8 rounded-full bg-gradient-to-br from-primary-500 to-secondary-500" />
				<div class="flex flex-col">
					<span class="text-sm font-semibold tracking-wide">Strava Analytics</span>
					<span class="text-xs text-on-surface-variant">Tu laboratorio personal de entrenamiento</span>
				</div>
			</div>

			<div class="flex items-center gap-3">
				<select
					bind:value={currentTheme}
					class="variant-filled text-sm"
				>
					{#each themes as t}
						<option value={t}>{t}</option>
					{/each}
				</select>
			</div>
		</div>
	</header>

	<div class="mx-auto flex max-w-6xl gap-6 px-4 py-6">
		<aside class="hidden w-52 shrink-0 md:block">
			<MainNav />
		</aside>

		<main class="flex-1">
			<slot />
		</main>
	</div>
</div>
```

#### `src/routes/+layout.svelte`

```svelte
<script lang="ts">
	import AppShell from '$lib/components/layout/AppShell.svelte';
</script>

<AppShell>
	<slot />
</AppShell>
```

---

### 4. Skeleton de cada sección

#### 4.1 Dashboard / Inicio — `src/routes/+page.svelte`

```svelte
<script lang="ts">
	import { Card } from '@skeletonlabs/skeleton';
	import { Activity, Flame, Mountain, Clock } from 'lucide-svelte';

	const summary = [
		{ label: 'Distancia semanal', value: '82 km', icon: Activity },
		{ label: 'Tiempo total', value: '6h 12m', icon: Clock },
		{ label: 'Desnivel positivo', value: '1.850 m', icon: Mountain },
		{ label: 'Calorías', value: '4.320 kcal', icon: Flame }
	];

	const highlights = [
		{ title: 'Actividad más larga', value: '27 km · Trail', detail: '3h 05m · 780 m+' },
		{ title: 'Actividad más rápida', value: '10 km · Asfalto', detail: '4:12 /km' },
		{ title: 'Actividad más dura', value: 'Puertos encadenados', detail: '1.450 m+ · 4h 20m' }
	];
</script>

<section class="space-y-6">
	<div class="grid gap-4 md:grid-cols-4">
		{#each summary as item}
			{@const Icon = item.icon}
			<Card class="flex flex-col gap-2 p-4">
				<div class="flex items-center justify-between">
					<span class="text-xs uppercase tracking-wide text-on-surface-variant">{item.label}</span>
					<Icon class="h-4 w-4 text-primary-500" />
				</div>
				<span class="text-xl font-semibold">{item.value}</span>
			</Card>
		{/each}
	</div>

	<div class="grid gap-6 lg:grid-cols-3">
		<Card class="lg:col-span-2 p-4">
			<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Tendencia semanal
			</h2>
			<div class="h-40 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Placeholder sparkline / gráfica (ApexCharts / ECharts)
			</div>
		</Card>

		<Card class="p-4 space-y-3">
			<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Highlights
			</h2>
			{#each highlights as h}
				<div class="rounded-md bg-surface-100/70 dark:bg-surface-900/70 p-3">
					<div class="text-sm font-semibold">{h.title}</div>
					<div class="text-sm">{h.value}</div>
					<div class="text-xs text-on-surface-variant">{h.detail}</div>
				</div>
			{/each}
		</Card>
	</div>

	<Card class="p-4">
		<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Últimas actividades
		</h2>
		<div class="space-y-3">
			<div class="flex items-center justify-between gap-3 rounded-md bg-surface-100/70 dark:bg-surface-900/70 p-3">
				<div class="flex flex-col">
					<span class="text-sm font-semibold">Rodaje suave</span>
					<span class="text-xs text-on-surface-variant">10 km · 4:50 /km · 120 m+</span>
				</div>
				<div class="h-16 w-32 rounded bg-surface-200 dark:bg-surface-800 text-[10px] flex items-center justify-center text-on-surface-variant">
					Mini-mapa (Leaflet / MapLibre)
				</div>
			</div>
		</div>
	</Card>
</section>
```

---

#### 4.2 Actividades — `src/routes/actividades/+page.svelte`

```svelte
<script lang="ts">
	import { Card } from '@skeletonlabs/skeleton';

	const deportes = ['Correr', 'Ciclismo', 'Trail', 'Natación'];
</script>

<section class="space-y-6">
	<div class="flex flex-wrap items-center gap-3">
		<select class="variant-soft">
			<option>Todos los deportes</option>
			{#each deportes as d}
				<option>{d}</option>
			{/each}
		</select>

		<input class="variant-soft" type="date" />
		<input class="variant-soft" type="date" />
		<input class="variant-soft" type="text" placeholder="Filtrar por zona geográfica" />
	</div>

	<div class="grid gap-6 lg:grid-cols-[2fr,3fr]">
		<Card class="p-4">
			<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Listado de actividades
			</h2>
			<div class="h-80 overflow-auto text-sm">
				<div class="grid grid-cols-[2fr,1fr,1fr] gap-2 border-b border-surface-200 pb-1 text-xs uppercase text-on-surface-variant">
					<span>Nombre</span>
					<span>Distancia</span>
					<span>Fecha</span>
				</div>
				<!-- Aquí mapearás datos reales -->
				<div class="grid grid-cols-[2fr,1fr,1fr] gap-2 py-2 border-b border-surface-100 text-sm">
					<span>Rodaje progresivo</span>
					<span>14.2 km</span>
					<span>2026-01-15</span>
				</div>
			</div>
		</Card>

		<Card class="p-4 space-y-3">
			<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Mapa interactivo
			</h2>
			<div class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Mapa (PostGIS → GeoJSON → Leaflet/MapLibre)
			</div>
			<div class="h-40 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Comparador de actividades (superposición de rutas)
			</div>
		</Card>
	</div>
</section>
```

---

#### 4.3 Mapas — `src/routes/mapas/+page.svelte`

```svelte
<script lang="ts">
	import { Card } from '@skeletonlabs/skeleton';
</script>

<section class="space-y-6">
	<div class="grid gap-6 lg:grid-cols-2">
		<Card class="p-4 space-y-3">
			<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Heatmap personal
			</h2>
			<div class="h-72 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Heatmap (PostGIS ST_Union / ST_Dump → tiles)
			</div>
		</Card>

		<Card class="p-4 space-y-3">
			<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Cobertura de entrenamiento
			</h2>
			<div class="h-72 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Mapa de cobertura / cuadrículas
			</div>
		</Card>
	</div>

	<Card class="p-4 space-y-3">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Mapa 3D / elevación
		</h2>
		<div class="h-80 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
			3D (DeckGL / MapLibre + DEM)
		</div>
	</Card>
</section>
```

---

#### 4.4 Estadísticas avanzadas — `src/routes/estadisticas/+page.svelte`

```svelte
<script lang="ts">
	import { Card } from '@skeletonlabs/skeleton';
</script>

<section class="space-y-6">
	<div class="grid gap-6 lg:grid-cols-2">
		<Card class="p-4">
			<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Carga de entrenamiento (CTL / ATL / TSB)
			</h2>
			<div class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Gráfica de líneas (TimescaleDB → series temporales)
			</div>
		</Card>

		<Card class="p-4">
			<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Ritmo / potencia crítica
			</h2>
			<div class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Curva de potencia / ritmo crítica
			</div>
		</Card>
	</div>

	<div class="grid gap-6 lg:grid-cols-2">
		<Card class="p-4">
			<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Histograma de ritmos / potencias
			</h2>
			<div class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Histograma
			</div>
		</Card>

		<Card class="p-4">
			<h2 class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
				Tendencias por temporada
			</h2>
			<div class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant">
				Gráfica multi-año
			</div>
		</Card>
	</div>
</section>
```

---

#### 4.5 Retos y objetivos — `src/routes/retos/+page.svelte`

```svelte
<script lang="ts">
	import { Card, ProgressBar } from '@skeletonlabs/skeleton';
</script>

<section class="space-y-6">
	<Card class="p-4 space-y-4">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Objetivos anuales
		</h2>

		<div class="space-y-3">
			<div>
				<div class="flex justify-between text-xs mb-1">
					<span>Distancia</span>
					<span>820 / 2.000 km</span>
				</div>
				<ProgressBar value={41} />
			</div>

			<div>
				<div class="flex justify-between text-xs mb-1">
					<span>Desnivel</span>
					<span>18.200 / 50.000 m+</span>
				</div>
				<ProgressBar value={36} />
			</div>
		</div>
	</Card>

	<Card class="p-4">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Retos personales
		</h2>
		<ul class="mt-3 space-y-2 text-sm">
			<li class="flex items-center justify-between rounded-md bg-surface-100 dark:bg-surface-900 p-3">
				<span>Subir 10 puertos de más de 1.000 m+</span>
				<span class="text-xs text-on-surface-variant">4 / 10</span>
			</li>
		</ul>
	</Card>
</section>
```

---

#### 4.6 Exportar / Importar — `src/routes/exportar/+page.svelte`

```svelte
<script lang="ts">
	import { Card, Button } from '@skeletonlabs/skeleton';
</script>

<section class="space-y-6">
	<Card class="p-4 space-y-3">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Importar actividades
		</h2>
		<input type="file" class="variant-soft" />
		<Button>Subir archivo</Button>
	</Card>

	<Card class="p-4 space-y-3">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Exportar informes
		</h2>
		<div class="flex flex-wrap gap-3">
			<Button>Exportar resumen mensual (PDF)</Button>
			<Button>Exportar datos brutos (CSV)</Button>
		</div>
	</Card>
</section>
```

---

#### 4.7 Perfil — `src/routes/perfil/+page.svelte`

```svelte
<script lang="ts">
	import { Card, Switch } from '@skeletonlabs/skeleton';
</script>

<section class="space-y-6">
	<Card class="p-4 space-y-3">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Datos personales
		</h2>
		<div class="grid gap-3 md:grid-cols-2">
			<input class="variant-soft" placeholder="Nombre" />
			<input class="variant-soft" placeholder="Peso (kg)" />
			<input class="variant-soft" placeholder="Altura (cm)" />
			<input class="variant-soft" placeholder="FTP / Potencia crítica" />
		</div>
	</Card>

	<Card class="p-4 space-y-3">
		<h2 class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant">
			Preferencias
		</h2>
		<div class="space-y-2 text-sm">
			<div class="flex items-center justify-between">
				<span>Modo oscuro por defecto</span>
				<Switch />
			</div>
			<div class="flex items-center justify-between">
				<span>Unidades métricas</span>
				<Switch checked />
			</div>
		</div>
	</Card>
</section>
```

---

### 5. Punto de integración con TimescaleDB/PostGIS

#### `src/lib/server/db.ts`

```ts
import pg from "pg";

const pool = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
});

export async function getRecentActivities() {
  const query = `
		SELECT id, name, distance, moving_time, total_elevation_gain, start_date
		FROM activities
		ORDER BY start_date DESC
		LIMIT 20;
	`;
  const res = await pool.query(query);
  return res.rows;
}
```

#### Ejemplo de endpoint — `src/routes/api/actividades/+server.ts`

```ts
import type { RequestHandler } from "@sveltejs/kit";
import { getRecentActivities } from "$lib/server/db";

export const GET: RequestHandler = async () => {
  const activities = await getRecentActivities();
  return new Response(JSON.stringify(activities), {
    headers: { "Content-Type": "application/json" },
  });
};
```

Luego, en `+page.svelte` de dashboard o actividades, puedes hacer `load` y consumir esos datos.

---

Si quieres, siguiente paso quirúrgico puede ser:

- Elegir **librería de gráficas** (ApexCharts / ECharts) y te preparo componentes base.
- Elegir **librería de mapas** (Leaflet / MapLibre) y te dejo un wrapper listo para PostGIS (GeoJSON).

¿Te apetece que ataquemos primero **gráficas** o **mapas**?
