#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Pinchtab Development Setup"
echo ""

# Run doctor to check prerequisites
echo "📋 Checking prerequisites..."
if ! ./doctor.sh; then
  echo ""
  echo "❌ Setup aborted. Fix critical issues above."
  exit 1
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Install git hooks
echo "📌 Installing git hooks..."
./scripts/install-hooks.sh

# Download dependencies
echo "📦 Downloading Go dependencies..."
go mod download

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  go build ./cmd/pinchtab     # Build pinchtab"
echo "  go test ./...               # Run tests"
echo "  gofmt -w .                  # Format code"
echo ""
echo "Git hooks will run automatically on commit."
echo "Run ./doctor.sh anytime to check your environment."
