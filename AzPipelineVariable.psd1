@{
    RootModule = 'AzPipelineVariable.psm1'
    ModuleVersion = '1.0.0'
    GUID = '01b2c801-31b5-44f6-a957-12ea0a273d79'
    Author = 'William Ellis'
    Copyright = '(c) William Ellis. All rights reserved.'
    Description = 'A PowerShell wrapper for the "task.setvariable" Azure Pipelines command'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Set-AzPipelineVariable')
    CmdletsToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @(
                'Azure', 'Pipelines', 'Variable', 'Automation', 'DevOps',
                'PSEdition_Core', 'PSEdition_Desktop',
                'Windows', 'Linux', 'MacOS'
            )
            LicenseUri = 'https://github.com/william-ellis/AzPipelineVariable/blob/main/LICENSE'
            ProjectUri = 'https://github.com/william-ellis/AzPipelineVariable'
            ReleaseNotes = 'Please see https://github.com/william-ellis/AzPipelineVariable/blob/main/CHANGELOG.md for release notes'
        }
    }
}
