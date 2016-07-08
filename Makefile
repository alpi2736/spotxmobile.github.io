SHELL = /bin/bash

setup:
	pip install mkdocs

clean:
	@rm -rf site

build:
	mkdocs build --clean

serve: clean
	mkdocs serve

deploy: clean
	mkdocs gh-deploy

.PHONY: setup clean build serve deploy