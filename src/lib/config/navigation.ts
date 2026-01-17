import type { ComponentType } from "svelte";
import { Activity, BarChart3, Home } from "lucide-svelte";

export interface NavItem {
  label: string;
  icon: ComponentType;
  href: string;
}

export const navItems: NavItem[] = [
  { label: "Dashboard", icon: Home, href: "/dashboard" },
  { label: "Actividades", icon: Activity, href: "/activities" },
  { label: "Estadísticas", icon: BarChart3, href: "/stats" }
];
