#!/usr/bin/env bash
set -euo pipefail

echo "=== postCreate: inicio ==="

# Movernos al workspace (ruta relativa al script)
cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/../.." || true

# Asegurar que PNPM_HOME coincide con la ruta usada en la imagen
export PNPM_HOME="${PNPM_HOME:-/home/node/.local/share/pnpm}"
export PATH="$PNPM_HOME:$PATH"

# Comprobar si pnpm ya está disponible
if command -v pnpm >/dev/null 2>&1; then
  echo "pnpm ya disponible: $(pnpm --version)"
else
  echo "pnpm no encontrado en PATH. Intentando activar con corepack..."
  if command -v corepack >/dev/null 2>&1; then
    corepack enable || true
    corepack prepare pnpm@latest --activate || true
  else
    echo "Advertencia: corepack no disponible. Instalando pnpm localmente en \$HOME/.local..."
    mkdir -p "$HOME/.local/bin"
    npm install --no-audit --no-fund --prefix "$HOME/.local" pnpm@latest
    export PATH="$HOME/.local/bin:$PATH"
  fi
fi

echo "pnpm versión: $(pnpm --version || echo 'no disponible')"

# Instalar dependencias del proyecto de forma idempotente
if [ -f package.json ]; then
  if [ -d node_modules ] && [ -f pnpm-lock.yaml ]; then
    echo "node_modules detectado y lockfile presente. Saltando instalación. Ejecuta 'pnpm install --force' si quieres reinstalar."
  else
    echo "Instalando dependencias con pnpm..."
    if [ -f pnpm-lock.yaml ]; then
      pnpm install --frozen-lockfile
    else
      pnpm install
    fi
  fi
else
  echo "No se encontró package.json. Saltando instalación."
fi

# Mensaje final
echo "postCreate completado. Inicia dev con: pnpm dev -- --host"
