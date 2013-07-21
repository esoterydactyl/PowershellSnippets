function Get-SQLData 
    {
    PARAM([string]$Query,
          [string]$ConnectionString)
           
      $Connection = New-Object System.Data.SQLClient.SQLConnection

      $Connection.ConnectionString = $ConnectionString
      $Connection.Open()

      $Command = New-Object System.Data.SqlClient.SqlCommand
      $Command.Connection = $Connection
      $Command.CommandText = $Query

      $Reader = $Command.ExecuteReader()
      $Counter = $Reader.FieldCount
      while ($Reader.Read()) {
        $SQLObject = @{}
          for ($i = 0; $i -lt $Counter; $i++) {
            $SQLObject.Add(
              $Reader.GetName($i),
              $Reader.GetValue($i)
            );
          }
        $SQLObject
      }
      $Connection.Close()
    }
