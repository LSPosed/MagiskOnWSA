try
{
    $User = [Security.Principal.WindowsIdentity]::GetCurrent()
    $Role = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    if(!$Role)
    {
        Throw "Run as an administrator !" 
    }
    import-module appx -usewindowspowershell
    Remove-AppxPackage MicrosoftCorporationII.WindowsSubsystemForAndroid_1.7.32815.0_x64__8wekyb3d8bbwe -AllUsers
    Add-AppxPackage -Register .\AppxManifest.xml
}
catch
{
    Write-Host $_.Exception.Message -ForegroundColor Red
}