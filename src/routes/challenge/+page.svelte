<script lang="ts">
  import { Card, ProgressBar } from "@skeletonlabs/skeleton";
</script>

<section class="space-y-6">
  <Card class="p-4 space-y-4">
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
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
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
      Retos personales
    </h2>
    <ul class="mt-3 space-y-2 text-sm">
      <li
        class="flex items-center justify-between rounded-md bg-surface-100 dark:bg-surface-900 p-3"
      >
        <span>Subir 10 puertos de más de 1.000 m+</span>
        <span class="text-xs text-on-surface-variant">4 / 10</span>
      </li>
    </ul>
  </Card>
</section>
