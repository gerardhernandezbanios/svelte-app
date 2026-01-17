# Base image with Node + TypeScript tooling
FROM mcr.microsoft.com/devcontainers/typescript-node:24

USER root

# Limpiar posibles restos de pnpm instalados por npm en capas previas
RUN rm -rf /usr/local/share/npm-global/lib/node_modules/pnpm || true \
    && rm -f /usr/local/share/npm-global/bin/pnpm || true \
    && rm -f /usr/local/bin/pnpm || true

# Fijar PNPM_HOME en la ruta de usuario que será persistida
ENV PNPM_HOME=/home/node/.local/share/pnpm
ENV PATH=$PNPM_HOME:$PATH

# Crear PNPM_HOME, habilitar corepack y activar pnpm en la ruta persistente
RUN mkdir -p $PNPM_HOME \
  && corepack enable \
  && corepack prepare pnpm@latest --activate \
  && chown -R node:node /home/node/.local

# Crear workspace y asegurar permisos
RUN mkdir -p /workspace && chown -R node:node /workspace

# Copiar script postCreate y ajustar permisos
COPY .devcontainer/postCreate.sh /workspace/.devcontainer/postCreate.sh
RUN chmod 0755 /workspace/.devcontainer/postCreate.sh \
  && chown node:node /workspace/.devcontainer/postCreate.sh

# Cambiar a usuario no privilegiado
USER node
WORKDIR /workspace

# Nota: no copiar el resto del repo para mantener la cache de dependencias limpia
