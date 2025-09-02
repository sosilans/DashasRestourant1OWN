# Simple script to push to GitHub after creating repository
param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUsername
)

Write-Host "Pushing Dar'ya's Kitchen website to GitHub..." -ForegroundColor Green
Write-Host "Username: $GitHubUsername" -ForegroundColor Cyan
Write-Host ""

$remoteUrl = "https://github.com/$GitHubUsername/dariyas-kitchen-website.git"

Write-Host "Setting remote origin..." -ForegroundColor Yellow
git remote add origin $remoteUrl

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "SUCCESS! Website pushed to GitHub!" -ForegroundColor Green
    Write-Host "Repository: https://github.com/$GitHubUsername/dariyas-kitchen-website" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Yellow
    Write-Host "1. Set up GitHub Secrets for automated deployment" -ForegroundColor White
    Write-Host "2. Enable GitHub Actions" -ForegroundColor White
    Write-Host "3. Your site will auto-deploy on every push!" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "Push failed. Check repository URL and try again." -ForegroundColor Red
}
