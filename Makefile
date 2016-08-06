help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install deps
	bundle install
	npm install
	./node_modules/elm/binwrappers/elm-package install
	@echo 'Done! <3 <3 <3'

start: ## Start the frontend dev server
	NODE_ENV=development ./node_modules/webpack-dev-server/bin/webpack-dev-server.js --hot --inline --content-base src/, --no-info --colors

build: ## Compile the app
	rm -rf dist
	NODE_ENV=production ./node_modules/webpack/bin/webpack.js -p

.PHONY: \
	install \
	start \
	build \
	help
