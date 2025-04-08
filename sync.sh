#!/bin/bash

# A simple script to sync your forked kickstart.nvim config with the original repo

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Fetching updates from upstream...${NC}"
git fetch upstream

echo -e "${GREEN}Checking out main branch...${NC}"
git checkout main

echo -e "${GREEN}Merging upstream/main into main...${NC}"
git merge upstream/main

echo -e "${GREEN}Pushing updates to your fork (origin)...${NC}"
git push origin main

echo -e "${GREEN}✅ Sync complete.${NC}"
