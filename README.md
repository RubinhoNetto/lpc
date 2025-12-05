# LPC - Liga Pauper Catarinense 🎮⚔️

Sistema de gerenciamento para a Liga Pauper Catarinense, desenvolvido com Phoenix LiveView.

## 🚀 Stack Tecnológica

- **Elixir 1.18** - Linguagem funcional e concorrente
- **Phoenix 1.7** - Framework web moderno
- **LiveView** - Interface reativa em tempo real
- **TailwindCSS** - Estilização com utility-first
- **PostgreSQL 16** - Banco de dados relacional
- **Docker** - Containerização completa

## 🐳 Início Rápido com Docker (Recomendado)

```bash
# Iniciar o projeto
docker compose up

# Acessar
http://localhost:4008
```

📖 **[Ver documentação completa do Docker](README-DOCKER.md)**

## 💻 Desenvolvimento Local (sem Docker)

### Pré-requisitos

- Elixir 1.18+
- Erlang/OTP 27+
- PostgreSQL 16+
- Node.js 18+

### Setup

```bash
# Instalar dependências
mix setup

# Iniciar servidor
mix phx.server

# Ou com IEx interativo
iex -S mix phx.server
```

Acesse: [`localhost:4000`](http://localhost:4000) (ou `localhost:4008` se usar Docker)

## 📋 Comandos Úteis

```bash
# Rodar testes
mix test

# Formatar código
mix format

# Pre-commit (formatar + verificar)
mix precommit

# Criar migration
mix ecto.gen.migration nome_da_migration

# Rodar migrations
mix ecto.migrate

# Resetar banco de dados
mix ecto.reset
```

## 🏗️ Arquitetura

```text
lib/
├── lpc/              # Contextos de negócio
│   └── repo.ex       # Interface com o banco
├── lpc_web/          # Camada web
│   ├── components/   # Componentes reutilizáveis
│   ├── live/         # LiveViews
│   └── router.ex     # Rotas
```

**Princípio:** LiveView comunica **diretamente** com Contextos (sem APIs REST internas)

## 📚 Documentação

- [Phoenix Framework](https://hexdocs.pm/phoenix)
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view)
- [Elixir](https://elixir-lang.org/docs.html)

## 🤝 Contribuindo

1. Fork o projeto
2. Crie sua feature branch (`git checkout -b feature/MinhaFeature`)
3. Commit suas mudanças (`git commit -m 'feat: Adiciona MinhaFeature'`)
4. Push para a branch (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT.
