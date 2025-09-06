# Deploy complete React site to server
$server = "143.110.155.248"
$user = "master_znmnwmhwkc"
$password = "pXhkDa6keQh7"
$localPath = "NEWDariasItalianKitchen4/assets/design/build"
$remotePath = "~/applications/ygrswjnpmw/public_html"

Write-Host "=== DEPLOYING COMPLETE REACT SITE ===" -ForegroundColor Green
Write-Host ""

# Check if build directory exists
if (!(Test-Path $localPath)) {
    Write-Host "Build directory not found. Building React app..." -ForegroundColor Yellow
    
    # Build React app
    Set-Location "NEWDariasItalianKitchen4/assets/design"
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    & npm install
    
    Write-Host "Building React app..." -ForegroundColor Yellow
    & npm run build
    
    Set-Location "../../../"
    
    if (!(Test-Path $localPath)) {
        Write-Host "Build failed!" -ForegroundColor Red
        exit 1
    }
}

Write-Host "React build found at: $localPath" -ForegroundColor Green
Write-Host "Files to upload:" -ForegroundColor Cyan
Get-ChildItem $localPath -Recurse | ForEach-Object {
    Write-Host "  $($_.Name)" -ForegroundColor Gray
}
Write-Host ""

Write-Host "Uploading React site to server..." -ForegroundColor Yellow

try {
    # Upload all files from build directory
    & scp -r -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "$localPath/*" "${user}@${server}:${remotePath}/"

    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "SUCCESS! React site deployed!" -ForegroundColor Green
        Write-Host "Your site is now live at:" -ForegroundColor Cyan
        Write-Host "https://phpstack-1511050-5820602.cloudwaysapps.com/" -ForegroundColor White
        Write-Host ""
        Write-Host "Site features:" -ForegroundColor Yellow
        Write-Host "- Animated pizza hero section" -ForegroundColor Gray
        Write-Host "- Complete Italian menu with prices" -ForegroundColor Gray
        Write-Host "- Restaurant story and reviews" -ForegroundColor Gray
        Write-Host "- Hours and location info" -ForegroundColor Gray
        Write-Host "- Contact details and social media" -ForegroundColor Gray
    } else {
        Write-Host "Upload failed!" -ForegroundColor Red
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}

