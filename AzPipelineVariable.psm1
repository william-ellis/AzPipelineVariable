<#
.SYNOPSIS
    Sets a variable in an Azure Pipelines pipeline.
.DESCRIPTION
    The variable is set using the task.setvariable command. It will be read-only
    by default.
.LINK
    https://learn.microsoft.com/en-us/azure/devops/pipelines/process/set-variables-scripts
#>
function Set-AzPipelineVariable {
    param(
        [Parameter(Mandatory)]
        [string]
        # The name of the variable to set.
        $Name,
        
        [Parameter(Mandatory)]
        [string]
        # The value of the variable to set.
        $Value,

        # Makes the variable an output variable.
        [switch]
        $Output,

        # Makes the variable a secret variable.
        [switch]
        $Secret,
        
        # Makes the variable mutable (not readonly).
        [switch]
        $Mutable
    )

    Write-Host "##vso[task.setvariable variable=$Name;readonly=$(-not $Mutable);output=$Output;secret=$Secret]$Value"
}