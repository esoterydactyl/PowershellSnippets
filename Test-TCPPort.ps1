function Test-TcpPort 
    {
        param($hostname,$port)

        try {
            $tcp = New-Object System.Net.Sockets.TcpClient
            $tcp.Connect($hostname,$port)
            $tcp.Close()
         
            return New-Object PSObject -Property @{
                Hostname = $hostname
                Port = $port
                Pass = $true
                Exception = $null
            }
        }
        catch [System.Net.Sockets.SocketException] {
            return New-Object PSObject -Property @{
                Hostname = $hostname
                Port = $port
                Pass = $false
                Exception=[string]::format("Socket Exception: {0}", $_)
            }        
        }    
        catch {
            return New-Object PSObject -Property @{
                Hostname = $hostname
                Port = $port
                Pass = $false
                Exception = $_
            }    
        }
    }