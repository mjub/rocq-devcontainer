# Compile Rocq files and generate documentation with a single Make command.
#
# Usage:
#   make         - Build all and generate documentation
#   make help    - Show available targets
#   make clean   - Remove generated files

# ==============================================================================
# Configuration
# ==============================================================================

SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --no-builtin-rules

.DELETE_ON_ERROR:

# ==============================================================================
# Variables
# ==============================================================================

VFILES := $(shell find . -name '*.v')
ROCQBIN ?=

# ==============================================================================
# Phony Targets
# ==============================================================================

.PHONY: all clean help rocq-all rocq-html rocq-clean

.DEFAULT_GOAL := all

# ==============================================================================
# Main Targets
# ==============================================================================

all: rocq-all rocq-html ## Build all and generate documentation

clean: rocq-clean ## Remove all generated files
	@rm -rf CoqMakefile CoqMakefile.conf html

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?##' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

# ==============================================================================
# Rocq Build Targets
# ==============================================================================

rocq-all: CoqMakefile ## Compile all Rocq files
	@+$(MAKE) -f $< all

rocq-html: CoqMakefile ## Generate HTML documentation
	@+$(MAKE) -f $< html

rocq-clean: CoqMakefile ## Clean Rocq build artifacts
	@+$(MAKE) -f $< clean

# ==============================================================================
# Generated Makefile
# ==============================================================================

CoqMakefile: _CoqProject Makefile $(VFILES)
	@$(ROCQBIN)rocq makefile -f $< -o $@ $(shell rocq dep -sort $(VFILES))
