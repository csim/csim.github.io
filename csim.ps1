[CmdletBinding()]
param (
    [ValidateSet("New", "Serve", "Publish")]
    [string]$Action,
    [string]$Arg1
)

Push-Location $PSScriptRoot

try {
    if ($Action -eq "publish") {
        git add -A
        git commit -a -m "Updates"
        git push
    }

    if ($Action -eq "serve") {
        hugo serve --port 8080
    }


    if ($Action -eq "new") {
        $name = $Arg1 -replace '\s', '-';
        $path = "posts/2021/$name.md"
        hugo new --kind post $path
        & code "content/$path"
    }
} catch {
    Pop-Location
}
