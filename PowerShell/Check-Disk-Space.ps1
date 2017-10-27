# Paul Ahrens
# Bash and PowerShell Workshop

# Get the WMI objects that are Logical Disks
$disks = Get-WmiObject -Class Win32_LogicalDisk

# For each disk, calculate and print out the percentage of used space
foreach ($disk in $disks) {
    $freespace = $disk.FreeSpace
    $totalspace = $disk.Size
    $percent = [math]::Round((($totalspace - $freespace) / $totalspace) * 100)
    $percent.ToString() + "%"
} 