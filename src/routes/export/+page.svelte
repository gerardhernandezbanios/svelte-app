<script lang="ts">
  import { Card, Button } from "@skeletonlabs/skeleton";
</script>

<section class="space-y-6">
  <Card class="p-4 space-y-3">
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
      Importar actividades
    </h2>
    <input type="file" class="variant-soft" />
    <Button>Subir archivo</Button>
  </Card>

  <Card class="p-4 space-y-3">
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
      Exportar informes
    </h2>
    <div class="flex flex-wrap gap-3">
      <Button>Exportar resumen mensual (PDF)</Button>
      <Button>Exportar datos brutos (CSV)</Button>
    </div>
  </Card>
</section>
