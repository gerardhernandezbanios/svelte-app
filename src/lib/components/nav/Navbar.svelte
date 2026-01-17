<script lang="ts">
  import {
    AppBar,
    Menu,
    MenuButton,
    MenuItems,
    MenuItem,
  } from "@skeletonlabs/skeleton-svelte";
  import {
    CalendarIcon,
    CircleUserIcon,
    MenuIcon,
    SearchIcon,
  } from "@lucide/svelte";
  import { Link } from "@sveltejs/kit";
</script>

<AppBar>
  <AppBar.Toolbar class="grid-cols-[auto_1fr_auto]">
    <AppBar.Lead>
      <button type="button" class="btn-icon btn-icon-lg hover:preset-tonal">
        <MenuIcon />
      </button>
    </AppBar.Lead>

    <AppBar.Headline>
      <p class="text-2xl">Strava Data Lab</p>
    </AppBar.Headline>

    <AppBar.Trail>
      <button type="button" class="btn-icon hover:preset-tonal">
        <SearchIcon class="size-6" />
      </button>
      <button type="button" class="btn-icon hover:preset-tonal">
        <CalendarIcon class="size-6" />
      </button>
      <button type="button" class="btn-icon hover:preset-tonal">
        <CircleUserIcon class="size-6" />
      </button>
    </AppBar.Trail>
  </AppBar.Toolbar>

  <nav class="menu">
    <Menu>
      <MenuButton class="btn btn-primary">Menú</MenuButton>
      <MenuItems>
        <MenuItem>
          <Link to="/" class="menu-item">Inicio</Link>
        </MenuItem>
        <MenuItem>
          <Link to="/datos" class="menu-item">Datos</Link>
        </MenuItem>
        <MenuItem>
          <Link to="/actividades" class="menu-item">Actividades</Link>
        </MenuItem>
        <MenuItem>
          <Link to="/perfil" class="menu-item">Perfil</Link>
        </MenuItem>
        <MenuItem>
          <Link to="/ayuda" class="menu-item">Ayuda</Link>
        </MenuItem>
      </MenuItems>
    </Menu>
  </nav>
</AppBar>

<style>
  .menu {
    margin-top: 1rem;
  }
  .menu-item {
    padding: 0.5rem 1rem;
    text-decoration: none;
    color: #333;
  }
  .menu-item:hover {
    background-color: #f0f0f0;
  }
</style>
