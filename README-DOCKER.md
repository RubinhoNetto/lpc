# Docker Setup - LPC (Liga Pauper Catarinense)

## 🐳 Configuração Docker

Este projeto está configurado para rodar completamente com Docker, incluindo:

- Phoenix LiveView (Elixir 1.18)
- PostgreSQL 16
- Hot reload automático

## 🚀 Primeiros Passos

### Pré-requisitos

- Docker
- Docker Compose

### Iniciar o projeto

```bash
# Subir os containers
docker compose up

# Ou em modo detached (background)
docker compose up -d
```

Na primeira execução, o Docker vai:

1. Baixar as imagens necessárias
2. Instalar as dependências Elixir (esbuild, tailwind, etc)
3. Criar o banco de dados
4. Rodar as migrations
5. Iniciar o servidor Phoenix

Acesse: **<http://localhost:4008>**

## 📋 Comandos Úteis

### Gerenciamento dos containers

```bash
# Ver logs
docker compose logs -f web

# Parar os containers
docker compose down

# Parar e remover volumes (⚠️ apaga o banco)
docker compose down -v

# Rebuildar as imagens
docker compose build

# Restart dos containers
docker compose restart
```

### Executar comandos no container

```bash
# Abrir um shell interativo
docker compose exec web sh

# Rodar migrations
docker compose exec web mix ecto.migrate

# Criar uma migration
docker compose exec web mix ecto.gen.migration nome_da_migration

# Rodar seeds
docker compose exec web mix run priv/repo/seeds.exs

# Rodar testes
docker compose exec web mix test

# Abrir IEx (console interativo)
docker compose exec web iex -S mix

# Mix format
docker compose exec web mix format
```

### Banco de Dados

```bash
# Acessar o PostgreSQL pelo container
docker compose exec db psql -U postgres -d lpc_dev

# Resetar o banco
docker compose exec web mix ecto.reset
```

**Conectar de fora do container (ex: DBeaver, pgAdmin):**

- Host: `localhost`
- Port: `5433`
- Database: `lpc_dev`
- Username: `postgres`
- Password: `postgres`

## 🔧 Desenvolvimento

### Hot Reload

O projeto está configurado com volumes que sincronizam seu código local com o container. Qualquer alteração nos arquivos será refletida automaticamente.

### Portas

- **4008** - Phoenix Server (mapeado para porta 4000 interna do container)
- **5433** - PostgreSQL (mapeado para porta 5432 interna do container)

### Variáveis de Ambiente

As variáveis estão configuradas no `docker compose.yml`:

- `DATABASE_URL` - String de conexão do banco
- `SECRET_KEY_BASE` - Chave secreta (apenas dev)
- `PHX_HOST` - Host do Phoenix
- `PHX_SERVER` - Ativa o servidor

## 🐛 Troubleshooting

### Container não inicia

```bash
# Ver logs detalhados
docker compose logs web

# Verificar status
docker compose ps
```

### Erro de conexão com banco

```bash
# Garantir que o banco está saudável
docker compose ps

# Recriar o container do banco
docker compose up -d --force-recreate db
```

### Dependências desatualizadas

```bash
# Rebuildar do zero
docker compose down
docker compose build --no-cache
docker compose up
```

### Limpar tudo e recomeçar

```bash
docker compose down -v
docker compose build --no-cache
docker compose up
```

## 📝 Notas

- Os volumes `_build`, `deps` e `node_modules` são gerenciados pelo Docker para melhor performance
- Em produção, use um Dockerfile otimizado com multi-stage build
- A SECRET_KEY_BASE no docker compose.yml é apenas para desenvolvimento
