TESTS = tests
BIN   = $(shell pwd)/mvb

.PHONY: test

all: test

test:
	cd $(TESTS); \
	MVB=$(BIN) ./tests.sh
