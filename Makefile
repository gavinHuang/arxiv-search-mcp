.PHONY: help install install-dev test lint format clean build upload upload-test

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

install:  ## Install the package
	pip install -e .

install-dev:  ## Install development dependencies
	pip install -e .
	pip install -r requirements-dev.txt

test:  ## Run tests
	pytest tests/ -v

lint:  ## Run linting
	flake8 src/ tests/
	mypy src/

format:  ## Format code
	black src/ tests/

clean:  ## Clean build artifacts
	if (Test-Path build) { Remove-Item -Recurse -Force build }
	if (Test-Path dist) { Remove-Item -Recurse -Force dist }
	if (Test-Path "src/*.egg-info") { Remove-Item -Recurse -Force src/*.egg-info }
	Get-ChildItem -Path . -Recurse -Name __pycache__ | Remove-Item -Recurse -Force
	Get-ChildItem -Path . -Recurse -Name "*.pyc" | Remove-Item -Force

build:  ## Build the package
	python -m build

upload-test:  ## Upload to test PyPI
	python -m twine upload --repository testpypi dist/*

upload:  ## Upload to PyPI
	python -m twine upload dist/*

.DEFAULT_GOAL := help
