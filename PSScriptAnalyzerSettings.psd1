@{
    ExcludeRules = @(
        # Write-Host cannot be avoided since it's needed to log the task.setvariable command
        'PSAvoidUsingWriteHost',
        # Would be overkill since Write-Host is harmless
        'PSUseShouldProcessForStateChangingFunctions'
    )
}
