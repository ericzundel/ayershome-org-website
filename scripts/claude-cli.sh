#!/usr/bin/env bash
# Script to execute the claude tool with --dangerously-skip-permissions

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
        NO_SANDBOX_OPT="--dangerously-skip-permissions"
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

claude ${NO_SANDBOX_OPT} --model sonnet
