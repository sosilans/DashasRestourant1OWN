#!/bin/bash

# Manual deployment script for Dar'ya's Kitchen
# This script will copy the quick-deploy.html to the server

echo "🚀 Starting manual deployment..."

# Server details (replace with your actual credentials)
SERVER_HOST="phpstack-1511050-5820602.cloudwaysapps.com"
SERVER_USER="master"
SERVER_PASS="your_password_here"
SERVER_PATH="/home/master/applications/ygrswjnpmw/public_html"

echo "📁 Copying quick-deploy.html to server..."

# Use scp to copy the file
scp quick-deploy.html $SERVER_USER@$SERVER_HOST:$SERVER_PATH/index.html

echo "✅ Deployment completed!"
echo "🌍 Site should be available at: https://$SERVER_HOST/"

