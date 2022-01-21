.PHONY: help
help: ## Show the help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: it
it: build build-tests ## Initialize the development environment

GOLANG_VERSION=1.17
APP_NAME=ghostscript
APP_VERSION=v1.0.0
APP_AUTHOR=Vrex141
APP_REPOSITORY=https://github.com/Vrex123/gotenberg-ghostscript
DOCKER_REPOSITORY=vrex141
GOLANGCI_LINT_VERSION=v1.42.0 # See https://github.com/golangci/golangci-lint/releases.
GHOSTSCRIPT_VERSION=9.55.0-linux-x86_64 # See https://github.com/ArtifexSoftware/ghostpdl-downloads/releases

.PHONY: build
build: ## Build the Gotenberg's Docker image
	docker build \
	--build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
	--build-arg APP_NAME=$(APP_NAME) \
	--build-arg APP_VERSION=$(APP_VERSION) \
	--build-arg APP_AUTHOR=$(APP_AUTHOR) \
	--build-arg APP_REPOSITORY=$(APP_REPOSITORY) \
	--build-arg GHOSTSCRIPT_VERSION=$(GHOSTSCRIPT_VERSION) \
	-t $(DOCKER_REPOSITORY)/gotenberg:7.4.2-$(APP_NAME)-$(APP_VERSION) \
	-f build/Dockerfile .

.PHONY: build-tests
build-tests: ## Build the tests' Docker image
	docker build \
	--build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
	--build-arg DOCKER_REPOSITORY=$(DOCKER_REPOSITORY) \
	--build-arg APP_NAME=$(APP_NAME) \
	--build-arg APP_VERSION=$(APP_VERSION) \
	--build-arg GOLANGCI_LINT_VERSION=$(GOLANGCI_LINT_VERSION) \
	-t $(DOCKER_REPOSITORY)/gotenberg:7-$(APP_NAME)-$(APP_VERSION)-tests \
	-f test/Dockerfile .

.PHONY: tests
tests: ## Start the testing environment
	docker run --rm -it \
	-v $(PWD):/tests \
	$(DOCKER_REPOSITORY)/gotenberg:7-$(APP_NAME)-$(APP_VERSION)-tests \
	bash

.PHONY: tests-once
tests-once: ## Run the tests once (prefer the "tests" command while developing)
	docker run --rm  \
	-v $(PWD):/tests \
	$(DOCKER_REPOSITORY)/gotenberg:7-$(APP_NAME)-$(APP_VERSION)-tests \
	gotest

.PHONY: fmt
fmt: ## Format the code and "optimize" the dependencies
	go fmt ./...
	go mod tidy
