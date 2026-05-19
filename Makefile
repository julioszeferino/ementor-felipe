PYTHON ?= python3
PIP ?= $(PYTHON) -m pip

.PHONY: install lint security test test-unit test-integration test-tac test-coverage terraform-fmt terraform-validate terraform-plan-ci

install:
	$(PIP) install -r requirements-dev.txt

lint:
	ruff check src tests

security:
	bandit -q -r src
	pip-audit -r requirements-dev.txt

test: test-unit test-integration test-coverage test-tac

test-unit:
	pytest -m unit --cov-fail-under=0

test-integration:
	pytest -m integration --cov-fail-under=0

test-coverage:
	pytest -m "unit or integration"

test-tac:
	pytest -m tac --cov-fail-under=0
	terraform -chdir=terraform fmt -check -recursive
	terraform -chdir=terraform init -backend=false
	terraform -chdir=terraform validate

terraform-fmt:
	terraform -chdir=terraform fmt -recursive

terraform-validate:
	terraform -chdir=terraform init -backend=false
	terraform -chdir=terraform validate

terraform-plan-ci:
	terraform -chdir=terraform init -backend=false
	terraform -chdir=terraform plan -input=false -lock=false -refresh=false \
		-var="project_name=data-platform" \
		-var="environment=production" \
		-var="aws_region=us-east-1" \
		-var="raw_bucket_name=data-platform-production-raw" \
		-var="loc_bucket_name=data-platform-production-loc" \
		-var="silver_bucket_name=data-platform-production-silver"
