<script lang="ts">
  import type { ComponentType } from "svelte";
  import { navItems } from "$lib/config/navigation";

  export let open: boolean = true;

  export interface NavItem {
    label: string;
    icon: ComponentType;
    href: string;
  }
</script>

<aside
  class="bg-surface-100 dark:bg-surface-900 h-screen border-r border-surface-300
         transition-all duration-300 flex flex-col"
  style={`width: ${open ? "240px" : "70px"}`}
>
  <nav class="flex-1 p-3 space-y-2">
    {#each navItems as item (item.href)}
      <a
        href={item.href}
        class="flex items-center gap-3 p-2 rounded hover:bg-surface-200 dark:hover:bg-surface-800"
      >
        <item.icon size={20} />
        {#if open}
          <span>{item.label}</span>
        {/if}
      </a>
    {/each}
  </nav>
</aside>
