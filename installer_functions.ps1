<#
 .SYNOPSIS
 Function wrappers, Used in installers for templates / samples for ML Server / SQL Server ML Services
 #>
function ExecuteSQL
{
    param(
        [String]$query,
        [Parameter(Mandatory=$false)]
        [String]$dbName = $DatabaseName
    )
    if($IsMixedMode -eq "Yes") {
        Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Username $username -Password $password -Query $query -QueryTimeout 200000
    }
    else {
        Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Query $query -QueryTimeout 200000
    }
}
function ExecuteSQLScript
{
    param(
        [String]$scriptfile,
        [Parameter(Mandatory=$false)]
        [String]$dbName = $DatabaseName,
        [Parameter(Mandatory=$false)]
        [String[]]$variables = @()
    )
    if($IsMixedMode -eq "Yes") {
        if($variables.Count -eq 0) {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Username $username -Password $password -InputFile $scriptfile -QueryTimeout 200000
        }
        else {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Username $username -Password $password -InputFile $scriptfile -QueryTimeout 200000 -Variable $variables
        }
    }
    else {
        if($variables.Count -eq 0) {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -InputFile $scriptfile -QueryTimeout 200000
        }
        else {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -InputFile $scriptfile -QueryTimeout 200000 -Variable $variables
        }
    }
}
function ExecuteBCP
{
    param(
        [String]
        $bcpcmd
    )
    if($IsMixedMode -eq "Yes") {
        $bcpCommand = "$bcpcmd  -U $username -S $serverName -P $password"
    }
    else {
        $bcpCommand = "$bcpcmd -T -S $serverName"
    }
    #Write-Host($bcpCommand)
    Invoke-Expression $bcpCommand
}

##################################################################
##DSVM Does not have SQLServer Powershell Module Install or Update 
##################################################################
function InstallOrUpdateSQLServerPowerShellModule
{
    if (Get-Module -ListAvailable -Name SQLServer) 
    {
        Write-Host 
        ("Updating SQLServer Power Shell Module")    
        Update-Module -Name "SQLServer" -MaximumVersion 21.0.17199
        Import-Module -Name SqlServer -MaximumVersion 21.0.17199 -Force
    }
    Else 
    {
        Write-Host 
        ("Installing SQLServer Power Shell Module")  
        Install-Module -Name SqlServer -RequiredVersion 21.0.17199 -Scope AllUsers -AllowClobber -Force
        Import-Module -Name SqlServer -MaximumVersion 21.0.17199 -Force
    }
}

##########################################################################
##Clone Data from GIT
##########################################################################
function CloneFromGIT
{
    param(
        [String]
        $SolutionFullName,
        [String]
        $solutionTemplatePath,
        [String]
        $SolutionPath
    )
        
    $clone = "clone https://github.com/Microsoft/$SolutionFullName $solutionTemplatePath"
    if (Test-Path $SolutionPath) {
        Write-Host "Solution has already been cloned"
    }
    else {
        Write-Host "Cloning solution"
        #Invoke-Expression "git "+$clone
        Start-Process "C:\Program Files\Git\bin\git.exe" -ArgumentList $clone -Wait -NoNewWindow
    }
}

##########################################################################
## Install Power BI
##########################################################################
function InstallPowerBI()
{
    Write-Host("Installing latest Power BI")
    #Download PowerBI Desktop installer
    Start-BitsTransfer -Source "https://go.microsoft.com/fwlink/?LinkId=521662&clcid=0x409" -Destination powerbi-desktop.msi
    ##Silently install PowerBI Desktop
    msiexec.exe /i powerbi-desktop.msi /qn /norestart  ACCEPT_EULA=1

    if (!$?) 
    {
    Write-Host -ForeGroundColor Red " Error installing Power BI Desktop. Please install latest Power BI manually."
    }
}

##########################################################################
## WriteThanksMessage
##########################################################################
function WriteThanksMessage
{
    param(
        [String]
        $SolutionName,
        [String]
        $serverName,
        [String]
        $databaseName,
        [String]
        $moreSolutionsURL
    )
    Write-Host("")
    Write-Host -ForegroundColor 'green' ("###################################################################################################")
    Write-Host -ForeGroundColor 'green' ("Deployment completed succesfully! Please note the following important information:")
    Write-Host -ForeGroundColor 'green' ("Solution Name: $SolutionName")
    Write-Host -ForeGroundColor 'green' ("Links to solution directory and help page are on the Desktop")
    Write-Host -ForeGroundColor 'green' ("SQL Server: $serverName")
    Write-Host -ForeGroundColor 'green' ("Database: $databaseName")
    Write-Host -ForeGroundColor 'green' ("Thanks for installing this solution. Find more solutions at: $moreSolutionsURL")
    Write-Host -ForegroundColor 'green' ("###################################################################################################")
}

##########################################################################
## WriteInstallStartMessage
##########################################################################
function WriteInstallStartMessage
{
    param(
        [String]
        $SolutionName
    )
    Write-Host -ForegroundColor 'green' ("###################################################################################################")
    Write-Host -ForeGroundColor 'green' ("This script will install ML Server sample solution $SolutionName")
    Write-Host -ForegroundColor 'green' ("###################################################################################################")

}

##########################################################################
## Change Auth from Windows to Mixed
##########################################################################
function ChangeAuthenticationFromWindowsToMixed
{
    param(
        [string]$servername,
        [string]$IsMixedMode,
        [string]$username,
        [string]$password
    )
    if ($IsMixedMode -eq 'Yes') {
        if([string]::IsNullOrEmpty($username) -or [string]::IsNullOrEmpty($password)) {
            $Credential = $Host.ui.PromptForCredential("Need credentials", "Please supply an user name and password to configure SQL for mixed authentication.", "", "")
            $username = $credential.Username
            $password = $credential.GetNetworkCredential().password 
        }
        Write-Host("Configuring SQL to used Mixed Authentication mode")
        Invoke-Sqlcmd -Query "EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2;" -ServerInstance "LocalHost" 
        Write-Host("Creating login for user $username")
        $Query = "IF NOT EXISTS (SELECT loginname from master.dbo.syslogins where name='$username') BEGIN CREATE LOGIN [$username] WITH PASSWORD=N'$password', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF END"
        Invoke-Sqlcmd -ServerInstance $serverName -Database "master" -Query $Query -QueryTimeout 200000
                    
        Write-Host("Adding $username to [sysadmin] role")
        $Query = "ALTER SERVER ROLE [sysadmin] ADD MEMBER $username"
        Invoke-Sqlcmd -ServerInstance $serverName -Database "master" -Query $Query -QueryTimeout 200000
    }
}

##########################################################################
## Install R Packages
##########################################################################
function InstallRPackages
{
    param(
        [string]$SolutionPath
    )
    If ($InstallR -eq 'Yes') {
        Write-Host("Installing R Packages")
        Set-Location "$SolutionPath\Resources\"
        # install R Packages
        $Rscript_paths = "C:\Program Files\Microsoft\ML Server\R_SERVER\bin\x64\Rscript.exe", "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\R_SERVICES\bin\x64\Rscript.exe", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\R_SERVICES\bin\x64\Rscript.exe"
        $found = false
        foreach ($p in $Rscript_paths) {
            if (Test-Path -Path $p) {
                Start-Process $p -ArgumentList "packages.R " -Wait
                $found = true
                break
            }
        }
        if(-Not $found) {
            Write-Host "Could not install R packages - please install them manually using file available in the Resources folder." -ForegroundColor Red
        }           
    }
}