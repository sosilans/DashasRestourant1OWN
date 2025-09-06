# Deploy new frontend template to Dar'ya's Kitchen
# SECURITY: Use environment variables or SSH keys instead of hardcoded passwords
$server = $env:CLOUDWAYS_SERVER ?? "143.110.155.248"
$user = $env:CLOUDWAYS_USER ?? "master_znmnwmhwkc"
$sshKey = $env:CLOUDWAYS_SSH_KEY ?? "~/.ssh/cloudways_deploy_key"
$localPath = "NEW_FRONTEND"
$remotePath = "~/applications/ygrswjnpmw/public_html"

# Check if SSH key exists
if (!(Test-Path $sshKey)) {
    Write-Host "SSH key not found at: $sshKey" -ForegroundColor Red
    Write-Host "Please set CLOUDWAYS_SSH_KEY environment variable or create SSH key" -ForegroundColor Yellow
    Write-Host "See SSH_SETUP_INSTRUCTIONS.md for details" -ForegroundColor Gray
    exit 1
}

Write-Host "=== DEPLOYING NEW FRONTEND TEMPLATE ===" -ForegroundColor Green
Write-Host ""

# Check if NEW_FRONTEND has files
if (!(Test-Path "$localPath/index.html")) {
    Write-Host "No index.html found in NEW_FRONTEND directory!" -ForegroundColor Red
    Write-Host "Please add your new template files to NEW_FRONTEND/ first:" -ForegroundColor Yellow
    Write-Host "  - index.html" -ForegroundColor Gray
    Write-Host "  - css/" -ForegroundColor Gray  
    Write-Host "  - js/" -ForegroundColor Gray
    Write-Host "  - assets/" -ForegroundColor Gray
    exit 1
}

Write-Host "Found new frontend files:" -ForegroundColor Green
Get-ChildItem $localPath -Recurse -File | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "deploy-new-frontend.ps1" } | ForEach-Object {
    $relativePath = $_.FullName.Replace((Resolve-Path $localPath).Path + "\", "")
    Write-Host "  $relativePath" -ForegroundColor Gray
}
Write-Host ""

Write-Host "Uploading new frontend to server..." -ForegroundColor Yellow

try {
    # Upload all files except README and this script
    Get-ChildItem $localPath -File | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "deploy-new-frontend.ps1" } | ForEach-Object {
        Write-Host "Uploading: $($_.Name)" -ForegroundColor Cyan
        & scp -i $sshKey -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $_.FullName "${user}@${server}:${remotePath}/"
    }
    
    # Upload directories
    Get-ChildItem $localPath -Directory | ForEach-Object {
        Write-Host "Uploading directory: $($_.Name)" -ForegroundColor Cyan
        & scp -i $sshKey -r -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $_.FullName "${user}@${server}:${remotePath}/"
    }

    Write-Host ""
    Write-Host "SUCCESS! New frontend deployed!" -ForegroundColor Green
    Write-Host "Your site is now live at:" -ForegroundColor Cyan
    Write-Host "https://phpstack-1511050-5820602.cloudwaysapps.com/" -ForegroundColor White
    Write-Host ""
    Write-Host "Backend API available at:" -ForegroundColor Yellow
    Write-Host "  /api/menu - menu items" -ForegroundColor Gray
    Write-Host "  /api/reviews - customer reviews" -ForegroundColor Gray
    Write-Host "  /api/hours - business hours" -ForegroundColor Gray
    Write-Host "  /admin - admin panel" -ForegroundColor Gray
    
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}


