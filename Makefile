# Terraform code directory
TF_PATH=terraform

# Terraform binary
TERRAFORM=terraform -chdir=$(TF_PATH)

.PHONY: checks
.SILENT: checks
checks: linters gitleaks tfsec

.PHONY: linters
.SILENT: linters
linters:
	docker run \
		--rm \
		--name linters \
		--env RUN_LOCAL=true \
		--volume $(shell pwd -P):/tmp/lint \
		github/super-linter

.PHONY: gitleaks
.SILENT: gitleaks
gitleaks:
	docker run \
		--rm \
		--name gitleaks \
		--env RUN_LOCAL=true \
		--volume $(shell pwd -P):/tmp \
		zricethezav/gitleaks:latest \
		--source="/tmp" \
		--verbose \
		--redact \
		detect

.PHONY: tfsec
.SILENT: tfsec
tfsec:
	tfsec $(TF_PATH)

.PHONY: fmt
fmt:
	$(TERRAFORM) fmt

.PHONY: init
init: fmt
	$(TERRAFORM) init

.PHONY: plan
plan: init
	$(TERRAFORM) plan

.PHONY: apply
apply: plan
	$(TERRAFORM) apply
