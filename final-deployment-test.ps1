# Final Deployment Test for Dar'ya's Kitchen
# PowerShell script to test all deployment components

Write-Host "🧪 FINAL DEPLOYMENT TEST - Dar'ya's Kitchen" -ForegroundColor Cyan
Write-Host "===============================================" -ForegroundColor Cyan
Write-Host ""

$allTestsPassed = $true

# Test 1: Check if we're in the right directory
Write-Host "📁 Test 1: Directory Structure" -ForegroundColor Yellow
if (Test-Path "ci-bootstrap") {
    Write-Host "✅ ci-bootstrap directory exists" -ForegroundColor Green
} else {
    Write-Host "❌ ci-bootstrap directory missing" -ForegroundColor Red
    $allTestsPassed = $false
}

if (Test-Path ".github") {
    Write-Host "✅ .github directory exists" -ForegroundColor Green
} else {
    Write-Host "❌ .github directory missing" -ForegroundColor Red
    $allTestsPassed = $false
}

Write-Host ""

# Test 2: Check critical files
Write-Host "📄 Test 2: Critical Files" -ForegroundColor Yellow

$criticalFiles = @(
    "ci-bootstrap\.env.example",
    "ci-bootstrap\deploy.sh", 
    "ci-bootstrap\deploy-enhanced.sh",
    ".github\workflows\deploy.yml",
    ".github\workflows\bootstrap-laravel.yml",
    "README_DEPLOY.md"
)

foreach ($file in $criticalFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file exists" -ForegroundColor Green
    } else {
        Write-Host "❌ $file missing" -ForegroundColor Red
        $allTestsPassed = $false
    }
}

Write-Host ""

# Test 3: Check .env.example content
Write-Host "⚙️ Test 3: .env.example Configuration" -ForegroundColor Yellow
$envContent = Get-Content "ci-bootstrap\.env.example" -Raw
if ($envContent -match "APP_NAME.*Dar.*ya.*s Kitchen") {
    Write-Host "✅ APP_NAME configured correctly" -ForegroundColor Green
} else {
    Write-Host "❌ APP_NAME not configured" -ForegroundColor Red
    $allTestsPassed = $false
}

if ($envContent -match "DB_CONNECTION=mysql") {
    Write-Host "✅ Database connection configured" -ForegroundColor Green
} else {
    Write-Host "❌ Database connection not configured" -ForegroundColor Red
    $allTestsPassed = $false
}

Write-Host ""

# Test 4: Check deploy script improvements
Write-Host "🚀 Test 4: Deploy Script Improvements" -ForegroundColor Yellow
$deployContent = Get-Content "ci-bootstrap\deploy.sh" -Raw
if ($deployContent -match "power_site.*not found") {
    Write-Host "✅ Laravel app creation logic added" -ForegroundColor Green
} else {
    Write-Host "❌ Laravel app creation logic missing" -ForegroundColor Red
    $allTestsPassed = $false
}

Write-Host ""

# Test 5: Check GitHub Actions improvements
Write-Host "🔄 Test 5: GitHub Actions Improvements" -ForegroundColor Yellow
$deployYml = Get-Content ".github\workflows\deploy.yml" -Raw
if ($deployYml -match "Health Check") {
    Write-Host "✅ Health check added to deploy workflow" -ForegroundColor Green
} else {
    Write-Host "❌ Health check missing from deploy workflow" -ForegroundColor Red
    $allTestsPassed = $false
}

if ($deployYml -match "Starting deployment") {
    Write-Host "✅ Enhanced logging added" -ForegroundColor Green
} else {
    Write-Host "❌ Enhanced logging missing" -ForegroundColor Red
    $allTestsPassed = $false
}

Write-Host ""

# Test 6: Check bootstrap workflow fix
Write-Host "🔧 Test 6: Bootstrap Workflow Fix" -ForegroundColor Yellow
$bootstrapYml = Get-Content ".github\workflows\bootstrap-laravel.yml" -Raw
if ($bootstrapYml -match "git push origin HEAD.*\n.*- name:") {
    Write-Host "✅ Bootstrap workflow syntax fixed" -ForegroundColor Green
} else {
    Write-Host "❌ Bootstrap workflow syntax still broken" -ForegroundColor Red
    $allTestsPassed = $false
}

Write-Host ""

# Test 7: Check documentation
Write-Host "📚 Test 7: Documentation" -ForegroundColor Yellow
$readmeContent = Get-Content "README_DEPLOY.md" -Raw
if ($readmeContent -match "Quick Deploy") {
    Write-Host "✅ Deployment documentation exists" -ForegroundColor Green
} else {
    Write-Host "❌ Deployment documentation missing" -ForegroundColor Red
    $allTestsPassed = $false
}

if ($readmeContent -match "Troubleshooting") {
    Write-Host "✅ Troubleshooting guide included" -ForegroundColor Green
} else {
    Write-Host "❌ Troubleshooting guide missing" -ForegroundColor Red
    $allTestsPassed = $false
}

Write-Host ""

# Final Results
Write-Host "🎯 FINAL RESULTS" -ForegroundColor Cyan
Write-Host "===============" -ForegroundColor Cyan

if ($allTestsPassed) {
    Write-Host "🎉 ALL TESTS PASSED! Deployment system is ready!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next Steps:" -ForegroundColor Yellow
    Write-Host "1. Push changes to GitHub repository" -ForegroundColor White
    Write-Host "2. Configure GitHub Secrets:" -ForegroundColor White
    Write-Host "   - CLOUDWAYS_SSH_HOST: 143.110.155.248" -ForegroundColor Gray
    Write-Host "   - CLOUDWAYS_SSH_USER: master" -ForegroundColor Gray
    Write-Host "   - CLOUDWAYS_SSH_KEY or CLOUDWAYS_SSH_PASS" -ForegroundColor Gray
    Write-Host "   - CLOUDWAYS_APP_DIR: ~/applications/ygrswjnpmw/public_html" -ForegroundColor Gray
    Write-Host "   - SERVER_ENV: Complete .env file contents" -ForegroundColor Gray
    Write-Host "3. Run 'Bootstrap Laravel' workflow first" -ForegroundColor White
    Write-Host "4. Then run 'Deploy to Cloudways' workflow" -ForegroundColor White
    Write-Host "5. Monitor deployment in GitHub Actions" -ForegroundColor White
} else {
    Write-Host "❌ SOME TESTS FAILED! Please fix issues before deployment." -ForegroundColor Red
}

Write-Host ""
Write-Host "Test completed at: $(Get-Date)" -ForegroundColor Gray
