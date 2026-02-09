#!/usr/bin/env bash
#
# Deploy Pelican static site to InMotion hosting
#
set -euo pipefail

# Configuration
SSH_PORT=2222
SSH_USER="ayersh5"
SSH_HOST="209.182.196.189"
REMOTE_DIR="public_html"
LOCAL_OUTPUT_DIR="output"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "========================================="
echo "Pelican Site Deployment"
echo "========================================="
echo "Starting at $(date)"
echo

# Check if we're in the right directory
if [ ! -f "pelicanconf.py" ]; then
    echo "Error: pelicanconf.py not found. Please run this script from the project root."
    exit 1
fi

# Build the production site
echo -e "${GREEN}Step 1: Building production site...${NC}"
make publish

if [ ! -d "$LOCAL_OUTPUT_DIR" ]; then
    echo "Error: $LOCAL_OUTPUT_DIR directory not found after build."
    exit 1
fi

echo
echo -e "${GREEN}Step 2: Syncing to server...${NC}"
echo "Target: ${SSH_USER}@${SSH_HOST}:${REMOTE_DIR}"
echo

# Dry run first to show what will be changed
echo -e "${YELLOW}Performing dry run...${NC}"
rsync -avz --dry-run \
    -e "ssh -p ${SSH_PORT}" \
    "${LOCAL_OUTPUT_DIR}/" \
    "${SSH_USER}@${SSH_HOST}:${REMOTE_DIR}/"

echo
read -p "Proceed with actual deployment? (y/N) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled."
    exit 0
fi

# Actual deployment
echo -e "${GREEN}Deploying...${NC}"
rsync -avz \
    -e "ssh -p ${SSH_PORT}" \
    "${LOCAL_OUTPUT_DIR}/" \
    "${SSH_USER}@${SSH_HOST}:${REMOTE_DIR}/"

echo
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}Deployment complete!${NC}"
echo -e "${GREEN}=========================================${NC}"
echo "Finished at $(date)"
