#!/usr/bin/env bash
# ---------------------------------------------------------------------------
# Field Bulletin №001 — One-shot Cloudflare Pages deploy
# ---------------------------------------------------------------------------
# Requires: Node.js + npx (already on Keith's WSL2)
# First run will open a browser tab for Cloudflare OAuth — accept it once.
# Every subsequent run just deploys.
#
# Usage:
#   ./deploy.sh                  # deploy to production
#   ./deploy.sh --branch preview # deploy as a preview build
# ---------------------------------------------------------------------------

set -euo pipefail

PROJECT_NAME="field-bulletin-001"

cd "$(dirname "$0")"

echo ""
echo "→ Deploying to Cloudflare Pages: ${PROJECT_NAME}"
echo "→ Working dir: $(pwd)"
echo ""

# Pass through any extra flags (e.g. --branch preview)
npx wrangler@latest pages deploy . \
  --project-name="${PROJECT_NAME}" \
  --commit-dirty=true \
  "$@"

echo ""
echo "✓ Done. URL printed above."
echo "  → Production alias settles at: https://${PROJECT_NAME}.pages.dev"
echo ""
