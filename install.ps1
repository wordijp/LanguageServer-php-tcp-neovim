$version = 'v0.1'
$name = 'availableport'
$url = "https://github.com/wordijp/LanguageServer-php-tcp-neovim/releases/download/$version/"

$target = $name + '.exe'
$zip_name = "${name}_windows_"
if ($ENV:PROCESSOR_ARCHITECTURE -eq 'AMD64') {
    $zip_name += 'amd64'
} else {
    $zip_name += '386'
}

$zip = $zip_name + '.zip'
$url += $zip

# clear old
$path = "bin\$target"
if (Test-Path $path) {
	Remove-Item -Force $path
}
# download
New-Item -ItemType Directory -Force download
echo "Downloading $url ..."
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
wget $url -OutFile "download\$zip"
# decompress
Expand-Archive -Path "download\$zip" -DestinationPath "download\$zip_name"
# copy
Copy-Item "download\$zip_name\$target" "bin\$target"
