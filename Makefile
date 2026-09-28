APP_NAME=pathsize
BIN=bin/${APP_NAME}

.PHONY: build run test

build:
	mkdir -p bin
	go build -o ${BIN} ./cmd/${APP_NAME}

run:
	./${BIN} $(ARGS)

test:
	go test -v ./...
