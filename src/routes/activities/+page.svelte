<script lang="ts">
  import { Card } from "@skeletonlabs/skeleton";

  const deportes = ["Correr", "Ciclismo", "Trail", "Natación"];
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
    <input
      class="variant-soft"
      type="text"
      placeholder="Filtrar por zona geográfica"
    />
  </div>

  <div class="grid gap-6 lg:grid-cols-[2fr,3fr]">
    <Card class="p-4">
      <h2
        class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Listado de actividades
      </h2>
      <div class="h-80 overflow-auto text-sm">
        <div
          class="grid grid-cols-[2fr,1fr,1fr] gap-2 border-b border-surface-200 pb-1 text-xs uppercase text-on-surface-variant"
        >
          <span>Nombre</span>
          <span>Distancia</span>
          <span>Fecha</span>
        </div>
        <!-- Aquí mapearás datos reales -->
        <div
          class="grid grid-cols-[2fr,1fr,1fr] gap-2 py-2 border-b border-surface-100 text-sm"
        >
          <span>Rodaje progresivo</span>
          <span>14.2 km</span>
          <span>2026-01-15</span>
        </div>
      </div>
    </Card>

    <Card class="p-4 space-y-3">
      <h2
        class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Mapa interactivo
      </h2>
      <div
        class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Mapa (PostGIS → GeoJSON → Leaflet/MapLibre)
      </div>
      <div
        class="h-40 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Comparador de actividades (superposición de rutas)
      </div>
    </Card>
  </div>
</section>
