<script lang="ts">
  import { AppBar } from "@skeletonlabs/skeleton-svelte";
  import {
    CalendarIcon,
    CircleUserIcon,
    MenuIcon,
    SearchIcon,
  } from "@lucide/svelte";
  // import ArrowLeft from '@lucide/svelte/icons/arrow-left';
  // import Paperclip from '@lucide/svelte/icons/paperclip';
  // import Calendar from '@lucide/svelte/icons/calendar';
  // import CircleUser from '@lucide/svelte/icons/circle-user';
</script>

<AppBar>
  <AppBar.Toolbar class="grid-cols-[auto_1fr_auto]">
    <AppBar.Lead>
      <button type="button" class="btn-icon btn-icon-lg hover:preset-tonal"
        ><MenuIcon /></button
      >
    </AppBar.Lead>
    <AppBar.Headline>
      <p class="text-2xl">Skeleton</p>
    </AppBar.Headline>
    <AppBar.Trail>
      <button type="button" class="btn-icon hover:preset-tonal"
        ><SearchIcon class="size-6" /></button
      >
      <button type="button" class="btn-icon hover:preset-tonal"
        ><CalendarIcon class="size-6" /></button
      >
      <button type="button" class="btn-icon hover:preset-tonal"
        ><CircleUserIcon class="size-6" /></button
      >
    </AppBar.Trail>
  </AppBar.Toolbar>
</AppBar>
