#!/bin/bash
set -euo pipefail

echo "💾 BACKUP: Creating backup of working deployment..."
echo "=================================================="

# Show current location
echo "📍 Current directory: $(pwd)"
echo "👤 User: $(whoami)"
echo "📅 Time: $(date)"

# Create backup directory with timestamp
BACKUP_DIR="backup-$(date +%Y%m%d-%H%M%S)"
echo "📁 Creating backup directory: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Backup current deployment scripts
echo "📋 Backing up deployment scripts..."
cp -r ci-bootstrap/*.sh "$BACKUP_DIR/" 2>/dev/null || echo "⚠️ Some scripts not found"

# Backup current public_html if it exists
if [ -d "public_html" ]; then
    echo "📁 Backing up public_html..."
    cp -r public_html "$BACKUP_DIR/"
    echo "✅ public_html backed up"
else
    echo "⚠️ public_html not found for backup"
fi

# Backup improved-template if it exists
if [ -d "improved-template" ]; then
    echo "📁 Backing up improved-template..."
    cp -r improved-template "$BACKUP_DIR/"
    echo "✅ improved-template backed up"
else
    echo "⚠️ improved-template not found for backup"
fi

# Backup GitHub workflow
if [ -d ".github/workflows" ]; then
    echo "📁 Backing up GitHub workflows..."
    cp -r .github "$BACKUP_DIR/"
    echo "✅ GitHub workflows backed up"
else
    echo "⚠️ GitHub workflows not found for backup"
fi

# Show backup contents
echo "📋 Backup contents:"
ls -la "$BACKUP_DIR/"

echo ""
echo "💾 BACKUP COMPLETED: $BACKUP_DIR"
echo "================================"
echo "Time: $(date)"
