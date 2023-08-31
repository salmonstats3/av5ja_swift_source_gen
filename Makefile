.PHONY: build
build:
	act --secret-file .secrets -P ubuntu-20.04=ghcr.io/catthehacker/ubuntu:js-20.04 -j build --container-architecture linux/amd64
