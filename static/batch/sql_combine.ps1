
# Combine-SqlFiles.ps1
param(
    [string]$sourceFolder = "\home\teddy\Documents\Programming\Web\demo_partsERP\static\MySQL\", # "C:\Users\edwar\OneDrive\Documents\Programming\Visual Studio 2022\PARTS_Web\app\static\MySQL\",
    [string]$outputFileName = "0000_combined.sql",
    [string]$filePattern = "*.sql",
    [string[]]$excludeFiles = @("920_edit_permissions.sql", "910_anal.sql", "701_p_shop_get_many_role_permission.sql", "600_p_shop_save_product.sql", "dump.sql") # Array of filenames to exclude
)

$outputFile = Join-Path $sourceFolder $outputFileName
$outputDir = Split-Path -Parent $outputFile

# Remove output file if it exists
if (Test-Path $outputFile) {
    Remove-Item $outputFile -Force
}

# Create directory if needed
if (!(Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir
}

# Create a StringBuilder for efficiency
$output = New-Object System.Text.StringBuilder

$output.AppendLine("-- Combined SQL files")
$output.AppendLine()
$output.AppendLine("DROP DATABASE IF EXISTS demo;")
$output.AppendLine("CREATE DATABASE demo;")
$output.AppendLine("USE demo;")
$output.AppendLine()

# Process each file
Get-ChildItem -Path $sourceFolder -Filter $filePattern -File | 
    Where-Object { $_.Name -notin $excludeFiles -and $_.Name -ne $outputFileName } | 
    ForEach-Object {
        Write-Host "Processing file: $($_.Name)"
        [void]$output.AppendLine("-- File: $($_.Name)")
        # Read file content and remove BOM if present
        $content = [System.IO.File]::ReadAllBytes($_.FullName)
        if ($content[0] -eq 0xEF -and $content[1] -eq 0xBB -and $content[2] -eq 0xBF) {
            $content = $content[3..($content.Length-1)]
        }
        [void]$output.AppendLine([System.Text.Encoding]::UTF8.GetString($content))
        [void]$output.AppendLine()
    }

# Write final output
[System.IO.File]::WriteAllText($outputFile, $output.ToString(), [System.Text.UTF8Encoding]::new($false))

Write-Host "Files combined successfully into $outputFile"