# Paul Ahrens
# Bash and PowerShell Workshop

<#

1) Import the csv file
2) Select only the Name, CPU, and Path objects
3) Sort by the Path

#>

Import-Csv processes.csv | Select-Object Name, CPU, Path | Sort-Object -Property Path