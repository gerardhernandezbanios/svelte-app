<script lang="ts">
  import MainNav from "./MainNav.svelte";
  import { setTheme } from "@skeletonlabs/skeleton";
  import { onMount } from "svelte";

  let currentTheme = "modern";
  const themes = ["skeleton", "modern", "crimson"];

  onMount(() => {
    setTheme(currentTheme);
  });

  $: setTheme(currentTheme);
</script>

<div class="min-h-screen bg-background text-on-background transition-colors">
  <header
    class="border-b border-surface-200 bg-surface-50/80 dark:bg-surface-900/80 backdrop-blur"
  >
    <div class="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
      <div class="flex items-center gap-2">
        <span
          class="h-8 w-8 rounded-full bg-gradient-to-br from-primary-500 to-secondary-500"
        ></span>

        <div class="flex flex-col">
          <span class="text-sm font-semibold tracking-wide"
            >Strava Analytics</span
          >
          <span class="text-xs text-on-surface-variant"
            >Tu laboratorio personal de entrenamiento</span
          >
        </div>
      </div>

      <div class="flex items-center gap-3">
        <select bind:value={currentTheme} class="variant-filled text-sm">
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
