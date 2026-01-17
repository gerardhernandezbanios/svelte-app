<script lang="ts">
  export let toggleSidebar: () => void;
</script>

<header
  class="h-14 bg-surface-100 dark:bg-surface-900 border-b flex items-center px-4 gap-4"
>
  <button class="md:hidden" on:click={toggleSidebar}>
    <svg width="24" height="24"><path d="M3 6h18M3 12h18M3 18h18" /></svg>
  </button>

  <h1 class="font-bold text-lg">Strava Dashboard</h1>

  <div class="ml-auto flex items-center gap-3">
    <!-- acciones -->
  </div>
</header>
