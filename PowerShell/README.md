# ACM Bash and PowerShell Workshop
PowerShell

## Instructions

### Downloading the repository

Starting in a PowerShell window...

1. Navigate to where you want the repository to reside 
2. Run ````git clone https://github.com/SCUACM/bash-and-powershell-tutorial```` to clone the repository to your device

### Running the scripts

Starting in a PowerShell window...

1. Navigate into the PowerShell folder of the repository
2. Type ````./```` followed by the name of the script file you want to run. Be sure to include any necessary arguments such as file names or paths!

### Modifying the scripts

Use the Windows PowerShell ISE program to modify the scripts or make your own!

## Tutorial

This document will help guide you through the process of making of several different problems:
1. Make a directory, and create a text file in that directory
2. Print your username (without hardcoding the name), and then print the numbers 1 to 10
3. Given two integers, find their sum, difference, product, and quotient
4. Given two files, find the difference between the two and place the output into a new file
5. Count the number of lines in an input file. Then count the total number of lines given multiple files.
6. For each disk, report the percentage of space used
7. Rename all files in a directory to be lowercase.
8. CHALLENGE: Rename all files in a directory to be lowercase in a single command
9. CHALLENGE: Get the list of processes, sort them in the descending order by CPU, select the top 10, then export to a .csv file
10. CHALLENGE: Import the .csv file, select only the Name, CPU, and Path columns, sort by Path, then print the result

To help with these problems, here are some cheat sheets that will assist with getting basic PowerShell knowledge:
1. https://goo.gl/TWY3XS  
2. https://goo.gl/152mDo
3. https://goo.gl/dY8MqA 

### Make a directory, and create a text file in that directory
#### File: Create-Folder.ps1

````PowerShell
# Create a new folder called new_folder
New-Item new_folder -type directory -force

# Set the location to that new folder
Set-Location -Path ./new_folder

# Create a new text file called new_file
New-Item new_file.txt -type file -force

# Set the location back to where your script is
Set-Location -Path ..
````

### Print your username (without hardcoding the name), and then print the numbers 1 to 10
#### File: Hello-User.ps1

````PowerShell
# Get the current username
$user = $env:UserName

# If you like the Bash approach
echo "Hello, $user!"

# If you like the PowerShell approach 
Write-Host "Hello, $user!" 

# If you do not care about either approach
"Hello, $user!"

# Create an array of the numbers from 1 to 10
$numbers = @(1,2,3,4,5,6,7,8,9,10);

# Print each of these numbers out
foreach($number in $numbers) {
    $number
}
````

### Given two integers, find their sum, difference, product, and quotient
#### File: Compute-Equations.ps1

````PowerShell
#Set $a to 21 and $b to 36
$a = 21;
$b = 36;

# 21 + 36 = 57
$a + $b

# 21 - 36 = -15
$a - $b

# 21 * 36 = 756
$a * $b

# 21 / 36 = 0.583333333333333
$a / $b
````

### Given two files, find the difference between the two and place the output into a new file
#### File: Compare-Files.ps1

````PowerShell
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
````

### Count the number of lines in an input file. Then count the total number of lines given multiple files.
#### File: Count-Lines.ps1

````PowerShell
# String parameter for path
Param(
  [string]$path1,
  [string]$path2
)

If(!$path1) {
  "Missing path argument! Exiting..."
  Exit
}

<#

Get the content of the file at path, then pipe 
it to a cmdlet to measure the number of lines

#>

Get-Content -Path $path1 | Measure-Object -Line

If($path2) {
  Set-Location -Path $path2
  $files = Get-ChildItem -recurse
  foreach ($file in $files) {
    Get-Content $file | Measure-Object -Line
  }
  Set-Location -Path ..
}
````

### For each disk, report the percentage of space used
#### File: Check-Disk-Space.ps1

````PowerShell
# Get the WMI objects that are Logical Disks
$disks = Get-WmiObject -Class Win32_LogicalDisk

# For each disk, calculate and print out the percentage of used space
foreach ($disk in $disks) {
    $freespace = $disk.FreeSpace
    $totalspace = $disk.Size
    $percent = [math]::Round((($totalspace - $freespace) / $totalspace) * 100)
    $percent.ToString() + "%"
} 
````

### Rename all files in a directory to be lowercase.
#### File: Change-Names.ps1

````PowerShell
# Take in a string parameter and call it $path
Param(
  [string]$path
)

If(!$path) {
  "Missing path argument! Exiting..."
  Exit
}

# Get the files of the current directory
$files = get-childitem $path -recurse

# For each file in the directory, check and rename to lowercase
foreach ($file in $files) {
    if ($file.Name -cne $file.Name.ToLower()) {
        Rename-Item -Path $file.FullName -NewName $file.Name.ToLower()
    }
}
````

### CHALLENGE: Rename all files in a directory to be lowercase in a single command
#### File: Change-Names.ps1

````PowerShell
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
dir $path -r | % { if ($_.Name -cne $_.Name.ToLower()) { ren $_.FullName $_.Name.ToLower() } }
````

### CHALLENGE: Get the list of processes, sort them in the descending order by CPU, select the top 10, then export to a .csv file
#### File: Export-Processes.ps1

````PowerShell
<#

1) Get the processes
2) Sort the processes by the CPU in descending order
3) Select the first ten of these
4) Export them to a csv file

#>

Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | Export-Csv processes.csv
````

### CHALLENGE: Import the .csv file, select only the Name, CPU, and Path columns, sort by Path, then print the result
#### File: Import-Processes.ps1

````PowerShell
<#

1) Import the csv file
2) Select only the Name, CPU, and Path objects
3) Sort by the Path

#>

Import-Csv processes.csv | Select-Object Name, CPU, Path | Sort-Object -Property Path
````