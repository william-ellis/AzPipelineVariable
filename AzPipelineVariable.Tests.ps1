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
        
        $command | Should -Be `
        '##vso[task.setvariable variable=foo;readonly=true;output=false;secret=false]xyz'
    }

    It 'Makes the variable readonly by default' {
        Set-AzPipelineVariable foo xyz
        
        $command | Should -Match 'readonly=true'         
    }

    It 'Can create a mutable variable' {
        Set-AzPipelineVariable foo xyz -Mutable
        
        $command | Should -Match 'readonly=false'
    }

    It 'Can create an output variable' {
        Set-AzPipelineVariable foo xyz -Output
        
        $command | Should -Match 'output=true'
    }

    It 'Can create a secret variable' {
        Set-AzPipelineVariable foo xyz -Secret
        
        $command | Should -Match 'secret=true'
    }

    It 'Can take the value as pipeline input' {
        (@{ value = 'xyz' }).value | Set-AzPipelineVariable foo

        $command | Should -BeLike '*]xyz'
    }

    Context 'Verbose output' {

        It 'Works' {
            $verbose = Set-AzPipelineVariable foo xyz -Verbose 4>&1

            $verbose | Should -Be `
            "Set variable 'foo' to 'xyz'. [readonly=True; output=False; secret=False]"
        }

        It 'Does not output secret values' {
            $verbose = Set-AzPipelineVariable foo xyz -Secret -Verbose 4>&1

            $verbose | Should -Be `
            "Set variable 'foo' to '***'. [readonly=True; output=False; secret=True]"
        }
    }
}