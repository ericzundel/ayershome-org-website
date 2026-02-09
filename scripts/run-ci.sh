#!/usr/bin/env bash
# Copyright 2025 Eric Z. Ayers. All rights reserved
#
# CI script - runs all checks that would run in CI pipeline
#
# Usage:
#   ./scripts/run-ci.sh

source "$(dirname "$(realpath "$0")")/common/preamble.sh" || exit 1
init_preamble

echo "Running CI checks..."
echo ""

# Track failures
FAILED=0

# Terraform format check (only main terraform dir, not reference files)
echo "--- Terraform Format ---"
if command -v terraform &>/dev/null; then
    if terraform fmt -check -recursive infra/ 2>/dev/null; then
        echo "PASS: Terraform formatting OK"
    else
        echo "FAIL: Terraform formatting issues found"
        FAILED=1
    fi
else
    echo "SKIP: Terraform not installed"
fi
echo ""

# Terraform validate
echo "--- Terraform Validate ---"
if command -v terraform &>/dev/null; then
    if (cd infra/environments/dev && terraform validate 2>/dev/null); then
        echo "PASS: Terraform validation OK"
    else
        echo "FAIL: Terraform validation failed"
        FAILED=1
    fi
else
    echo "SKIP: Terraform not installed"
fi
echo ""

# GitHub Actions lint
echo "--- GitHub Actions Lint ---"
if command -v actionlint &>/dev/null; then
    if [ -d ".github/workflows" ]; then
        if actionlint; then
            echo "PASS: GitHub Actions lint OK"
        else
            echo "FAIL: GitHub Actions lint found issues"
            FAILED=1
        fi
    else
        echo "SKIP: No .github/workflows directory"
    fi
else
    echo "SKIP: actionlint not installed (install: go install github.com/rhysd/actionlint/cmd/actionlint@latest)"
fi
echo ""

# Python linting (ruff)
echo "--- Python Lint (ruff) ---"
if uv run ruff check tools/ tests/; then
    echo "PASS: Ruff check OK"
else
    echo "FAIL: Ruff found issues"
    FAILED=1
fi
echo ""

# Python formatting check (ruff)
echo "--- Python Format (ruff) ---"
if uv run ruff format --check tools/ tests/; then
    echo "PASS: Ruff format OK"
else
    echo "FAIL: Ruff format issues found"
    FAILED=1
fi
echo ""

# Type checking (mypy)
echo "--- Type Check (mypy) ---"
if uv run mypy tools/ tests/; then
    echo "PASS: Mypy OK"
else
    echo "FAIL: Mypy found type errors"
    FAILED=1
fi
echo ""

# Type checking (pyright)
echo "--- Type Check (pyright) ---"
if uv run pyright tools/ tests/; then
    echo "PASS: Pyright OK"
else
    echo "FAIL: Pyright found type errors"
    FAILED=1
fi
echo ""

# Tests (pytest)
echo "--- Tests (pytest) ---"
if uv run pytest --tb=short -q; then
    echo "PASS: Tests passed"
else
    echo "FAIL: Tests failed"
    FAILED=1
fi
echo ""

# Summary
echo "------------------------"
if [ $FAILED -eq 0 ]; then
    echo "PASS: All CI checks passed!"
    exit 0
else
    echo "FAIL: Some CI checks failed"
    exit 1
fi
