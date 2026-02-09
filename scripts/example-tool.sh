#!/usr/bin/env bash
# Copyright 2025 Eric Z. Ayers. All rights reserved
#
# Shell wrapper for the example_tool Python module.
#
# This demonstrates the pattern for wrapping Python tools:
# 1. Source the preamble to set up the environment
# 2. Use run_python_tool to execute the Python module
#
# Usage:
#   ./scripts/example-tool.sh [options]
#   example-tool.sh [options]  # If scripts/ is in PATH via direnv

# Source the common preamble
source "$(dirname "$(realpath "$0")")/common/preamble.sh" || exit 1
init_preamble

# Run the Python tool, passing through all arguments
run_python_tool example_tool "$@"
