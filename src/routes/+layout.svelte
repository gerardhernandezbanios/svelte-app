<!-- <script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.svg';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>
{@render children()} -->
<script>
  import "./layout.css";
  import Navbar from "$lib/components/nav/Navbar.svelte";
  //import favicon from "$lib/assets/favicon.svg";

  //	let { children } = $props();
</script>

<Navbar />

<slot />
