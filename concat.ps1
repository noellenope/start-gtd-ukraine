Param(
  [Parameter(Mandatory=$true)]
  [String]$sourceDir
)
if(!(Test-Path$sourceDir)){
  Write-Host "ERROR: Path not found. Check the path and try again!" -ForegroundColor Red
}
else {
  $allFiles = @()
  ForEach($i in Get-ChildItem $sourceDir){
    $fileName=$i.name
    $data = Get-Content -Path $sourceDir\$fileName -Raw | ConvertFrom-Json
    $allFiles += $data
  }
  $allRFiles | ConverTo-Json -Depth 2-compress | Out-File -FilePath $sourceDir\merged.json
  }