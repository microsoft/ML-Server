###########################################################################################
    # Function wrappers
    # Used in installers for templates / samples for ML Server / SQL Server ML Services
 ##########################################################################################
 .SYNOPSIS
 Short description
 
 .DESCRIPTION
 Long description
 
 .PARAMETER query
 Parameter description
 
 .PARAMETER dbName
 Parameter description
 
 .EXAMPLE
 An example
 
 .NOTES
 General notes
 #>
 ######
function ExecuteSQL
    {
        param(
        [String]$query,
        [Parameter(Mandatory=$false)]
        [String]$dbName = $DatabaseName
        )
        if($IsMixedMode -eq "Yes") {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Username $username -Password $password -Query $query
        }
        else {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Query $query
        }
    }
    function ExecuteSQLScript
    {
        param(
        [String]$scriptfile,
        [Parameter(Mandatory=$false)]
        [String]$dbName = $DatabaseName
        )
        if($IsMixedMode -eq "Yes") {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -Username $username -Password $password -InputFile $scriptfile
        }
        else {
            Invoke-Sqlcmd -ServerInstance $serverName -Database $dbName -InputFile $scriptfile
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