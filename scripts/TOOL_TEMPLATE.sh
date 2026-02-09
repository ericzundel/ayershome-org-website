#!/usr/bin/env bash
# Copyright 2025 Eric Z. Ayers. All rights reserved
#
# TEMPLATE: Shell wrapper for Python tools
#
# Copy this file and rename it to match your tool, e.g.:
#   cp TOOL_TEMPLATE.sh my-tool.sh
#   chmod +x my-tool.sh
#
# Then update the 'run_python_tool' line to point to your module.
#
# Convention:
#   - Shell script name: my-tool.sh (kebab-case)
#   - Python module: tools/my_tool.py (snake_case)
#   - Test file: tests/test_my_tool.py
#
# Usage:
#   ./scripts/my-tool.sh [options]
#   my-tool.sh [options]  # If scripts/ is in PATH via direnv

# Source the common preamble
source "$(dirname "$(realpath "$0")")/common/preamble.sh" || exit 1
init_preamble

# Run the Python tool, passing through all arguments
# CHANGE THIS: Replace 'your_tool_name' with your actual module name
run_python_tool your_tool_name "$@"
