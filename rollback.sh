#!/bin/bash

# Quick Rollback Script for Dar'ya's Kitchen
# Usage: ./rollback.sh [backup_name]

set -e

echo "🔄 DAR'YA'S KITCHEN ROLLBACK SCRIPT"
echo "=================================="

# Default backup name (latest)
BACKUP_NAME=${1:-"latest"}

echo "Rolling back to: $BACKUP_NAME"
echo ""

# SSH connection details (from secrets)
SSH_HOST="143.110.155.248"
SSH_USER="silans"
SSH_PASS="GameManPlay1337!"

echo "Connecting to server..."
sshpass -p "$SSH_PASS" ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST << EOF
  # Find the correct application directory
  APP_DIR=\$(ls -d ~/applications/*/ | head -1)
  cd "\$APP_DIR"
  
  if [ "$BACKUP_NAME" = "latest" ]; then
    # Find latest backup
    LATEST_BACKUP=\$(ls -t backups/ 2>/dev/null | head -1)
    if [ -z "\$LATEST_BACKUP" ]; then
      echo "❌ No backups found!"
      exit 1
    fi
    BACKUP_NAME="\$LATEST_BACKUP"
  fi
  
  if [ ! -d "backups/\$BACKUP_NAME" ]; then
    echo "❌ Backup '\$BACKUP_NAME' not found!"
    echo "Available backups:"
    ls -la backups/ 2>/dev/null || echo "No backups directory"
    exit 1
  fi
  
  echo "📦 Restoring from backup: \$BACKUP_NAME"
  
  # Clear current deployment
  rm -rf public_html/*
  
  # Restore from backup
  cp -r "backups/\$BACKUP_NAME"/* public_html/
  
  # Set proper permissions
  chmod -R 755 public_html/
  find public_html/ -type f -exec chmod 644 {} \;
  
  echo "✅ Rollback completed!"
  echo "Files restored:"
  ls -la public_html/
  
EOF

echo ""
echo "🎉 Rollback successful!"
echo "Site should be restored to previous state."
echo ""
echo "Test the site: https://phpstack-1511050-5820602.cloudwaysapps.com/"
