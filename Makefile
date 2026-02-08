.PHONY: install seed run test build docs

install:
	python3 -m venv .venv
	. .venv/bin/activate && pip install -r requirements.txt

seed:
	dbt seed

run:
	dbt run

test:
	dbt test

build:
	dbt build

docs:
	dbt docs generate
