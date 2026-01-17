<!-- <script>
  import "./layout.css";
  import Navbar from "$lib/components/nav/Navbar.svelte";
</script>

<Navbar />

<slot /> -->
<!-- src/routes/+layout.svelte -->
<script lang="ts">
  import Topbar from "$lib/components/navigation/Topbar.svelte";
  import Sidebar from "$lib/components/navigation/Sidebar.svelte";

  let sidebarOpen: boolean = true;

  const toggleSidebar = (): void => {
    sidebarOpen = !sidebarOpen;
  };
</script>

<div class="flex h-screen overflow-hidden">
  <Sidebar open={sidebarOpen} />

  <div class="flex-1 flex flex-col">
    <Topbar {toggleSidebar} />

    <main class="flex-1 overflow-auto p-4">
      <slot />
    </main>
  </div>
</div>
