BeforeAll {
    $ErrorActionPreference = 'Stop'
    Import-Module .\AzPipelineVariable.psm1 -Force
}

Describe 'Set-AzPipelineVariable' {

    BeforeEach {
        $script:command = $null
    }

    It 'Works' {
        Mock Write-Host {
            $script:command = $Object
        } -ModuleName AzPipelineVariable
        
        Set-AzPipelineVariable foo xyz
        
        $command | Should -Be '##vso[task.setvariable variable=foo]xyz'
    }
}