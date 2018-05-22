BOOK_NAME := awesome-servicemesh
BOOK_OUTPUT := docs

.PHONY: install build all
install:
	npm install gitbook-cli -g
	gitbook install

build:
	gitbook build . $(BOOK_OUTPUT)
	rm docs/gitbook/images/apple-touch-icon-precomposed-152.png
	cp images/favicon.ico docs/gitbook/images

all: install build

.PHONY: serve
serve:
	gitbook serve . $(BOOK_OUTPUT)

.PHONY: epub
epub:
	gitbook epub . $(BOOK_NAME).epub

.PHONY: pdf
pdf:
	gitbook pdf . $(BOOK_NAME).pdf

.PHONY: mobi
mobi:
	gitbook mobi . $(BOOK_NAME).pdf

.PHONY: clean
clean:
	rm -rf $(BOOK_OUTPUT)

.PHONY: help
help:
	@echo "Help for make"
	@echo "make          - Build the book"
	@echo "make build    - Build the book"
	@echo "make serve    - Serving the book on localhost:4000"
	@echo "make install  - Install gitbook and plugins"
	@echo "make epub     - Build epub book"
	@echo "make pdf      - Build pdf book"
	@echo "make clean    - Remove generated files"
