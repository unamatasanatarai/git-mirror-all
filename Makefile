SHELL := /usr/bin/env bash
.DEFAULT_GOAL := backup

.PHONY: help setup backup check

backup: ## Run the backup script
	./git-mirror-all

setup: check ## Create .env file from .env.example
	@if [ ! -f .env ]; then \
		cp .env.example .env; \
		echo "Created .env from .env.example. Please edit it with your credentials."; \
	else \
		echo ".env already exists."; \
	fi

check: ## Check if required tools (curl, jq, git) are installed
	@for tool in curl jq git; do \
		if ! command -v $$tool &> /dev/null; then \
			echo "Error: $$tool is not installed."; \
			exit 1; \
		fi; \
	done
	@echo "All dependencies found."


help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'