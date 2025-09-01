#!/bin/bash

# Test deployment script for Dar'ya's Kitchen
# This script tests the deployment process locally

set -e

echo "🧪 Testing deployment process..."

# Check if we're in the right directory
if [ ! -f "ci-bootstrap/deploy.sh" ]; then
    echo "❌ Not in the right directory. Please run from project root."
    exit 1
fi

echo "✅ Found deployment scripts"

# Check if .env.example exists
if [ -f "ci-bootstrap/.env.example" ]; then
    echo "✅ .env.example exists"
else
    echo "❌ .env.example missing"
    exit 1
fi

# Check if enhanced deploy script exists
if [ -f "ci-bootstrap/deploy-enhanced.sh" ]; then
    echo "✅ Enhanced deploy script exists"
else
    echo "❌ Enhanced deploy script missing"
    exit 1
fi

# Check if GitHub workflows exist
if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ Deploy workflow exists"
else
    echo "❌ Deploy workflow missing"
    exit 1
fi

if [ -f ".github/workflows/bootstrap-laravel.yml" ]; then
    echo "✅ Bootstrap workflow exists"
else
    echo "❌ Bootstrap workflow missing"
    exit 1
fi

# Check if README_DEPLOY.md exists
if [ -f "README_DEPLOY.md" ]; then
    echo "✅ Deployment documentation exists"
else
    echo "❌ Deployment documentation missing"
    exit 1
fi

echo ""
echo "🎉 All deployment components are in place!"
echo ""
echo "Next steps:"
echo "1. Push changes to GitHub"
echo "2. Run 'Bootstrap Laravel' workflow first"
echo "3. Then run 'Deploy to Cloudways' workflow"
echo "4. Check deployment logs in GitHub Actions"
echo ""
echo "For manual deployment:"
echo "1. SSH to server: ssh master@143.110.155.248"
echo "2. Run: cd ~/applications/ygrswjnpmw"
echo "3. Run: ./ci-bootstrap/deploy-enhanced.sh"
