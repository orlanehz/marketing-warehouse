VENV_BIN := .venv/bin
DBT := $(VENV_BIN)/dbt

.PHONY: install check-dbt deps seed run snapshot test build docs daily

install:
	python3 -m venv .venv
	. .venv/bin/activate && pip install -r requirements.txt

check-dbt:
	@if [ ! -x "$(DBT)" ]; then \
		echo "Error: $(DBT) not found. Run 'make install' first."; \
		exit 1; \
	fi

deps: check-dbt
	$(DBT) deps

seed: check-dbt
	$(DBT) seed

run: check-dbt
	$(DBT) run

snapshot: check-dbt
	$(DBT) snapshot

test: check-dbt
	$(DBT) test

build: check-dbt
	$(DBT) build

docs: check-dbt
	$(DBT) docs generate

daily: deps build snapshot
