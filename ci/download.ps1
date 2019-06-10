$url = "https://ci.appveyor.com/api/buildjobs/akxqjvpvsji0vf36/artifacts/target%2Fx86_64-pc-windows-msvc%2Frelease%2Fhemtt.exe"
$dest = "hemtt.exe"
Invoke-WebRequest -Uri $url -OutFile $dest
