function New-Preset {
    $UUID = New-Guid

    $presetDir = Join-Path "data" $UUID

    if (Test-Path $presetDir) {
        Write-Host "Error: Preset directory already exists" -ForegroundColor Red
        return
    }

    New-Item -ItemType Directory -Path $presetDir | Out-Null

    # Create README.md
    $readmeContent = @"
---
name: "My Preset"
installerTitle: "My Preset"
version: 1.0.0
brtxVersion: 1.3
lastUpdated: $(Get-Date -Format "yyyy-MM-dd")
author: Your Name
---

# My Preset

Add your preset description here.
"@

    $readmeContent | Out-File -FilePath (Join-Path $presetDir "README.md") -Encoding UTF8

    # Copy template files
    try {
        Copy-Item -Path "assets\template\icon.png" -Destination (Join-Path $presetDir "icon.png")
        Copy-Item -Path "assets\template\screenshot.jpg" -Destination (Join-Path $presetDir "screenshot.jpg")
        Copy-Item -Path "assets\template\settings.json" -Destination (Join-Path $presetDir "settings.json")
    }
    catch {
        Write-Host "Error: Failed to copy template files. Make sure assets directory exists with required files." -ForegroundColor Red
        return
    }

    Write-Host "`n✅ Created new preset in $presetDir" -ForegroundColor Green
    Write-Host "`nNext steps:"
    Write-Host "1. Update README.md frontmatter"
    Write-Host "2. Replace icon.png"
    Write-Host "3. Replace screenshot.jpg"
    Write-Host "4. Update your settings.json file"
}

New-Preset