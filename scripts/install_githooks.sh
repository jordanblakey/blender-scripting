#!/usr/bin/env sh
# installs githooks in .git/hooks and tests them.
# usage: ./scripts/install_githooks.sh

set -e

# install the git hooks
rsync -av ./scripts/githooks/ ./.git/hooks/
chmod +x ./.git/hooks/*
echo "Git hooks installed successfully."

# test the pre-commit hook
echo "Running pre-commit hook to verify installation..."
./.git/hooks/pre-commit