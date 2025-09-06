# Test upload single file to server
$server = "143.110.155.248"
$user = "master_znmnwmhwkc"
$password = "pXhkDa6keQh7"
$localFile = "test-site.html"
$remotePath = "~/applications/ygrswjnpmw/public_html/index.html"

Write-Host "Testing upload of single file..." -ForegroundColor Green

if (!(Test-Path $localFile)) {
    Write-Host "Test file not found: $localFile" -ForegroundColor Red
    exit 1
}

Write-Host "Uploading test file to server..." -ForegroundColor Yellow

try {
    # Upload single file
    & scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null "$localFile" "${user}@${server}:${remotePath}"

    if ($LASTEXITCODE -eq 0) {
        Write-Host "SUCCESS! Test file uploaded!" -ForegroundColor Green
        Write-Host "Check: https://phpstack-1511050-5820602.cloudwaysapps.com/" -ForegroundColor Cyan
    } else {
        Write-Host "Upload failed!" -ForegroundColor Red
    }
} catch {
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}

