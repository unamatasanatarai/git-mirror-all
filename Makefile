SHELL := /usr/bin/env bash
.DEFAULT_GOAL := backup

.PHONY: help backup check

DIR ?= ${HOME}/git-backups

backup: check ## Run the backup script (usage: make backup DIR=path)
	./git-mirror-all "$(DIR)"

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