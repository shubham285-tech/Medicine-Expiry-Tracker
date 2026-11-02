Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$source = "TanviProjectDoc.docx"
$target = "Medical_Expiry_Tracker_Documentation.docx"
$xmlFile = "new_document.xml"

Write-Host "Copying $source to $target..."
Copy-Item -Path $source -Destination $target -Force

Write-Host "Reading $xmlFile..."
$xmlBytes = [System.IO.File]::ReadAllBytes($xmlFile)

Write-Host "Opening $target archive..."
$zip = [System.IO.Compression.ZipFile]::Open($target, [System.IO.Compression.ZipArchiveMode]::Update)
$entry = $zip.GetEntry("word/document.xml")
if ($entry) {
    Write-Host "Deleting existing word/document.xml entry..."
    $entry.Delete()
}
$newEntry = $zip.CreateEntry("word/document.xml", [System.IO.Compression.CompressionLevel]::Optimal)
$stream = $newEntry.Open()
$stream.Write($xmlBytes, 0, $xmlBytes.Length)
$stream.Flush()
$stream.Close()
$zip.Dispose()

Write-Host "SUCCESS! Injected $xmlFile into $target"
$targetItem = Get-Item $target
Write-Host "Output Docx Size: " $targetItem.Length "bytes"

