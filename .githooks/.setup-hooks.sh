#!/bin/bash

HOOK_SOURCE=".githooks/pre-push"
HOOK_DEST=".git/hooks/pre-push"

echo "Setting up Git hooks..."

# Check if source exists
if [ ! -f "$HOOK_SOURCE" ]; then
    echo "Hook source not found: $HOOK_SOURCE"
    exit 1
fi

# Copy or symlink the pre-push hook
cp "$HOOK_SOURCE" "$HOOK_DEST"
chmod +x "$HOOK_DEST"

echo "✅ Git hook installed: $HOOK_DEST"