.DEFAULT_GOAL := help

help: ## show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: run_frontend run_django run install_dependencies

run_frontend: ## run frontend application
	yarn dev

run_django: ## run backend application
	python manage.py runserver

run: ## run both backend and frontend applications
	make -j2 run_django run_frontend

install_dependencies: ## install both backend and frontend dependencies
	pip install -r requirements.txt
	yarn install
