.PHONY: lint
lint:
	swift package plugin --allow-writing-to-package-directory swiftformat --lint SplatNet3

.PHONY: format
format:
	swift package plugin --allow-writing-to-package-directory swiftformat --target SplatNet3 --swiftversion 5.7.1 --verbose

.PHONY: build
build:
	act --container-architecture linux/amd64 -P macos-latest=-self-hosted
