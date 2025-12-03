$dbServers = @("DatabaseServer1","DatabaseServer2")
$webServers = @("WebServer1","WebServer2","WebServer3")
$storageServers = @("StorageServer1")

# Add code below
$server = "StorageServer4"

if ($dbServers -contains $server){
    Write-Host "Server : $server is present in dbServers group"
}
elseif ($webServers -contains $server){
    Write-Host "Server : $server is present in webServers group"
}
elseif ($storageServers -contains $server){
    Write-Host "Server : $server is present in storageServers group"
}
else {
    switch ($server) {

        { $_.Contains("Database") } {
            Write-Host "Added the server in database inventory --> $server"
            $dbServers += $server
        }

        { $_.Contains("Web") } {
            Write-Host "Added the server in webservers inventory --> $server"
            $webServers += $server
        }

        { $_.Contains("Storage") } {
            Write-Host "Added the server in storage inventory --> $server"
            $storageServers += $server
        }

        default {
            Write-Host "Server does not match any known group."
        }
    }
}

foreach($NewServer in $dbServers){
  Write-Host "DB-Server :$NewServer"
}
foreach($NewServer in $webServers){
  Write-Host "Web-Server :$NewServer"
}
foreach($NewServer in $storageServers){
  Write-Host "Storage-Server :$NewServer"
}

