# Paul Ahrens
# Bash and PowerShell Workshop

<#

1) Get the processes
2) Sort the processes by the CPU in descending order
3) Select the first ten of these
4) Export them to a csv file

#>

Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | Export-Csv processes.csv