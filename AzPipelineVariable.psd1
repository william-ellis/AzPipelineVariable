@{
    RootModule = 'AzPipelineVariable.psm1'
    ModuleVersion = '0.0.3'
    GUID = '01b2c801-31b5-44f6-a957-12ea0a273d79'
    Author = 'William Ellis'
    Copyright = '(c) William Ellis. All rights reserved.'
    Description = 'A PowerShell function to create variables in Azure pipelines'
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
            # see https://github.com/PowerShell/PowerShellGet/issues/835
            # LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://github.com/william-ellis/AzPipelineVariable'
            ReleaseNotes = 'Please see https://github.com/william-ellis/AzPipelineVariable/blob/main/CHANGELOG.md for release notes'
        }
    }
}
