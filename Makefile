.PHONY: lint
lint:
	swift run swiftlint lint --fix --strict

.PHONY: format
format:
	swift package plugin --allow-writing-to-package-directory swiftformat --target SplatNet3 --swiftversion 5.6 --verbose

.PHONY: build
build:
	act --container-architecture linux/amd64 -P macos-latest=-self-hosted
