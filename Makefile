.PHONY: lint
lint:
	swiftlint lint --fix --strict

.PHONY: build
build:
	act --container-architecture linux/amd64 -P macos-latest=-self-hosted