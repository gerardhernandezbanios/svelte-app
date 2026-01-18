<script lang="ts">
  import { Card } from "@skeletonlabs/skeleton";
</script>

<section class="space-y-6">
  <div class="grid gap-6 lg:grid-cols-2">
    <Card class="p-4">
      <h2
        class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Carga de entrenamiento (CTL / ATL / TSB)
      </h2>
      <div
        class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Gráfica de líneas (TimescaleDB → series temporales)
      </div>
    </Card>

    <Card class="p-4">
      <h2
        class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Ritmo / potencia crítica
      </h2>
      <div
        class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Curva de potencia / ritmo crítica
      </div>
    </Card>
  </div>

  <div class="grid gap-6 lg:grid-cols-2">
    <Card class="p-4">
      <h2
        class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Histograma de ritmos / potencias
      </h2>
      <div
        class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Histograma
      </div>
    </Card>

    <Card class="p-4">
      <h2
        class="mb-2 text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
      >
        Tendencias por temporada
      </h2>
      <div
        class="h-64 rounded-md bg-surface-100 dark:bg-surface-900 flex items-center justify-center text-xs text-on-surface-variant"
      >
        Gráfica multi-año
      </div>
    </Card>
  </div>
</section>
