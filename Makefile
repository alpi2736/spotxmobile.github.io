SHELL = /bin/bash

setup:
	pip install mkdocs
	pip install mkdocs-material

clean:
	@rm -rf site dist

build:
	mkdocs build --clean

serve: clean
	mkdocs serve

deploy: clean
	mkdocs gh-deploy --remote-branch master

.PHONY: setup clean build serve deploy