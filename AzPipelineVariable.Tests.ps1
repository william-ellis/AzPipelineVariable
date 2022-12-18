BeforeAll {
    $ErrorActionPreference = 'Stop'
    Import-Module .\AzPipelineVariable.psm1 -Force
}

Describe 'Set-AzPipelineVariable' {

    BeforeEach {
        $script:command = $null

        Mock Write-Host {
            $script:command = $Object
        } -ModuleName AzPipelineVariable
    }

    AfterEach {
        Remove-Variable command -Scope Script
    }

    It 'Sets the variable' {
        Set-AzPipelineVariable foo xyz
        
        $command | Should -Match '##vso\[task\.setvariable.*variable=foo.*\]xyz'
    }

    It 'Makes the variable readonly by default' {
        Set-AzPipelineVariable foo xyz
        
        $command | Should -Match 'readonly=true'         
    }

    It 'Can create a mutable variable' {
        Set-AzPipelineVariable foo xyz -Mutable
        
        $command | Should -Match 'readonly=false'
    }
}