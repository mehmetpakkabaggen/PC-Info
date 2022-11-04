<#Program that allows the user to choose the types of things he wants to see about the PC. he can choose between seeing the domain name, the amount of RAM in gigabytes,
which processor the PC has, which OS it runs on as well as the version of the OS, all the disks on the PC.#>




# A function that gets the domain name of the computer.
function domain {
    $rdomain = Get-WmiObject -Class Win32_ComputerSystem
    $domain = $rdomain.Domain
    Write-Host $domain
    
}
# Getting the total amount of ram in the computer and then converting it to gigabytes.
function ram {
    $rram = Get-WmiObject -Class Win32_ComputerSystem
    $ram = $rram.TotalPhysicalMemory
    $ramGB = [math]::Round($ram / 1GB, 0)
    [string]$GB = "GB"
    [string]$ramout = 'ram'
    $out = [string]$ramGB + $GB +' ' + $ramout
    Write-Host $out
}
# Getting the name and model of the processor.
function cpu {
    $rcpu = Get-WmiObject -Class Win32_Processor
    $cpu = $rcpu.Name
    Write-Host $cpu
}
# Getting the operating system and the version of the operating system and then combining them into
# one string.
function os {
    $ros = Get-WmiObject -Class Win32_OperatingSystem
    $rosversion = Get-WmiObject -Class Win32_OperatingSystem
    $OsVersjon = $rosversion.Version
    ## combine the caption of the operating system with the version of the operating system
    $os = $ros.Caption + " " + $OsVersjon
    write-host $os
}
# Getting all the disks in the computer and then writing them out.
function diskFunction {
    $rdisk = Get-Volume
    $rdisk = Get-Volume
    $disk = $rdisk | Out-String
    $disk = $rdisk | Out-String
    Write-Host $disk

}


function all {
    $rdisk = Get-Volume
    $rdisk = Get-Volume
    $disk = $rdisk | Out-String
    $disk = $rdisk | Out-String
    #Write-Host $disk

    $ros = Get-WmiObject -Class Win32_OperatingSystem
    $rosversion = Get-WmiObject -Class Win32_OperatingSystem
    $OsVersjon = $rosversion.Version
    ## combine the caption of the operating system with the version of the operating system
    $os = $ros.Caption + " " + $OsVersjon
    #write-host $os

    $rcpu = Get-WmiObject -Class Win32_Processor
    $cpu = $rcpu.Name
    #Write-Host $cpu

    $rram = Get-WmiObject -Class Win32_ComputerSystem
    $ram = $rram.TotalPhysicalMemory
    $ramGB = [math]::Round($ram / 1GB, 0)
    [string]$GB = "GB"
    [string]$ramout = 'ram'
    $out = [string]$ramGB + $GB +' ' + $ramout
    #Write-Host $out

    $rdomain = Get-WmiObject -Class Win32_ComputerSystem
    #$domain = $rdomain.Domain
    Write-Host $domain $out $cpu $os $disk
    

}



    $menu = @(
        "Domain"
        "Cpu"
        "Ram"
        "DiskDrive"
        "Os"
        "All of the above"

    )
$options = @{

    "Domain" = {domain}
    "Cpu" = {cpu}
    "Ram" = {ram}
    "DiskDrive" = {diskFunction}
    "Os" = {os}
   # "All of the above" = {domain; cpu; ram; diskFunction; os;}  
   "All of the above" = {all} 
}



# A menu that lets the user choose what he wants to see.
write-host $menu
   
$choice = read-host "what do you want to see?"
    
$options[$choice] | Invoke-Expression


