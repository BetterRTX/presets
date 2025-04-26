# BetterRTX Presets

## Generate a Preset

Preset settings can be generated using the [BetterRTX Creator](https://bedrock.graphics/creator) tool. Download and test the `.rtpack` output to find your desired settings.

After modifying the settings, go to the _Setup_ tab and click the _Save File_ button. This will create a `settings.json` file to download.

### JSON Schema

The settings file can also be manually adjusted in a JSON file editor, such as VS Code. Use the following schema URL in the file to enable auto-completion:

```json
{
    "$schema": "https://bedrock.graphics/creator/schema"
}
```

## Clone the Repository

Clone this repo to begin adding your preset. Run the [New-Preset.ps1](./New-Preset.ps1) script with PowerShell.

```powershell
.\New-Preset.ps1
```

This will create a placeholder directory for your preset.

Save the preset settings in `./data/[Your UUID]/settings.json`

### Write a README

Add the file `./presets/[Your UUID]/README.md|mdx` to have a Markdown / MDX document loaded on the preset page.

#### Add Frontmatter to the README

Your README's Frontmatter serves as the single-source-of-truth for the preset throughout the website and API.

Example:

```yaml
---
name: "Website Friendly Title"
installerTitle: "The Text Displayed in the Installer"
version: 1.0.0
brtxVersion: 1.3
lastUpdated: 2025-02-14
author: Not Mojang
hash: [Optional settings hash from Creator output]
rtxStub: [RTXStub.material.bin URL]
rtxChecksum: [SHA-256 file chucksum]
toneMappingStub: [RTXPostFXTonemapping.material.bin URL]
toneMappingChecksum: [SHA-256 file chucksum]
bloomStub: [RTXPostFX.Bloom.material.bin URL]
bloomChecksum: [SHA-256 file chucksum]
---
```

- Checksum values are required when providing external URLs. (i.e. Anything not hosted on `cdn.bedrock.graphics`)
- URLs are not required if a settings `hash` property is provided.

## Create PR

Commit the changes and create a pull request to add the new preset.

## Wait for Approval

Once reviewed and merged, the preset data will be pushed to [bedrock.graphics](https://bedrock.graphics "BetterRTX official website").

## Create a Discord Post

Copy the preset link from https://bedrock.graphics/presets

Include it in a post to [Minecraft RTX Discord BetterRTX Release channel](https://discord.com/channels/691547840463241267/1106805217229541457).

(The `screenshot.png` and `icon.png` files are used as the Discord post image if no other media is provided.)
