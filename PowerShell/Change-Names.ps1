# Paul Ahrens
# Bash and PowerShell Workshop
# https://stackoverflow.com/questions/3822745/rename-files-to-lowercase-in-powershell

<#

1) dir is an alias for Get-ChildItem (and -r is short for -Recurse).
2) % is an alias for ForEach-Object.
3) -cne is a case-sensitive comparison. -ne ignores case differences.
4) $_ is how you reference the current item in the ForEach-Object loop.
5) ren is an alias for Rename-Item.

#>

# Take in a string parameter and call it $path
Param(
  [string]$path
)

If(!$path) {
  "Missing path argument! Exiting..."
  Exit
}

# Single line solution
# dir $path -r | % { if ($_.Name -cne $_.Name.ToLower()) { ren $_.FullName $_.Name.ToLower() } }

# Get the files of the current directory
$files = get-childitem $path -recurse

# For each file in the directory, check and rename to lowercase
foreach ($file in $files) {
    if ($file.Name -cne $file.Name.ToLower()) {
        Rename-Item -Path $file.FullName -NewName $file.Name.ToLower()
    }
}