# Paul Ahrens
# Bash and PowerShell Workshop

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