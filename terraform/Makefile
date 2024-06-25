.DEFAULT_GOAL := help
.PHONY: help files docs fmt init refresh plan apply destroy tfclean check-env

# Determine the environment variable for tfvars file
TFVARS := $(TF_VAR_CI_ENVIRONMENT_NAME).tfvars

check-env:
ifndef TF_VAR_CI_ENVIRONMENT_NAME
	$(error TF_VAR_CI_ENVIRONMENT_NAME is not set. It is required.)
endif
ifndef TF_VAR_CF_CLOUDFLARED_TOKEN
	$(error TF_VAR_CF_CLOUDFLARED_TOKEN is not set. It is required.)
endif

help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "files           Show files"
	@echo "docs            Generate terraform docs"
	@echo "fmt             Format terraform files"
	@echo "init            Initialize terraform"
	@echo "refresh         Refresh terraform"
	@echo "plan            Plan terraform"
	@echo "apply           Apply terraform"
	@echo "destroy         Destroy terraform"
	@echo "tfclean         Clean cache files"

files:
	@find . -path './.git' -prune -o -ls > FILES

docs:
	@for dir in ./modules/*/; do \
	terraform-docs markdown $$dir > $$dir/README.md; \
	done

fmt:
	@terragrunt fmt -recursive .

init: check-env
	@echo "Using tfvars file: $(TFVARS)"
	@terragrunt run-all init --var-file=$(TFVARS)

refresh: init
	@terragrunt run-all refresh --var-file=$(TFVARS)

plan: init
	@terragrunt run-all plan --var-file=$(TFVARS)

apply: init
	@terragrunt run-all apply --var-file=$(TFVARS)

destroy: init
	@terragrunt run-all destroy --var-file=$(TFVARS)

tfclean:
	@find . -type d -name '.terraform' -exec rm -rf {} +
	@find . -type f -name '.terraform.lock.hcl' -exec rm -rf {} +
	@find . -type d -name '.terragrunt-cache' -exec rm -rf {} +
	@find . -type f -name 'remote_state.tf' -exec rm -rf {} +
