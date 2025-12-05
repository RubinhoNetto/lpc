# Dockerfile para desenvolvimento
FROM elixir:1.18-alpine AS dev

# Instalar dependências do sistema
RUN apk add --no-cache \
    build-base \
    git \
    inotify-tools \
    postgresql-client

# Criar diretório da aplicação
WORKDIR /app

# Instalar Hex + Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Copiar arquivos de dependências
COPY mix.exs mix.lock ./
RUN mix deps.get

# Copiar código da aplicação
COPY . .

# Expor porta do Phoenix
EXPOSE 4000

# Comando padrão
CMD ["mix", "phx.server"]

