<#
.SYNOPSIS
    Sets a variable in an Azure Pipelines pipeline.
.DESCRIPTION
    The variable is set using the task.setvariable command. It will be read-only
    by default.
.EXAMPLE
    Set-AzPipelineVariable -Name myVar -Value 'xyz'
.EXAMPLE
    Set-AzPipelineVariable secretOutputVar 'xyz' -Secret -Output
.EXAMPLE
    Get-Content .\example.json | ConvertFrom-Json | Select-Object -Expand foo | Set-AzPipelineVariable myVar
.LINK
    https://learn.microsoft.com/en-us/azure/devops/pipelines/process/set-variables-scripts
#>
function Set-AzPipelineVariable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [string]
        # The name of the variable to set.
        $Name,

        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [AllowEmptyString()]
        [string]
        # The value of the variable to set.
        $Value,

        [Parameter(ValueFromPipelineByPropertyName)]
        [switch]
        # Makes the variable an output variable.
        $Output,

        [Parameter(ValueFromPipelineByPropertyName)]
        [switch]
        # Makes the variable a secret variable.
        $Secret,

        [Parameter(ValueFromPipelineByPropertyName)]
        [switch]
        # Makes the variable mutable (not readonly).
        $Mutable
    )

    process {
        Write-Host ('##vso[task.setvariable variable={0};isreadonly={1};isoutput={2};issecret={3}]{4}' `
                -f $Name, -not $Mutable, $Output, $Secret, $Value)

        $valueToLog = if ($Secret) { '***' } else { $Value }
        Write-Verbose ("Set variable '{0}' to '{1}'. [readonly={2}; output={3}; secret={4}]" `
                -f $Name, $valueToLog, -not $Mutable, $Output, $Secret)
    }
}
