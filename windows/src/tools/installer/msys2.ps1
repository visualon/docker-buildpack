#Requires -Version 5.1


if ( -not ($Version -match '^(\d+-\d+-\d+)$') ) {
  throw "Invalid $Name version"
}

$file = "$tmp\$Name.exe"
$app = "$apps\$Name"
$vSlim = $Version.Replace('-', '')
$url = "https://github.com/msys2/msys2-installer/releases/download/${Version}/msys2-base-x86_64-${vSlim}.sfx.exe"


Invoke-WebRequest $url -OutFile $file

exec {
  & $file -y -oC:\tmp\ | Out-Null
}

Move-Item -Path c:\tmp\msys64 -Destination $app

function msys() {
  exec {
    & "$app\usr\bin\bash.exe" @('-lc') + @Args
  }
}

msys ' '
msys 'pacman --noconfirm -Syuu'
msys 'pacman --noconfirm -Syuu'
msys 'pacman --noconfirm -Scc'
msys 'pacman --noconfirm -S --needed tar'

Install-Shim -Name tar -Path bin/tar.exe

exec { tar --version }

exec { tar --posix --use-compress-program zstd -T0 --long=30 -cf tmp/msys2.std -P $file.replace('\', '/') --force-local }

exec { tar --use-compress-program zstd -tf tmp/msys2.std -P }
