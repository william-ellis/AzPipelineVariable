Remove-Item .\output -Force -Recurse -ErrorAction Ignore
New-Item .\output -ItemType Directory | Out-Null

Copy-Item AzPipelineVariable.psd1 output
Copy-Item AzPipelineVariable.psm1 output
Copy-Item LICENSE output
Copy-Item README.md output
Copy-Item CHANGELOG.md output
