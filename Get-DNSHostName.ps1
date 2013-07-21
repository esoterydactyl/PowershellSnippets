function Get-DNSHostName($IP)
    {
        $DNSRecords = [Net.Dns]::GetHostEntry($IP)
        $DNSRecords.AddressList|%{$_.IPAddressToString}
    }

