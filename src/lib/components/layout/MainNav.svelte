<script lang="ts">
  import { page } from "$app/stores";
  import {
    House,
    Activity,
    Map,
    ChartNoAxesCombined,
    Target,
    FileDown,
    User,
  } from "@lucide/svelte";

  const links = [
    { href: "/", label: "Inicio", icon: House },
    { href: "/actividades", label: "Actividades", icon: Activity },
    { href: "/mapas", label: "Mapas", icon: Map },
    { href: "/estadisticas", label: "Estadísticas", icon: ChartNoAxesCombined },
    { href: "/retos", label: "Retos", icon: Target },
    { href: "/exportar", label: "Exportar", icon: FileDown },
    { href: "/perfil", label: "Perfil", icon: User },
  ];
</script>

<nav class="flex gap-2 md:flex-col">
  {#each links as link}
    {@const Icon = link.icon}
    <a
      href={link.href}
      class="flex items-center gap-2 rounded-lg px-3 py-2 text-sm transition-colors
                hover:bg-surface-200/70 dark:hover:bg-surface-800
                {$page.url.pathname === link.href
        ? 'bg-surface-200 dark:bg-surface-800 font-semibold'
        : ''}"
    >
      <Icon class="w-4 h-4" />
      <span>{link.label}</span>
    </a>
  {/each}
</nav>
