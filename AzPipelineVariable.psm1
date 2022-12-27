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
    'xyz' | Set-AzPipelineVariable foo
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
        [AllowEmptyString()]
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

    process {
        Write-Host ('##vso[task.setvariable variable={0};isreadonly={1};isoutput={2};issecret={3}]{4}' `
            -f $Name, -not $Mutable, $Output, $Secret, $Value)

        $valueToLog = if ($Secret) { '***' } else { $Value }
        Write-Verbose ("Set variable '{0}' to '{1}'. [readonly={2}; output={3}; secret={4}]" `
            -f $Name, $valueToLog, -not $Mutable, $Output, $Secret)
    }
}
