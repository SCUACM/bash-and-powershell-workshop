# Paul Ahrens
# Bash and PowerShell Workshop

# String parameters for two paths
Param(
  [string]$path1,
  [string]$path2
)

If(!$path1 -or !$path2) {
  "Missing path argument! Exiting..."
  Exit
}

# Get-Content gets the content at the location specified by the path
$file1 = Get-Content $path1
$file2 = Get-Content $path2

# Compare the content of the first file with the content of the second, send output to a file
Compare-Object -ReferenceObject $file1 -DifferenceObject $file2 -IncludeEqual | Out-File file_differences.txt