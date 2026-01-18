<script lang="ts">
  import { Card } from "@skeletonlabs/skeleton";
  import { Activity, Flame, Mountain, Clock } from "lucide-svelte";

  const summary = [
    { label: "Distancia semanal", value: "82 km", icon: Activity },
    { label: "Tiempo total", value: "6h 12m", icon: Clock },
    { label: "Desnivel positivo", value: "1.850 m", icon: Mountain },
    { label: "Calorías", value: "4.320 kcal", icon: Flame },
  ];

  const highlights = [
    {
      title: "Actividad más larga",
      value: "27 km · Trail",
      detail: "3h 05m · 780 m+",
    },
    {
      title: "Actividad más rápida",
      value: "10 km · Asfalto",
      detail: "4:12 /km",
    },
    {
      title: "Actividad más dura",
      value: "Puertos encadenados",
      detail: "1.450 m+ · 4h 20m",
    },
  ];
</script>

<section class="space-y-6">
  <div class="grid gap-4 md:grid-cols-4">
    {#each summary as item}
      {@const Icon = item.icon}
      <Card class="flex flex-col gap-2 p-4">
        <div class="flex items-center justify-between">
          <span class="text-xs uppercase tracking-wide text-on-surface-variant"
            >{item.label}</span
          >
          <Icon class="h-4 w-4 text-primary-500" />
        </div>
        <span class="text-xl font-semibold">{item.value}</span>
      </Card>
    {/each}
  </div>

  <div class="grid gap-6 lg:grid-cols-3">
    <Card class="lg:col-span-2 p-4">
      <h2
        class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Tendencia semanal
      </h2>
      <div
        class="h-40 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Placeholder sparkline / gráfica (ApexCharts / ECharts)
      </div>
    </Card>

    <Card class="p-4 space-y-3">
      <h2
        class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
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
    <h2
      class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
      Últimas actividades
    </h2>
    <div class="space-y-3">
      <div
        class="flex items-center justify-between gap-3 rounded-md bg-surface-100/70 dark:bg-surface-900/70 p-3"
      >
        <div class="flex flex-col">
          <span class="text-sm font-semibold">Rodaje suave</span>
          <span class="text-xs text-on-surface-variant"
            >10 km · 4:50 /km · 120 m+</span
          >
        </div>
        <div
          class="h-16 w-32 rounded bg-surface-200 dark:bg-surface-800 text-[10px] flex items-center justify-center text-on-surface-variant"
        >
          Mini-mapa (Leaflet / MapLibre)
        </div>
      </div>
    </div>
  </Card>
</section>
