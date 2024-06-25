.DEFAULT_GOAL := help
.PHONY: help files packer-fmt packer-init packer-build

help:
	@echo "Usage: make [TARGET]"
	@echo "Targets:"
	@echo "files           Show files"
	@echo "packer-fmt      Packer fmt"
	@echo "packer-init     Packer init"
	@echo "packer-build    Packer build"

files:
	@find . -path './.git' -prune -o -ls > FILES

packer-fmt:
	@packer fmt .

packer-init:
	@packer init *.pkr.hcl

packer-build: packer-init
	@packer build *.pkr.hcl
