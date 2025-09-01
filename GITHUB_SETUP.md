# GitHub Repository Setup Instructions

## 🚀 Step 1: Create GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click the "+" button in the top right corner
3. Select "New repository"
4. Repository name: `dariyas-kitchen-website`
5. Description: `Modern Italian restaurant website for Dar'ya's Kitchen`
6. Make it **Public**
7. **DO NOT** initialize with README, .gitignore, or license (we already have these)
8. Click "Create repository"

## 🔑 Step 2: Add Remote and Push

After creating the repository, GitHub will show you commands. Use these:

```bash
# Add the remote (replace YOUR_USERNAME with your actual GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/dariyas-kitchen-website.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## 🔐 Step 3: Set GitHub Secrets

1. Go to your repository on GitHub
2. Click "Settings" tab
3. Click "Secrets and variables" → "Actions"
4. Add these secrets:

### CLOUDWAYS_HOST
```
143.110.155.248
```

### CLOUDWAYS_USER
```
master_znmnwmhwkc
```

### CLOUDWAYS_PASSWORD
```
pXhkDa6keQh7
```

## 🎯 Step 4: Trigger Deployment

1. After pushing, GitHub Actions will automatically run
2. Go to "Actions" tab to monitor deployment
3. The site will be deployed to: https://phpstack-1511050-5820602.cloudwaysapps.com/

## 📝 Alternative: Manual Setup

If you prefer, you can also:

1. Create the repository manually
2. Copy the remote URL
3. Run the git commands above
4. Set the secrets
5. Push to trigger deployment

## 🆘 Troubleshooting

- If you get authentication errors, make sure the secrets are correct
- If deployment fails, check the Actions logs for details
- The site should be live within 5-10 minutes after successful deployment

---

**After following these steps, your website will be automatically deployed to Cloudways!**
