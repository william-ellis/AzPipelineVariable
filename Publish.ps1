Remove-Item .\output\* -Force -Recurse -ErrorAction Ignore
New-Item .\output\AzPipelineVariable -ItemType Directory | Out-Null

Copy-Item AzPipelineVariable.psd1 output\AzPipelineVariable
Copy-Item AzPipelineVariable.psm1 output\AzPipelineVariable
Copy-Item .\LICENSE output\AzPipelineVariable
Copy-Item .\README.md output\AzPipelineVariable
Copy-Item .\CHANGELOG.md output\AzPipelineVariable