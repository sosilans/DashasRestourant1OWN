# Script to setup GitHub repository for Dar'ya's Kitchen website

Write-Host "=== SETUP GITHUB REPOSITORY FOR DAR'YA'S KITCHEN ===" -ForegroundColor Green
Write-Host ""

Write-Host "Step 1: Create repository on GitHub" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "1. Go to: https://github.com/new" -ForegroundColor Cyan
Write-Host "2. Repository name: dariyas-kitchen-website" -ForegroundColor White
Write-Host "3. Description: Complete React website for Dar'ya's Italian Kitchen restaurant" -ForegroundColor White
Write-Host "4. Make it PUBLIC" -ForegroundColor White
Write-Host "5. DO NOT add README, .gitignore, or license" -ForegroundColor White
Write-Host ""

Write-Host "Step 2: After creating repository, GitHub will show you these commands:" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "git remote add origin https://github.com/YOUR_USERNAME/dariyas-kitchen-website.git" -ForegroundColor Cyan
Write-Host "git branch -M main" -ForegroundColor Cyan
Write-Host "git push -u origin main" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 3: Replace YOUR_USERNAME with your actual GitHub username" -ForegroundColor Yellow
Write-Host "----------------------------------------" -ForegroundColor Yellow
Write-Host "Example: https://github.com/johndoe/dariyas-kitchen-website.git" -ForegroundColor Gray
Write-Host ""

Write-Host "Ready to continue? Press Enter after creating the repository..." -ForegroundColor Green
Read-Host

Write-Host ""
Write-Host "Enter your GitHub username:" -ForegroundColor Yellow
$username = Read-Host

$remoteUrl = "https://github.com/$username/dariyas-kitchen-website.git"

Write-Host ""
Write-Host "Setting up remote repository..." -ForegroundColor Yellow
git remote add origin $remoteUrl

Write-Host "Switching to main branch..." -ForegroundColor Yellow
git branch -M main

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "SUCCESS! Repository pushed to GitHub!" -ForegroundColor Green
Write-Host "Repository URL: $remoteUrl" -ForegroundColor Cyan
