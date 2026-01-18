<script lang="ts">
  import { Card, Switch } from "@skeletonlabs/skeleton";
</script>

<section class="space-y-6">
  <Card class="p-4 space-y-3">
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
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
    <h2
      class="text-sm font-semibold uppercase tracking-wide text-on-surface-variant"
    >
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
