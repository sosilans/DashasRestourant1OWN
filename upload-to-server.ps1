# PowerShell script to upload React build to server
$server = "143.110.155.248"
$user = "master_znmnwmhwkc"
$password = "pXhkDa6keQh7"
$localPath = "NEWDariasItalianKitchen4/assets/design/build"
$remoteBasePath = "~/applications/ygrswjnpmw/public_html"

Write-Host "Starting upload of React build to server..." -ForegroundColor Green

# Check if build directory exists
if (!(Test-Path $localPath)) {
    Write-Host "Build directory not found: $localPath" -ForegroundColor Red
    Write-Host "Please run 'npm run build' in the React project first" -ForegroundColor Yellow
    exit 1
}

Write-Host "Uploading from: $localPath" -ForegroundColor Cyan
Write-Host "Uploading to: $remoteBasePath" -ForegroundColor Cyan

# Upload files using SCP
Write-Host "UPLOADING FILES..." -ForegroundColor Yellow
Write-Host ""

# Create the upload command
$uploadCommand = "scp -r -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null `"$localPath/*`" `"${user}@${server}:${remoteBasePath}/`""

Write-Host "Executing: $uploadCommand" -ForegroundColor Gray
Write-Host ""

try {
    # Execute the SCP command
    $process = Start-Process -FilePath "cmd.exe" -ArgumentList "/c $uploadCommand" -NoNewWindow -Wait -PassThru

    if ($process.ExitCode -eq 0) {
        Write-Host ""
        Write-Host "SUCCESS! Files uploaded successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "Your site is now live at: https://your-domain.com" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "Files uploaded:" -ForegroundColor White
        Get-ChildItem $localPath -Recurse | ForEach-Object {
            $relativePath = $_.FullName.Replace((Resolve-Path $localPath).Path + "\", "")
            Write-Host "   • $relativePath" -ForegroundColor Gray
        }
    } else {
        Write-Host ""
        Write-Host "UPLOAD FAILED!" -ForegroundColor Red
        Write-Host "Exit code: $($process.ExitCode)" -ForegroundColor Red
        Write-Host ""
        Write-Host "Manual upload instructions:" -ForegroundColor Yellow
        Write-Host "1. Use FileZilla or WinSCP" -ForegroundColor White
        Write-Host "2. Server: $server" -ForegroundColor White
        Write-Host "3. User: $user" -ForegroundColor White
        Write-Host "4. Password: $password" -ForegroundColor White
        Write-Host "5. Upload from: $localPath" -ForegroundColor White
        Write-Host "6. Upload to: $remoteBasePath" -ForegroundColor White
    }
} catch {
    Write-Host ""
    Write-Host "ERROR during upload: $($_.Exception.Message)" -ForegroundColor Red
}
