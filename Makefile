LIBRARIES = \
	github.com/meatballhat/goaspen
TARGETS = \
	$(LIBRARIES) \
	github.com/meatballhat/goaspen/goaspen-build

test: build
	go test -x -v $(GOFLAGS) $(LIBRARIES)

build: deps
	go install -x $(GOFLAGS) $(TARGETS)

deps:
	go get -n -x $(GOFLAGS) $(TARGETS)

clean:
	go clean -x -i $(TARGETS)

smoke: test
	$(MAKE) -C examples/smoke-test-site clean prep smoke

.PHONY: test build deps clean smoke
