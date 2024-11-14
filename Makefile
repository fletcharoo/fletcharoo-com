# Makefile

.PHONY: help up down

default: help

help: ## Show this help.
	@egrep '^(.+)\:\ .*##\ (.+)' ${MAKEFILE_LIST} | sed 's/:.*##/#/' | column -t -c 2 -s '#'

up: ## Build docker files and compose up in headless mode.
	docker compose up --build -d

down: ## Docker compose down.
	docker compose down
