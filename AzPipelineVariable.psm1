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
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]
        # The name of the variable to set.
        $Name,
        
        [Parameter(Mandatory, ValueFromPipeline)]
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

    
    '##vso[task.setvariable variable={0};readonly={1};output={2};secret={3}]{4}' `
        -f $Name, -not $Mutable, $Output, $Secret, $Value
    | Write-Host

    "Setting variable '{0}' to '{1}'. [readonly={2}; output={3}; secret={4}]" `
        -f $Name, ($Secret ? '***' : $Value), -not $Mutable, $Output, $Secret
    | Write-Verbose
}