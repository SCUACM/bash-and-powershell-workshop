# Paul Ahrens
# Bash and PowerShell Workshop

# Create a new folder called new_folder
New-Item new_folder -type directory -force

# Set the location to that new folder
Set-Location -Path ./new_folder

# Create a new text file called new_file
New-Item new_file.txt -type file -force

# Set the location back to where your script is
Set-Location -Path ..