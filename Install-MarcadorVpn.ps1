


function Install-MarcadorVpn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$VpnName,
        [Parameter(Mandatory=$true)]
        [string]$VpnServer,
        [Parameter(Mandatory=$false)]
        [string]$TunnelType = "L2tp",
        [Parameter(Mandatory=$true)]
        [string]$SharedKey 
    )
    
    begin {
        
    }
    
    process {
        Add-VpnConnection -Name $VpnName -ServerAddress $VpnServer -TunnelType $TunnelType -EncryptionLevel Required -AuthenticationMethod MSChapv2 -RememberCredential -SplitTunneling -Force -L2tpPsk $SharedKey

    }
    
    end {
        
    }
}



function New-SharedKey {
    
    -join ((65..90) + (97..122) | Get-Random -Count 50 | ForEach-Object {[char]$_})
}