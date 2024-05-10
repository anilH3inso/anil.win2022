Write-Host "This script will bypass the firewall state = Defense Evasion (ATT&CK ID: T1562):"
Write-Host "Processing..."

# Prompt the user for input
$choice = Read-Host "Do you want to break or repair the firewall? (Type 'break' or 'repair' and press Enter)"

# Condition 1: Break Firewall
if ($choice -eq "break") {
    netsh advfirewall set currentprofile state off
    Write-Host "Firewall state has been turned off."
}
# Condition 2: Repair Firewall
elseif ($choice -eq "repair") {
    netsh advfirewall set currentprofile state on
    Write-Host "Firewall state has been turned on."
}
else {
    Write-Host "Invalid option. Please specify 'break' to turn off firewall or 'repair' to turn it on."
}
