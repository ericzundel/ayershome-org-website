#!/usr/bin/env bash
# Script to execute codex

###################################
# Common preamble to setup environment
source "$(dirname "$(realpath "$0")")/common/preamble.sh" || exit 1
init_preamble

###################################
# Parse CLI flags
NO_SANDBOX_OPT=""
while [[ $# -gt 0 ]]; do
    case "$1" in
    --nosandbox)
        NO_SANDBOX_OPT="--dangerously-bypass-approvals-and-sandbox"
        shift
        ;;
    -*)
        echo "Unknown option: $1" >&2
        echo "Usage: $0 [--nosandbox]" >&2
        exit 1
        ;;
    *)
        echo "Unknown argument: $1" >&2
        echo "Usage: $0 [--nosandbox]" >&2
        exit 1
        ;;
    esac
done

codex ${NO_SANDBOX_OPT}
