BeforeAll {
    $ErrorActionPreference = 'Stop'
    Import-Module .\AzPipelineVariable.psm1 -Force
}

Describe 'Set-AzPipelineVariable' {

    BeforeEach {
        $script:command = $null
    }

    AfterEach {
        Remove-Variable command -Scope Script
    }

    It 'Sets the variable' {
        Mock Write-Host {
            $script:command = $Object
        } -ModuleName AzPipelineVariable
        
        Set-AzPipelineVariable foo xyz
        
        $command | Should -Match '##vso\[task\.setvariable.*variable=foo.*\]xyz'
    }

    It 'Makes the variable readonly by default' {
        Mock Write-Host {
            $script:command = $Object
        } -ModuleName AzPipelineVariable
        
        Set-AzPipelineVariable foo xyz
        
        $command | Should -Match 'readonly=true'         
    }
}