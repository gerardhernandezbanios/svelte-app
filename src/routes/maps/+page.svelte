<script lang="ts">
  import { Card } from "@skeletonlabs/skeleton";
</script>

<section class="space-y-6">
  <div class="grid gap-6 lg:grid-cols-2">
    <Card class="p-4 space-y-3">
      <h2
        class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Heatmap personal
      </h2>
      <div
        class="h-72 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Heatmap (PostGIS ST_Union / ST_Dump → tiles)
      </div>
    </Card>

    <Card class="p-4 space-y-3">
      <h2
        class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Cobertura de entrenamiento
      </h2>
      <div
        class="h-72 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Mapa de cobertura / cuadrículas
      </div>
    </Card>
  </div>

  <Card class="p-4 space-y-3">
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
      Mapa 3D / elevación
    </h2>
    <div
      class="h-80 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
    >
      3D (DeckGL / MapLibre + DEM)
    </div>
  </Card>
</section>
