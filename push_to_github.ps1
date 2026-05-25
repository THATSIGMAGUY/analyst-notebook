# push_to_github.ps1 — push analyst-notebook.html → GitHub Pages
# วิธีใช้:
#   1. เปิด PowerShell
#   2. cd "C:\Users\0123\OneDrive\Documents\Claude\Projects\Analyst's Notebook"
#   3. .\push_to_github.ps1
#   (หรือ paste คำสั่งทีละบรรทัดด้านล่าง)

$projectPath = "C:\Users\0123\OneDrive\Documents\Claude\Projects\Analyst's Notebook"
Set-Location $projectPath

# ตั้งค่า git identity (รันครั้งแรกเท่านั้น)
git config user.email "devil.of.85@gmail.com"
git config user.name "THATSIGMAGUY"

# Stage เฉพาะ analyst-notebook.html
git add analyst-notebook.html

# Commit
git commit -m "feat: v3.6.0 - seed-suspect flow, JPG import, v3.5.2 Triple extraction, v3.5.9 portrait"

# Push (ใส่ PAT ใหม่ที่ต้องสร้างที่ https://github.com/settings/tokens)
# แทนที่ YOUR_PAT_HERE ด้วย token จริง (scope: repo)
git push https://THATSIGMAGUY:YOUR_PAT_HERE@github.com/THATSIGMAGUY/analyst-notebook.git main

Write-Host "✅ Push สำเร็จ — รอ 2-3 นาทีแล้วเปิด:"
Write-Host "   https://thatsigmaguy.github.io/analyst-notebook/analyst-notebook.html"
