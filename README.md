# AzPipelineVariable

[![Build Status](https://dev.azure.com/william-ellis/AzPipelineVariable/_apis/build/status/william-ellis.AzPipelineVariable?branchName=main)](https://dev.azure.com/william-ellis/AzPipelineVariable/_build/latest?definitionId=1&branchName=main)
[![PowerShellGallery](https://img.shields.io/powershellgallery/v/AzPipelineVariable?label=PowerShellGallery)](https://www.powershellgallery.com/packages/AzPipelineVariable)

## About

A PowerShell wrapper for the [`task.setvariable`](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/set-variables-scripts) Azure Pipelines command.

## Example

```ps
Set-AzPipelineVariable -Name myVar -Value 'xyz'
Set-AzPipelineVariable secretOutputVar 'xyz' -Secret -Output
'xyz' | Set-AzPipelineVariable foo
```