function Get-SiteStatus($url)
	{
	    $req = [System.Net.HttpWebRequest]::Create($url)
	    try
	    {
	        $res = $req.GetResponse()
	        [int]$res.StatusCode
	    }
	    catch
	    {
	        "Failed"
	    }
		finally
		{
			$res.Close()
		}
	}
