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
name: "Vibrant"
installerTitle: "Better RTX 1.3 : Vibrant preset"
version: 1.0.0
brtxVersion: 1.3
lastUpdated: 2025-04-25
author: K3013
hash: [Optional settings hash from Creator output]
rtxStub: [RTXStub.material.bin URL]
rtxChecksum: [SHA-256 file chucksum]
toneMappingStub: [RTXPostFXTonemapping.material.bin URL]
toneMappingChecksum: [SHA-256 file chucksum]
bloomStub: [RTXPostFX.Bloom.material.bin URL]
bloomChecksum: [SHA-256 file chucksum]
---

# My Preset

This is a recreation of vibrant visuals for RTX
- Improved Shadows
- Emissive Entities ( Like EVERY Better RTX preset )
- A little Chromatic Aberation
- Dynamic lights
- BIG waves on water
- AGX Golden Tonemapping
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
