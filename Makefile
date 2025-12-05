.PHONY: help setup up down logs shell test format clean rebuild migrate

help: ## Mostra esta mensagem de ajuda
	@echo "Comandos disponíveis:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

setup: ## Setup inicial do projeto
	docker compose up -d
	@echo "✅ Projeto iniciado em http://localhost:4008"

up: ## Inicia os containers
	docker compose up

upd: ## Inicia os containers em background
	docker compose up -d

down: ## Para os containers
	docker compose down

logs: ## Exibe logs do container web
	docker compose logs -f web

shell: ## Abre um shell no container
	docker compose exec web sh

iex: ## Abre IEx no container
	docker compose exec web iex -S mix

test: ## Roda os testes
	docker compose exec web mix test

format: ## Formata o código
	docker compose exec web mix format

precommit: ## Roda verificações pre-commit
	docker compose exec web mix precommit

clean: ## Remove containers e volumes
	docker compose down -v

rebuild: ## Rebuilda as imagens do zero
	docker compose down
	docker compose build --no-cache
	docker compose up -d

migrate: ## Roda migrations
	docker compose exec web mix ecto.migrate

rollback: ## Reverte última migration
	docker compose exec web mix ecto.rollback

reset: ## Reseta o banco de dados
	docker compose exec web mix ecto.reset

psql: ## Abre psql no banco
	docker compose exec db psql -U postgres -d lpc_dev

status: ## Mostra status dos containers
	docker compose ps

