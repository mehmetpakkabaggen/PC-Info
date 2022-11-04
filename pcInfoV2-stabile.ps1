<#Programm som lar brukeren velge hvilke typer ting han vil se om pcen. han kan velge mellom å se domeme navn, ram mengde i gigabyte, 
hvilke prosessor pcen har, hvilket os som den skjører på samt med versjonen av os-en, alle diskene på pcen.#>




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



    $menu = @(
        "Domene"
        "Cpu"
        "Ram"
        "Disk"
        "Os"
        "Alle"

    )
$options = @{

    "Domene" = {domain}
    "Cpu" = {cpu}
    "Ram" = {ram}
    "Disk" = {diskFunction}
    "Os" = {os}
    "Alle" = {domain; cpu; ram; diskFunction; os;}   
}



# A menu that lets the user choose what he wants to see.
write-host $menu
   
$choice = read-host "Hva vil du se?"
    
$options[$choice] | Invoke-Expression


