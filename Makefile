.PHONY: install test lint verify examples

install:
	python -m pip install -e ".[dev]"

test:
	pytest

lint:
	ruff check .

verify: lint test

examples:
	btp-ma check --workflow requirement-analysis --request requests/examples/requirement-analysis-missing-docs.yaml || true
	btp-ma check --workflow coding --request requests/examples/coding-ready.yaml
