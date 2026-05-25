# ============================================================
# thai-police-analyst-notebook — GitHub setup script
# รันใน PowerShell จาก folder โปรเจกต์
# ============================================================

$repoName = "thai-police-analyst-notebook"
$projectPath = "$env:USERPROFILE\OneDrive\Documents\Claude\Projects\Analyst's Notebook"

Write-Host "=== Moving to project folder ===" -ForegroundColor Cyan
Set-Location $projectPath

# ---- Step 1: Git init ----
Write-Host "`n[1/5] Initializing git repo..." -ForegroundColor Yellow
git init
git branch -M main

# ---- Step 2: Config (ถ้ายังไม่เคย config global) ----
Write-Host "`n[2/5] Setting git identity..." -ForegroundColor Yellow
git config user.email "devil.of.85@gmail.com"
git config user.name "Champ"

# ---- Step 3: Stage files ----
Write-Host "`n[3/5] Staging files..." -ForegroundColor Yellow
git add analyst-notebook.html
git add README.md
git add .gitignore
git status

# ---- Step 4: Initial commit ----
Write-Host "`n[4/5] Creating initial commit..." -ForegroundColor Yellow
git commit -m "feat: initial release v3.5.8

- IBM i2 Analyst's Notebook compatible link analysis tool
- Single HTML file, runs offline via file://
- Case Methodology Guide (narcotics / money laundering / human trafficking / cybercrime / immigration)
- Community detection, centrality analysis, co-travel pattern analysis
- AI-assisted document extraction"

# ---- Step 5: Create GitHub repo + push ----
Write-Host "`n[5/5] Creating GitHub repo and pushing..." -ForegroundColor Yellow

# ตรวจว่ามี gh CLI หรือไม่
if (Get-Command gh -ErrorAction SilentlyContinue) {
    Write-Host "  gh CLI found — creating private repo automatically..." -ForegroundColor Green
    gh repo create $repoName --private --source=. --remote=origin --push
    Write-Host "`nDone! Repo URL:" -ForegroundColor Green
    gh repo view --web
} else {
    Write-Host "  gh CLI not found — please:" -ForegroundColor Red
    Write-Host "  1. Go to https://github.com/new" -ForegroundColor White
    Write-Host "  2. Create a new PRIVATE repo named: $repoName" -ForegroundColor White
    Write-Host "  3. Do NOT initialize with README (we already have one)" -ForegroundColor White
    Write-Host "  4. Copy the repo URL (e.g. https://github.com/YOUR_USERNAME/$repoName.git)" -ForegroundColor White
    Write-Host "  5. Run these commands:" -ForegroundColor White
    Write-Host ""
    Write-Host "     git remote add origin https://github.com/YOUR_USERNAME/$repoName.git" -ForegroundColor Cyan
    Write-Host "     git push -u origin main" -ForegroundColor Cyan
}
