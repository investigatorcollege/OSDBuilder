function Add-ContentADKWinPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($WinPEADKPE)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: WinPE.wim ADK Optional Components"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $WinPEADKPE = $WinPEADKPE | Sort-Object Length

    foreach ($PackagePath in $WinPEADKPE) {
        if ($PackagePath -like "*WinPE-NetFx*") {
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinPE.log"
            Write-Verbose "CurrentLog: $CurrentLog"

            Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinPE" -LogPath "$CurrentLog" | Out-Null
        }
    }

    $WinPEADKPE = $WinPEADKPE | Where-Object {$_.Name -notlike "*WinPE-NetFx*"}
    foreach ($PackagePath in $WinPEADKPE) {
        if ($PackagePath -like "*WinPE-PowerShell*") {
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinPE.log"
            Write-Verbose "CurrentLog: $CurrentLog"

            Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinPE" -LogPath "$CurrentLog" | Out-Null
        }
    }

    $WinPEADKPE = $WinPEADKPE | Where-Object {$_.Name -notlike "*WinPE-PowerShell*"}
    foreach ($PackagePath in $WinPEADKPE) {
        Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinPE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        if ($OSMajorVersion -eq 6) {
            dism /Image:"$MountWinPE" /Add-Package /PackagePath:"$OSDBuilderContent\$PackagePath" /LogPath:"$CurrentLog"
        } else {
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinPE" -LogPath "$CurrentLog" | Out-Null
        }
    }
}
function Add-ContentADKWinRE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($WinPEADKRE)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: WinRE.wim ADK Optional Components"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $WinPEADKRE = $WinPEADKRE | Sort-Object Length
    foreach ($PackagePath in $WinPEADKRE) {
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinRE.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        if ($PackagePath -like "*WinPE-NetFx*") {
            Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinRE" -LogPath "$CurrentLog" | Out-Null
        }
    }

    $WinPEADKRE = $WinPEADKRE | Where-Object {$_.Name -notlike "*WinPE-NetFx*"}
    foreach ($PackagePath in $WinPEADKRE) {
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinRE.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        if ($PackagePath -like "*WinPE-PowerShell*") {
            Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinRE" -LogPath "$CurrentLog" | Out-Null
        }
    }
    $WinPEADKRE = $WinPEADKRE | Where-Object {$_.Name -notlike "*WinPE-PowerShell*"}
    foreach ($PackagePath in $WinPEADKRE) {
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinRE.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
        if ($OSMajorVersion -eq 6) {
            dism /Image:"$MountWinRE" /Add-Package /PackagePath:"$OSDBuilderContent\$PackagePath" /LogPath:"$CurrentLog"
        } else {
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinRE" -LogPath "$CurrentLog" | Out-Null
        }
    }
}
function Add-ContentADKWinSE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ([string]::IsNullOrWhiteSpace($WinPEADKSE)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: WinSE.wim ADK Optional Components"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $WinPEADKSE = $WinPEADKSE | Sort-Object Length
    foreach ($PackagePath in $WinPEADKSE) {
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinSE.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        if ($PackagePath -like "*WinPE-NetFx*") {
            Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinSE" -LogPath "$CurrentLog" | Out-Null
        }
    }
    $WinPEADKSE = $WinPEADKSE | Where-Object {$_.Name -notlike "*WinPE-NetFx*"}
    foreach ($PackagePath in $WinPEADKSE) {
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinSE.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        if ($PackagePath -like "*WinPE-PowerShell*") {
            Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinSE" -LogPath "$CurrentLog" | Out-Null
        }
    }
    $WinPEADKSE = $WinPEADKSE | Where-Object {$_.Name -notlike "*WinPE-PowerShell*"}
    foreach ($PackagePath in $WinPEADKSE) {
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentADKWinSE.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
        if ($OSMajorVersion -eq 6) {
            dism /Image:"$MountWinSE" /Add-Package /PackagePath:"$OSDBuilderContent\$PackagePath" /LogPath:"$CurrentLog.log"
        } else {
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountWinSE" -LogPath "$CurrentLog" | Out-Null
        }
    }
}
function Add-ContentDriversOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   Task
    #===================================================================================================
    if ($Drivers) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Drivers TASK"
        foreach ($Driver in $Drivers) {
            Write-Host "$OSDBuilderContent\$Driver" -ForegroundColor DarkGray

            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentDriversOS-Task.log"
            Write-Verbose "CurrentLog: $CurrentLog"

            if ($OSMajorVersion -eq 6) {
                dism /Image:"$MountDirectory" /Add-Driver /Driver:"$OSDBuilderContent\$Driver" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
            } else {
                Add-WindowsDriver -Driver "$OSDBuilderContent\$Driver" -Recurse -Path "$MountDirectory" -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
            }
        }
    }
    #===================================================================================================
    #   Template
    #===================================================================================================
    if ($DriverTemplates) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Drivers TEMPLATE"
        foreach ($Driver in $DriverTemplates) {
            Write-Host "$($Driver.FullName)" -ForegroundColor DarkGray

            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentDriversOS-Template.log"
            Write-Verbose "CurrentLog: $CurrentLog"

            if ($OSMajorVersion -eq 6) {
                dism /Image:"$MountDirectory" /Add-Driver /Driver:"$($Driver.FullName)" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
            } else {
                Add-WindowsDriver -Driver "$($Driver.FullName)" -Recurse -Path "$MountDirectory" -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
            }
        }
    }
}
function Add-ContentDriversPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   Task
    #===================================================================================================
    if ([string]::IsNullOrWhiteSpace($WinPEDrivers)) {Return}
    Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: Add-ContentDriversPE"
    foreach ($WinPEDriver in $WinPEDrivers) {
        Write-Host "$OSDBuilderContent\$WinPEDriver" -ForegroundColor DarkGray
        
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentDriversPE-Task.log"
        Write-Verbose "CurrentLog: $CurrentLog"

        if ($OSMajorVersion -eq 6) {
            dism /Image:"$MountWinPE" /Add-Driver /Driver:"$OSDBuilderContent\$WinPEDriver" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
            dism /Image:"$MountWinRE" /Add-Driver /Driver:"$OSDBuilderContent\$WinPEDriver" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
            dism /Image:"$MountWinSE" /Add-Driver /Driver:"$OSDBuilderContent\$WinPEDriver" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
        } else {
            Add-WindowsDriver -Path "$MountWinPE" -Driver "$OSDBuilderContent\$WinPEDriver" -Recurse -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
            Add-WindowsDriver -Path "$MountWinRE" -Driver "$OSDBuilderContent\$WinPEDriver" -Recurse -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
            Add-WindowsDriver -Path "$MountWinSE" -Driver "$OSDBuilderContent\$WinPEDriver" -Recurse -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
        }
    }
}
function Add-ContentExtraFilesOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   ABORT
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   TASK
    #===================================================================================================
    if ($ExtraFiles) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Extra Files TASK"
        foreach ($ExtraFile in $ExtraFiles) {
        
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentExtraFilesOS-Task.log"
            Write-Verbose "CurrentLog: $CurrentLog"

            Write-Host "$OSDBuilderContent\$ExtraFile" -ForegroundColor DarkGray
            robocopy "$OSDBuilderContent\$ExtraFile" "$MountDirectory" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
        }
    }
    #===================================================================================================
    #   TEMPLATE
    #===================================================================================================
    if ($ExtraFilesTemplates) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Extra Files TEMPLATE"
        foreach ($ExtraFile in $ExtraFilesTemplates) {
        
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentExtraFilesOS-Template.log"
            Write-Verbose "CurrentLog: $CurrentLog"

            Write-Host "$($ExtraFile.FullName)" -ForegroundColor DarkGray
            robocopy "$($ExtraFile.FullName)" "$MountDirectory" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
        }
    }
}
function Add-ContentExtraFilesPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   ABORT
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   TASK
    #===================================================================================================
    if ($WinPEExtraFilesPE -or $WinPEExtraFilesRE -or $WinPEExtraFilesSE) {
        Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: Extra Files TASK"
        foreach ($ExtraFile in $WinPEExtraFilesPE) {
            Write-Host "Source: $OSDBuilderContent\$ExtraFile" -ForegroundColor DarkGray
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentExtraFilesPE.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            robocopy "$OSDBuilderContent\$ExtraFile" "$MountWinPE" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
        }
        foreach ($ExtraFile in $WinPEExtraFilesRE) {
            Write-Host "Source: $OSDBuilderContent\$ExtraFile" -ForegroundColor DarkGray
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentExtraFilesPE.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            robocopy "$OSDBuilderContent\$ExtraFile" "$MountWinRE" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
        }
        foreach ($ExtraFile in $WinPEExtraFilesSE) {
            Write-Host "Source: $OSDBuilderContent\$ExtraFile" -ForegroundColor DarkGray
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentExtraFilesPE.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            robocopy "$OSDBuilderContent\$ExtraFile" "$MountWinSE" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
        }
    } else {
        Return
    }
}
function Add-ContentScriptsOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   ABORT
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   TASK
    #===================================================================================================
    if ($Scripts) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Scripts TASK"
        foreach ($Script in $Scripts) {
            if (Test-Path "$OSDBuilderContent\$Script") {
                Write-Host -ForegroundColor Cyan "Source: $OSDBuilderContent\$Script"
                Invoke-Expression "& '$OSDBuilderContent\$Script'"
            }
        }
    }
    #===================================================================================================
    #   TEMPLATE
    #===================================================================================================
    if ($ScriptTemplates) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Scripts TEMPLATE"
        foreach ($Script in $ScriptTemplates) {
            if (Test-Path "$($Script.FullName)") {
                Write-Host -ForegroundColor Cyan "Source: $($Script.FullName)"
                Invoke-Expression "& '$($Script.FullName)'"
            }
        }
    }
}
function Add-ContentScriptsPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   TASK
    #===================================================================================================
    if ($WinPEScriptsPE -or $WinPEScriptsRE -or $WinPEScriptsSE) {
        Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: Scripts TASK"
        foreach ($PSWimScript in $WinPEScriptsPE) {
            if (Test-Path "$OSDBuilderContent\$PSWimScript") {
                Write-Host "Source: $OSDBuilderContent\$PSWimScript" -ForegroundColor Cyan
                (Get-Content "$OSDBuilderContent\$PSWimScript").replace('winpe.wim.log', 'WinPE.log') | Set-Content "$OSDBuilderContent\$PSWimScript"
                Invoke-Expression "& '$OSDBuilderContent\$PSWimScript'"
            }
        }
        foreach ($PSWimScript in $WinPEScriptsRE) {
            if (Test-Path "$OSDBuilderContent\$PSWimScript") {
                Write-Host "Source: $OSDBuilderContent\$PSWimScript" -ForegroundColor Cyan
                (Get-Content "$OSDBuilderContent\$PSWimScript").replace('winre.wim.log', 'WinRE.log') | Set-Content "$OSDBuilderContent\$PSWimScript"
                Invoke-Expression "& '$OSDBuilderContent\$PSWimScript'"
            }
        }
        foreach ($PSWimScript in $WinPEScriptsSE) {
            if (Test-Path "$OSDBuilderContent\$PSWimScript") {
                Write-Host "Source: $OSDBuilderContent\$PSWimScript" -ForegroundColor Cyan
                (Get-Content "$OSDBuilderContent\$PSWimScript").replace('MountSetup', 'MountWinSE') | Set-Content "$OSDBuilderContent\$PSWimScript"
                (Get-Content "$OSDBuilderContent\$PSWimScript").replace('setup.wim.log', 'WinSE.log') | Set-Content "$OSDBuilderContent\$PSWimScript"
                Invoke-Expression "& '$OSDBuilderContent\$PSWimScript'"
            }
        }
    }
}
function Add-ContentStartLayout {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($StartLayoutXML)) {Return}
    #===================================================================================================
    #   TASK
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Use Content StartLayout"
    Write-Host "$OSDBuilderContent\$StartLayoutXML" -ForegroundColor DarkGray
    Try {
        Copy-Item -Path "$OSDBuilderContent\$StartLayoutXML" -Destination "$MountDirectory\Users\Default\AppData\Local\Microsoft\Windows\Shell\LayoutModification.xml" -Recurse -Force | Out-Null
    }
    Catch {
        $ErrorMessage = $_.Exception.Message
        Write-Warning "$ErrorMessage"
    }
}
function Add-ContentUnattend {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($UnattendXML)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Use Content Unattend"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Write-Host "$OSDBuilderContent\$UnattendXML" -ForegroundColor DarkGray
    if (!(Test-Path "$MountDirectory\Windows\Panther")) {New-Item -Path "$MountDirectory\Windows\Panther" -ItemType Directory -Force | Out-Null}
    Copy-Item -Path "$OSDBuilderContent\$UnattendXML" -Destination "$MountDirectory\Windows\Panther\Unattend.xml" -Force
    
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-ContentUnattend.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Try {Use-WindowsUnattend -UnattendPath "$OSDBuilderContent\$UnattendXML" -Path "$MountDirectory" -LogPath "$CurrentLog" | Out-Null}
    Catch {
        $ErrorMessage = $_.Exception.Message
        Write-Warning "$ErrorMessage"
    }
}
function Add-FeaturesOnDemandOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($FeaturesOnDemand)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Features On Demand"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($FOD in $FeaturesOnDemand) {
        Write-Host $FOD -ForegroundColor DarkGray
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-FeaturesOnDemandOS.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {
            Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$FOD" -LogPath "$CurrentLog" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
    Update-CumulativeOS -Force
    Invoke-DismCleanupImage
}
function Add-LanguageFeaturesOnDemandOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($LanguageFeatures)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Language Features On Demand"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $LanguageFeatures | Where-Object {$_ -notlike "*Speech*"}) {
        if (Test-Path "$OSDBuilderContent\$Update") {
            Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
            Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LanguageFeaturesOnDemandOS.log" | Out-Null
        }
    }
    foreach ($Update in $LanguageFeatures | Where-Object {$_ -like "*TextToSpeech*"}) {
        if (Test-Path "$OSDBuilderContent\$Update") {
            Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
            Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LanguageFeaturesOnDemandOS.log" | Out-Null
        }
    }
    foreach ($Update in $LanguageFeatures | Where-Object {$_ -like "*Speech*" -and $_ -notlike "*TextToSpeech*"}) {
        if (Test-Path "$OSDBuilderContent\$Update") {
            Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
            Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LanguageFeaturesOnDemandOS.log" | Out-Null
        }
    }
}
function Add-LanguageInterfacePacksOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($LanguageInterfacePacks)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Language Interface Packs"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $LanguageInterfacePacks) {
        if (Test-Path "$OSDBuilderContent\$Update") {
            Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
            Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LanguageInterfacePacksOS.log" | Out-Null
        } else {
            Write-Warning "Not Found: $OSDBuilderContent\$Update"
        }
    }
}
function Add-LanguagePacksOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($LanguagePacks)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Language Packs"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $LanguagePacks) {
        if (Test-Path "$OSDBuilderContent\$Update") {
            if ($Update -like "*.cab") {
                Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
                Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LanguagePacksOS.log" | Out-Null
            } elseif ($Update -like "*.appx") {
                Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
                Add-AppxProvisionedPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LicensePath "$((Get-Item $OSDBuilderContent\$Update).Directory.FullName)\License.xml" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LanguagePacksOS.log" | Out-Null
            }
        } else {
            Write-Warning "Not Found: $OSDBuilderContent\$Update"
        }
    }
}
function Add-LocalExperiencePacksOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($LocalExperiencePacks)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Local Experience Packs"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $LocalExperiencePacks) {
        if (Test-Path "$OSDBuilderContent\$Update") {
            Write-Host "$OSDBuilderContent\$Update" -ForegroundColor DarkGray
            Add-AppxProvisionedPackage -Path "$MountDirectory" -PackagePath "$OSDBuilderContent\$Update" -LicensePath "$((Get-Item $OSDBuilderContent\$Update).Directory.FullName)\License.xml" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-LocalExperiencePacksOS.log" | Out-Null
        } else {
            Write-Warning "Not Found: $OSDBuilderContent\$Update"
        }
    }
}
function Add-OSDBuildPack {
    [CmdletBinding()]
    Param (
        #[Alias('Path')]
        #[Parameter(Mandatory)]
        #[string]$BuildPackPath,

        [ValidateSet(
            'Auto',
            'OSDrivers',
            'OSExtraFiles',
            'OSPackages',
            'OSPoshMods',
            'OSRegistry',
            'OSScripts',
            'PEADK',
            'PEDaRT',
            'PEDrivers',
            'PEExtraFiles',
            'PEPackages',
            'PEPoshMods',
            'PERegistry',
            'PEScripts'
        )]
        [Alias('Type')]
        [string]$BuildPackType = 'All'
    )
    #===================================================================================================
    #   ABORT
    #===================================================================================================
    if ($BuildPacksEnabled -eq $false) {Return}
    #===================================================================================================
    #   BUILD
    #===================================================================================================
    if ($BuildPacks) {
        #===================================================================================================
        #   WinPE BuildPacks
        #===================================================================================================
        if ($BuildPackType -eq 'PEADK') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PEADK"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PEADK"
                Add-OSDBuildPackPEADK -BuildPackContent "$BuildPackPath\$ReleaseID $OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'PEDaRT') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PEDaRT"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PEDaRT"
                Add-OSDBuildPackPEDaRT -BuildPackContent "$BuildPackPath"
            }
        }
        if ($BuildPackType -eq 'PEDrivers') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PEDrivers"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PEDrivers"
                Add-OSDBuildPackPEDrivers -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackPEDrivers -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'PEExtraFiles') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PEExtraFiles"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PEExtraFiles"
                Add-OSDBuildPackPEExtraFiles -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackPEExtraFiles -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'PEPoshMods') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PEPoshMods"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PEPoshMods"
                Add-OSDBuildPackPEPoshMods -BuildPackContent "$BuildPackPath\ALL"
            }
        }
        if ($BuildPackType -eq 'PERegistry') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PERegistry"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PERegistry"
                Add-OSDBuildPackPERegistry -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackPERegistry -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'PEScripts') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack PEScripts"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\PEScripts"
                Add-OSDBuildPackPEScripts -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackPEScripts -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        #===================================================================================================
        #   OS BuildPacks
        #===================================================================================================
        if ($BuildPackType -eq 'OSDrivers') {
            Show-ActionTime; Write-Host -ForegroundColor Green "OS: BuildPack OSDrivers"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\OSDrivers"
                Add-OSDBuildPackOSDrivers -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackOSDrivers -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'OSExtraFiles') {
            Show-ActionTime; Write-Host -ForegroundColor Green "OS: BuildPack OSExtraFiles"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\OSExtraFiles"
                Add-OSDBuildPackOSExtraFiles -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackOSExtraFiles -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'OSPoshMods') {
            Show-ActionTime; Write-Host -ForegroundColor Green "OS: BuildPack OSPoshMods"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\OSPoshMods"
                Add-OSDBuildPackOSPoshMods -BuildPackContent "$BuildPackPath\ALL"
            }
        }
        if ($BuildPackType -eq 'OSRegistry') {
            Show-ActionTime; Write-Host -ForegroundColor Green "OS: BuildPack OSRegistry"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\OSRegistry"
                Add-OSDBuildPackOSRegistry -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackOSRegistry -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
        if ($BuildPackType -eq 'OSScripts') {
            Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: BuildPack OSScripts"
            foreach ($BuildPack in $BuildPacks) {
                $BuildPackPath = "$OSDBuilderPath\BuildPacks\$BuildPack\OSScripts"
                Add-OSDBuildPackOSScripts -BuildPackContent "$BuildPackPath\ALL"
                Add-OSDBuildPackOSScripts -BuildPackContent "$BuildPackPath\$OSArchitecture"
            }
        }
    }
}
function Add-OSDBuildPackOSDrivers {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
        #[string]$MountDirectory
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackOSDrivers: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-OSDBuildPackOSDrivers.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Get-ChildItem "$BuildPackContent" *.inf -File -Recurse | Select-Object -Property FullName | foreach {Write-Host "$($_.FullName)" -ForegroundColor DarkGray}

    if ($OSMajorVersion -eq 6) {
        dism /Image:"$MountDirectory" /Add-Driver /Driver:"$BuildPackContent" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
    } else {
        Add-WindowsDriver -Driver "$BuildPackContent" -Recurse -Path "$MountDirectory" -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
    }
}
function Add-OSDBuildPackOSExtraFiles {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackOSExtraFiles: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-OSDBuildPackOSExtraFiles.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Get-ChildItem "$BuildPackContent" *.* -File -Recurse | Select-Object -Property FullName | foreach {Write-Host "$($_.FullName)" -ForegroundColor DarkGray}

    robocopy "$BuildPackContent" "$MountDirectory" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
}
function Add-OSDBuildPackOSPoshMods {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackOSPoshMods: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-OSDBuildPackOSPoshMods.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Get-ChildItem "$BuildPackContent" *.* -File -Recurse | Select-Object -Property FullName | foreach {Write-Host "$($_.FullName)" -ForegroundColor DarkGray}

    robocopy "$BuildPackContent" "$MountDirectory\Program Files\WindowsPowerShell\Modules" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
}
function Add-OSDBuildPackOSRegistry {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent,

        [switch]$ShowRegContent
    )

    #======================================================================================
    #   Test-OSDBuildPackOSRegistry
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackOSRegistry: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }

    #======================================================================================
    #   Mount-OfflineRegistryHives
    #======================================================================================
    if (($MountDirectory) -and (Test-Path "$MountDirectory" -ErrorAction SilentlyContinue)) {
        if (Test-Path "$MountDirectory\Users\Default\NTUser.dat") {
            Write-Verbose "Loading Offline Registry Hive Default User" 
            Start-Process reg -ArgumentList "load HKLM\OfflineDefaultUser $MountDirectory\Users\Default\NTUser.dat" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\DEFAULT") {
            Write-Verbose "Loading Offline Registry Hive DEFAULT" 
            Start-Process reg -ArgumentList "load HKLM\OfflineDefault $MountDirectory\Windows\System32\Config\DEFAULT" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\SOFTWARE") {
            Write-Verbose "Loading Offline Registry Hive SOFTWARE" 
            Start-Process reg -ArgumentList "load HKLM\OfflineSoftware $MountDirectory\Windows\System32\Config\SOFTWARE" -Wait -WindowStyle Hidden -ErrorAction Stop
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\SYSTEM") {
            Write-Verbose "Loading Offline Registry Hive SYSTEM" 
            Start-Process reg -ArgumentList "load HKLM\OfflineSystem $MountDirectory\Windows\System32\Config\SYSTEM" -Wait -WindowStyle Hidden -ErrorAction Stop
        }
        $OSDBuildPackTemp = "$env:TEMP\$(Get-Random)"
        if (!(Test-Path $OSDBuildPackTemp)) {New-Item -Path "$OSDBuildPackTemp" -ItemType Directory -Force | Out-Null}
    }

    #======================================================================================
    #   Get-RegFiles
    #======================================================================================
    [array]$BuildPackContentFiles = @()
    [array]$BuildPackContentFiles = Get-ChildItem "$BuildPackContent" *.reg -Recurse | Select-Object -Property Name, BaseName, Extension, Directory, FullName

    #======================================================================================
    #	Add-OSDBuildPackOSRegistryFiles
    #======================================================================================
    foreach ($OSDRegistryRegFile in $BuildPackContentFiles) {
        $OSDRegistryImportFile = $OSDRegistryRegFile.FullName

        if ($MountDirectory) {
            $RegFileContent = Get-Content -Path $OSDRegistryImportFile
            $OSDRegistryImportFile = "$OSDBuildPackTemp\$($OSDRegistryRegFile.BaseName).reg"

            $RegFileContent = $RegFileContent -replace 'HKEY_CURRENT_USER','HKEY_LOCAL_MACHINE\OfflineDefaultUser'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SOFTWARE','HKEY_LOCAL_MACHINE\OfflineSoftware'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SYSTEM','HKEY_LOCAL_MACHINE\OfflineSystem'
            $RegFileContent = $RegFileContent -replace 'HKEY_USERS\\.DEFAULT','HKEY_LOCAL_MACHINE\OfflineDefault'
            $RegFileContent | Set-Content -Path $OSDRegistryImportFile -Force
        }

        Write-Host "$OSDRegistryImportFile"  -ForegroundColor DarkGray
        if ($ShowRegContent.IsPresent){
            $OSDBuildPackRegFileContent = @()
            $OSDBuildPackRegFileContent = Get-Content -Path $OSDRegistryImportFile
            foreach ($Line in $OSDBuildPackRegFileContent) {
                Write-Host "$Line" -ForegroundColor Gray
            }
        }
        Start-Process reg -ArgumentList ('import',"`"$OSDRegistryImportFile`"") -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
    }
    
    #======================================================================================
    #	Remove-OSDBuildPackTemp
    #======================================================================================
    if ($MountDirectory) {
        if (Test-Path $OSDBuildPackTemp) {Remove-Item -Path "$OSDBuildPackTemp" -Recurse -Force | Out-Null}
    }

    #======================================================================================
    #	Dismount-RegistryHives
    #======================================================================================
    Dismount-OSDOfflineRegistry -MountPath $MountDirectory
}
function Add-OSDBuildPackOSScripts {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   TEST
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackOSScripts: Unable to locate content in $BuildPackContent"
        Return
    }
    else {Write-Host "$BuildPackContent" -ForegroundColor Cyan}
    #======================================================================================
    #   BUILD
    #======================================================================================
    $BuildPackOSScripts = Get-ChildItem "$BuildPackContent" *.ps1 -File -Recurse | Select-Object -Property FullName
    foreach ($BuildPackOSScript in $BuildPackOSScripts) {
        Write-Host "$($BuildPackOSScript.FullName)" -ForegroundColor DarkGray
        Invoke-Expression "& '$($BuildPackOSScript.FullName)'"
    }
}
function Add-OSDBuildPackPEADK {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackPEADK: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $ADKFiles = Get-ChildItem "$BuildPackContent\*" -Include *.cab -File | Sort-Object Length -Descending | Select-Object Name, FullName
    $ADKFilesSub = Get-ChildItem "$BuildPackContent\*\*" -Include *.cab -File -Recurse | Sort-Object Length -Descending | Select-Object Name, FullName

    foreach ($ADKFile in $ADKFiles) {
        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-BuildPackPEADK-$($ADKFile.Name).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        
        Write-Host "$($ADKFile.FullName)" -ForegroundColor DarkGray
        Add-WindowsPackage -PackagePath "$($ADKFile.FullName)" -Path "$MountWinPE" -LogPath "$CurrentLog" | Out-Null
        Add-WindowsPackage -PackagePath "$($ADKFile.FullName)" -Path "$MountWinRE" -LogPath "$CurrentLog" | Out-Null
        Add-WindowsPackage -PackagePath "$($ADKFile.FullName)" -Path "$MountWinSE" -LogPath "$CurrentLog" | Out-Null
    }

    foreach ($ADKFile in $ADKFilesSub) {
        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-BuildPackPEADK-$($ADKFile.Name).log"
        Write-Verbose "CurrentLog: $CurrentLog"

        Write-Host "$($ADKFile.FullName)" -ForegroundColor DarkGray
        Add-WindowsPackage -PackagePath "$($ADKFile.FullName)" -Path "$MountWinPE" -LogPath "$CurrentLog" | Out-Null
        Add-WindowsPackage -PackagePath "$($ADKFile.FullName)" -Path "$MountWinRE" -LogPath "$CurrentLog" | Out-Null
        Add-WindowsPackage -PackagePath "$($ADKFile.FullName)" -Path "$MountWinSE" -LogPath "$CurrentLog" | Out-Null
    }
}
function Add-OSDBuildPackPEDaRT {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   TEST
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\Tools$($OSArchitecture).cab")) {
        Write-Verbose "Add-OSDBuildPackPEDaRT: Unable to locate content in $BuildPackContent"
        Return
    }
    else {Write-Host "$BuildPackContent\Tools$($OSArchitecture).cab" -ForegroundColor Cyan}
    #======================================================================================
    #   BUILD
    #======================================================================================
    $MicrosoftDartCab = "$BuildPackContent\Tools$($OSArchitecture).cab"

    expand.exe "$MicrosoftDartCab" -F:*.* "$MountWinPE" | Out-Null
    if (Test-Path "$MountWinPE\Windows\System32\winpeshl.ini") {Remove-Item -Path "$MountWinPE\Windows\System32\winpeshl.ini" -Force}
    #===================================================================================================
    expand.exe "$MicrosoftDartCab" -F:*.* "$MountWinRE" | Out-Null
    (Get-Content "$MountWinRE\Windows\System32\winpeshl.ini") | ForEach-Object {$_ -replace '-prompt','-network'} | Out-File "$MountWinRE\Windows\System32\winpeshl.ini"
    #===================================================================================================
    expand.exe "$MicrosoftDartCab" -F:*.* "$MountWinSE" | Out-Null
    if (Test-Path "$MountWinSE\Windows\System32\winpeshl.ini") {Remove-Item -Path "$MountWinSE\Windows\System32\winpeshl.ini" -Force}

    $MicrosoftDartConfig = $(Join-Path $(Split-Path "$MicrosoftDartCab") 'DartConfig.dat')
    if (Test-Path $MicrosoftDartConfig) {
        Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinPE\Windows\System32\DartConfig.dat" -Force
        Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinSE\Windows\System32\DartConfig.dat" -Force
        Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinRE\Windows\System32\DartConfig.dat" -Force
    }
    
    $MicrosoftDartConfig = $(Join-Path $(Split-Path "$MicrosoftDartCab") 'DartConfig8.dat')
    if (Test-Path $MicrosoftDartConfig) {
        Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinPE\Windows\System32\DartConfig.dat" -Force
        Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinSE\Windows\System32\DartConfig.dat" -Force
        Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinRE\Windows\System32\DartConfig.dat" -Force
    }
}
function Add-OSDBuildPackPEDrivers {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackPEDrivers: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-OSDBuildPackPEDrivers.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Get-ChildItem "$BuildPackContent" *.inf -File -Recurse | Select-Object -Property FullName | foreach {Write-Host "$($_.FullName)" -ForegroundColor DarkGray}

    if ($OSMajorVersion -eq 6) {
        dism /Image:"$MountWinPE" /Add-Driver /Driver:"$BuildPackContent" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
        dism /Image:"$MountWinRE" /Add-Driver /Driver:"$BuildPackContent" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
        dism /Image:"$MountWinSE" /Add-Driver /Driver:"$BuildPackContent" /Recurse /ForceUnsigned /LogPath:"$CurrentLog"
    } else {
        Add-WindowsDriver -Driver "$BuildPackContent" -Recurse -Path "$MountWinPE" -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
        Add-WindowsDriver -Driver "$BuildPackContent" -Recurse -Path "$MountWinRE" -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
        Add-WindowsDriver -Driver "$BuildPackContent" -Recurse -Path "$MountWinSE" -ForceUnsigned -LogPath "$CurrentLog" | Out-Null
    }
}
function Add-OSDBuildPackPEExtraFiles {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackPEExtraFiles: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-OSDBuildPackPEExtraFiles.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Get-ChildItem "$BuildPackContent" *.* -File -Recurse | Select-Object -Property FullName | foreach {Write-Host "$($_.FullName)" -ForegroundColor DarkGray}

    robocopy "$BuildPackContent" "$MountWinPE" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    robocopy "$BuildPackContent" "$MountWinRE" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    robocopy "$BuildPackContent" "$MountWinSE" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
}
function Add-OSDBuildPackPEPoshMods {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   Test
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackPEPoshMods: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }
    #======================================================================================
    #   Import
    #======================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-OSDBuildPackPEPoshMods.log"
    Write-Verbose "CurrentLog: $CurrentLog"

    Get-ChildItem "$BuildPackContent" *.* -File -Recurse | Select-Object -Property FullName | foreach {Write-Host "$($_.FullName)" -ForegroundColor DarkGray}

    robocopy "$BuildPackContent" "$MountWinPE\Program Files\WindowsPowerShell\Modules" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    robocopy "$BuildPackContent" "$MountWinRE\Program Files\WindowsPowerShell\Modules" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    robocopy "$BuildPackContent" "$MountWinSE\Program Files\WindowsPowerShell\Modules" *.* /e /ndl /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
}
function Add-OSDBuildPackPERegistry {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent,
        [switch]$ShowRegContent
    )
    #======================================================================================
    #   Test-OSDBuildPackPERegistry
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackPERegistry: Unable to locate content in $BuildPackContent"
        Return
    } else {
        Write-Host "$BuildPackContent" -ForegroundColor Cyan
    }

    #======================================================================================
    #   Mount-OfflineRegistryHives
    #======================================================================================
    if (($MountWinPE) -and (Test-Path "$MountWinPE" -ErrorAction SilentlyContinue)) {
        Mount-OSDOfflineRegistryPE -MountPath $MountWinPE
    } else {Return}
    $OSDBuildPackTemp = "$env:TEMP\$(Get-Random)"
    if (!(Test-Path $OSDBuildPackTemp)) {New-Item -Path "$OSDBuildPackTemp" -ItemType Directory -Force | Out-Null}

    #======================================================================================
    #   Get-RegFiles
    #======================================================================================
    [array]$BuildPackContentFiles = @()
    [array]$BuildPackContentFiles = Get-ChildItem "$BuildPackContent" *.reg -Recurse | Select-Object -Property Name, BaseName, Extension, Directory, FullName

    #======================================================================================
    #	Add-OSDBuildPackPERegistryFiles
    #======================================================================================
    foreach ($OSDRegistryRegFile in $BuildPackContentFiles) {
        $OSDRegistryImportFile = $OSDRegistryRegFile.FullName

        if ($MountWinPE) {
            $RegFileContent = Get-Content -Path $OSDRegistryImportFile
            $OSDRegistryImportFile = "$OSDBuildPackTemp\$($OSDRegistryRegFile.BaseName).reg"

            $RegFileContent = $RegFileContent -replace 'HKEY_CURRENT_USER','HKEY_LOCAL_MACHINE\OfflineDefaultUser'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SOFTWARE','HKEY_LOCAL_MACHINE\OfflineSoftware'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SYSTEM','HKEY_LOCAL_MACHINE\OfflineSystem'
            $RegFileContent = $RegFileContent -replace 'HKEY_USERS\\.DEFAULT','HKEY_LOCAL_MACHINE\OfflineDefault'
            $RegFileContent | Set-Content -Path $OSDRegistryImportFile -Force
        }

        Write-Host "$OSDRegistryImportFile"  -ForegroundColor DarkGray
        if ($ShowRegContent.IsPresent){
            $OSDBuildPackRegFileContent = @()
            $OSDBuildPackRegFileContent = Get-Content -Path $OSDRegistryImportFile
            foreach ($Line in $OSDBuildPackRegFileContent) {
                Write-Host "$Line" -ForegroundColor Gray
            }
        }
        Start-Process reg -ArgumentList ('import',"`"$OSDRegistryImportFile`"") -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
    }
    
    #======================================================================================
    #	Remove-OSDBuildPackTemp
    #======================================================================================
    if ($MountWinPE) {
        if (Test-Path $OSDBuildPackTemp) {Remove-Item -Path "$OSDBuildPackTemp" -Recurse -Force | Out-Null}
    }
    #======================================================================================
    #	Dismount-RegistryHives
    #======================================================================================
    Dismount-OSDOfflineRegistry -MountPath $MountWinPE
    #======================================================================================
    #   Mount-OfflineRegistryHives
    #======================================================================================
    if (($MountWinRE) -and (Test-Path "$MountWinRE" -ErrorAction SilentlyContinue)) {
        Mount-OSDOfflineRegistryPE -MountPath $MountWinRE
    } else {Return}
    $OSDBuildPackTemp = "$env:TEMP\$(Get-Random)"
    if (!(Test-Path $OSDBuildPackTemp)) {New-Item -Path "$OSDBuildPackTemp" -ItemType Directory -Force | Out-Null}

    #======================================================================================
    #   Get-RegFiles
    #======================================================================================
    [array]$BuildPackContentFiles = @()
    [array]$BuildPackContentFiles = Get-ChildItem "$BuildPackContent" *.reg -Recurse | Select-Object -Property Name, BaseName, Extension, Directory, FullName

    #======================================================================================
    #	Add-OSDBuildPackPERegistryFiles
    #======================================================================================
    foreach ($OSDRegistryRegFile in $BuildPackContentFiles) {
        $OSDRegistryImportFile = $OSDRegistryRegFile.FullName

        if ($MountWinRE) {
            $RegFileContent = Get-Content -Path $OSDRegistryImportFile
            $OSDRegistryImportFile = "$OSDBuildPackTemp\$($OSDRegistryRegFile.BaseName).reg"

            $RegFileContent = $RegFileContent -replace 'HKEY_CURRENT_USER','HKEY_LOCAL_MACHINE\OfflineDefaultUser'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SOFTWARE','HKEY_LOCAL_MACHINE\OfflineSoftware'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SYSTEM','HKEY_LOCAL_MACHINE\OfflineSystem'
            $RegFileContent = $RegFileContent -replace 'HKEY_USERS\\.DEFAULT','HKEY_LOCAL_MACHINE\OfflineDefault'
            $RegFileContent | Set-Content -Path $OSDRegistryImportFile -Force
        }

        Write-Host "$OSDRegistryImportFile"  -ForegroundColor DarkGray
        if ($ShowRegContent.IsPresent){
            $OSDBuildPackRegFileContent = @()
            $OSDBuildPackRegFileContent = Get-Content -Path $OSDRegistryImportFile
            foreach ($Line in $OSDBuildPackRegFileContent) {
                Write-Host "$Line" -ForegroundColor Gray
            }
        }
        Start-Process reg -ArgumentList ('import',"`"$OSDRegistryImportFile`"") -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
    }
    
    #======================================================================================
    #	Remove-OSDBuildPackTemp
    #======================================================================================
    if ($MountWinRE) {
        if (Test-Path $OSDBuildPackTemp) {Remove-Item -Path "$OSDBuildPackTemp" -Recurse -Force | Out-Null}
    }
    #======================================================================================
    #	Dismount-RegistryHives
    #======================================================================================
    Dismount-OSDOfflineRegistry -MountPath $MountWinRE
        #======================================================================================
    #   Mount-OfflineRegistryHives
    #======================================================================================
    if (($MountWinSE) -and (Test-Path "$MountWinSE" -ErrorAction SilentlyContinue)) {
        Mount-OSDOfflineRegistryPE -MountPath $MountWinSE
    } else {Return}
    $OSDBuildPackTemp = "$env:TEMP\$(Get-Random)"
    if (!(Test-Path $OSDBuildPackTemp)) {New-Item -Path "$OSDBuildPackTemp" -ItemType Directory -Force | Out-Null}

    #======================================================================================
    #   Get-RegFiles
    #======================================================================================
    [array]$BuildPackContentFiles = @()
    [array]$BuildPackContentFiles = Get-ChildItem "$BuildPackContent" *.reg -Recurse | Select-Object -Property Name, BaseName, Extension, Directory, FullName

    #======================================================================================
    #	Add-OSDBuildPackPERegistryFiles
    #======================================================================================
    foreach ($OSDRegistryRegFile in $BuildPackContentFiles) {
        $OSDRegistryImportFile = $OSDRegistryRegFile.FullName

        if ($MountWinSE) {
            $RegFileContent = Get-Content -Path $OSDRegistryImportFile
            $OSDRegistryImportFile = "$OSDBuildPackTemp\$($OSDRegistryRegFile.BaseName).reg"

            $RegFileContent = $RegFileContent -replace 'HKEY_CURRENT_USER','HKEY_LOCAL_MACHINE\OfflineDefaultUser'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SOFTWARE','HKEY_LOCAL_MACHINE\OfflineSoftware'
            $RegFileContent = $RegFileContent -replace 'HKEY_LOCAL_MACHINE\\SYSTEM','HKEY_LOCAL_MACHINE\OfflineSystem'
            $RegFileContent = $RegFileContent -replace 'HKEY_USERS\\.DEFAULT','HKEY_LOCAL_MACHINE\OfflineDefault'
            $RegFileContent | Set-Content -Path $OSDRegistryImportFile -Force
        }

        Write-Host "$OSDRegistryImportFile"  -ForegroundColor DarkGray
        if ($ShowRegContent.IsPresent){
            $OSDBuildPackRegFileContent = @()
            $OSDBuildPackRegFileContent = Get-Content -Path $OSDRegistryImportFile
            foreach ($Line in $OSDBuildPackRegFileContent) {
                Write-Host "$Line" -ForegroundColor Gray
            }
        }
        Start-Process reg -ArgumentList ('import',"`"$OSDRegistryImportFile`"") -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
    }
    
    #======================================================================================
    #	Remove-OSDBuildPackTemp
    #======================================================================================
    if ($MountWinSE) {
        if (Test-Path $OSDBuildPackTemp) {Remove-Item -Path "$OSDBuildPackTemp" -Recurse -Force | Out-Null}
    }
    #======================================================================================
    #	Dismount-RegistryHives
    #======================================================================================
    Dismount-OSDOfflineRegistry -MountPath $MountWinSE
}
function Add-OSDBuildPackPEScripts {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$BuildPackContent
    )
    #======================================================================================
    #   TEST
    #======================================================================================
    if (!(Test-Path "$BuildPackContent\*")) {
        Write-Verbose "Add-OSDBuildPackPEScripts: Unable to locate content in $BuildPackContent"
        Return
    }
    else {Write-Host "$BuildPackContent" -ForegroundColor Cyan}
    #======================================================================================
    #   BUILD
    #======================================================================================
    $BuildPackPEScripts = Get-ChildItem "$BuildPackContent" *.ps1 -File -Recurse | Select-Object -Property FullName
    foreach ($BuildPackPEScript in $BuildPackPEScripts) {
        Write-Host "$($BuildPackPEScript.FullName)" -ForegroundColor DarkGray
        Invoke-Expression "& '$($BuildPackPEScript.FullName)'"
    }
}
function Add-WindowsPackageOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    #===================================================================================================
    #   Task
    #===================================================================================================
    if ([string]::IsNullOrWhiteSpace($Packages)) {Return}
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Add Packages"
    foreach ($PackagePath in $Packages) {
        Write-Host "$OSDBuilderContent\$PackagePath" -ForegroundColor DarkGray
        Try {
            Add-WindowsPackage -PackagePath "$OSDBuilderContent\$PackagePath" -Path "$MountDirectory" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Add-WindowsPackageOS.log" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
}
function Backup-AutoExtraFilesOS {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Backup Auto Extra Files to $OSMediaPath\WinPE\AutoExtraFiles"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $AEFLog = "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Backup-AutoExtraFilesOS.log"
    Write-Verbose "$AEFLog"

    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" cacls.exe* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" choice.exe* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    #robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" cleanmgr.exe* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" comp.exe*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" defrag*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" djoin*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" forfiles*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" getmac*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" makecab.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" msinfo32.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" nslookup.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" systeminfo.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" tskill.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" winver.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
   
    #AeroLite Theme
    robocopy "$MountDirectory\Windows\Resources" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\Resources" aerolite*.* /s /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\Resources" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\Resources" shellstyle*.* /s /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    
    # BCP47
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" bcp47*.dll /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    
    # Browse Dialog
    robocopy "$MountDirectory\Windows\Resources\Themes\aero\shell\normalcolor" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" shellstyle*.* /s /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" explorerframe*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" StructuredQuery*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" edputil*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null

    # Magnify
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" magnify*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" magnification*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    
    # On Screen Keyboard
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" osk*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    
    # RDP
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" mstsc*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" pdh.dll* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" srpapi.dll* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    
    # Shutdown
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" shutdown.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" shutdownext.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" shutdownux.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null

    # Wireless
    # http://www.scconfigmgr.com/2018/03/06/build-a-winpe-with-wireless-support/
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" dmcmnutils*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
    robocopy "$MountDirectory\Windows\System32" "$OSMediaPath\WinPE\AutoExtraFiles\Windows\System32" mdmregistration*.* /s /xd rescache servicing /ndl /b /np /ts /tee /r:0 /w:0 /log+:"$AEFLog" | Out-Null
}
function Copy-MediaLanguageSources {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($LanguageCopySources)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Language Sources"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($LanguageSource in $LanguageCopySources) {
        $CurrentLanguageSource = Get-OSMedia -Revision OK | Where-Object {$_.OSMFamily -eq $LanguageSource} | Select-Object -Property FullName
        Write-Host "Copying Language Resources from $($CurrentLanguageSource.FullName)" -ForegroundColor DarkGray
        robocopy "$($CurrentLanguageSource.FullName)\OS" "$OS" *.* /e /xf *.wim /ndl /xc /xn /xo /xf /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Copy-MediaLanguageSources.log" | Out-Null
    }
    #===================================================================================================
}
function Copy-MediaOperatingSystem {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "MEDIA: Copy Operating System to $WorkingPath"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Copy-Item -Path "$OSMediaPath\*" -Destination "$WorkingPath" -Exclude ('*.wim','*.iso','*.vhd','*.vhx') -Recurse -Force | Out-Null
    if (Test-Path "$WorkingPath\ISO") {Remove-Item -Path "$WorkingPath\ISO" -Force -Recurse | Out-Null}
    if (Test-Path "$WorkingPath\VHD") {Remove-Item -Path "$WorkingPath\VHD" -Force -Recurse | Out-Null}
    Copy-Item -Path "$OSMediaPath\OS\sources\install.wim" -Destination "$WimTemp\install.wim" -Force | Out-Null
    Copy-Item -Path "$OSMediaPath\WinPE\*.wim" -Destination "$WimTemp" -Exclude boot.wim -Force | Out-Null
}
function Disable-WindowsOptionalFeatureOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($DisableFeature)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Disable Windows Optional Feature"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($FeatureName in $DisableFeature) {
        Write-Host $FeatureName -ForegroundColor DarkGray
        Try {
            Disable-WindowsOptionalFeature -FeatureName $FeatureName -Path "$MountDirectory" -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Disable-WindowsOptionalFeature.log" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
    #===================================================================================================
}
function Dismount-InstallwimOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Dismount from $MountDirectory"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    if ($WaitDismount.IsPresent){[void](Read-Host 'Press Enter to Continue')}
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dismount-WindowsImage.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Start-Sleep -Seconds 10
    try {
        Dismount-WindowsImage -Path "$MountDirectory" -Save -LogPath "$CurrentLog" -ErrorAction SilentlyContinue | Out-Null
    }
    catch {
        Write-Warning "Could not dismount Install.wim ... Waiting 30 seconds ..."
        Start-Sleep -Seconds 30
        Dismount-WindowsImage -Path "$MountDirectory" -Save -LogPath "$CurrentLog" | Out-Null
    }
    #===================================================================================================
}
function Dismount-OSDOfflineRegistry {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$MountPath
    )
    #======================================================================================
    #	Dismount-RegistryHives
    #======================================================================================
    if (($MountPath) -and (Test-Path "$MountPath" -ErrorAction SilentlyContinue)) {
        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Verbose "Unloading Registry HKLM\OfflineDefaultUser" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefaultUser" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Verbose "Unloading Registry HKLM\OfflineDefault" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefault" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Verbose "Unloading Registry HKLM\OfflineSoftware" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineSoftware" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Verbose "Unloading Registry HKLM\OfflineSystem" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineSystem" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }

        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Verbose "Unloading Registry HKLM\OfflineDefaultUser (Second Attempt)" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefaultUser" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Verbose "Unloading Registry HKLM\OfflineDefault (Second Attempt)" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefault" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Verbose "Unloading Registry HKLM\OfflineSoftware (Second Attempt)" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineSoftware" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Verbose "Unloading Registry HKLM\OfflineSystem (Second Attempt)" 
            Start-Process reg -ArgumentList "unload HKLM\OfflineSystem" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }

        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Warning "HKLM:\OfflineDefaultUser could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Warning "HKLM:\OfflineDefault could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Warning "HKLM:\OfflineSoftware could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Warning "HKLM:\OfflineSystem could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
    }
}
function Dismount-WimsPE {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Dismount-WimsPE"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Start-Sleep -Seconds 10
    
    Write-Verbose "$MountWinPE"
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dismount-WimsPE-WinPE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    try {
        Dismount-WindowsImage -Path "$MountWinPE" -Save -LogPath "$CurrentLog" -ErrorAction SilentlyContinue | Out-Null
    }
    catch {
        Write-Warning "Could not dismount WinPE ... Waiting 30 seconds ..."
        Start-Sleep -Seconds 30
        Dismount-WindowsImage -Path "$MountWinPE" -Save -LogPath "$CurrentLog" | Out-Null
    }
    
    Write-Verbose "$MountWinRE"
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dismount-WimsPE-WinRE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    try {
        Dismount-WindowsImage -Path "$MountWinRE" -Save -LogPath "$CurrentLog" -ErrorAction SilentlyContinue | Out-Null
    }
    catch {
        Write-Warning "Could not dismount WinRE ... Waiting 30 seconds ..."
        Start-Sleep -Seconds 30
        Dismount-WindowsImage -Path "$MountWinRE" -Save -LogPath "$CurrentLog" | Out-Null
    }
    
    Write-Verbose "$MountWinSE"
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dismount-WimsPE-WinSE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    try {
        Dismount-WindowsImage -Path "$MountWinSE" -Save -LogPath "$CurrentLog" -ErrorAction SilentlyContinue | Out-Null
    }
    catch {
        Write-Warning "Could not dismount WinSE ... Waiting 30 seconds ..."
        Start-Sleep -Seconds 30
        Dismount-WindowsImage -Path "$MountWinSE" -Save -LogPath "$CurrentLog" | Out-Null
    }
    #===================================================================================================
}
function Enable-NetFXOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($EnableNetFX3 -ne $true) {Return}
    if ($OSMajorVersion -ne 10) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Enable NetFX 3.5"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Enable-NetFXOS.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Try {
        Enable-WindowsOptionalFeature -Path "$MountDirectory" -FeatureName NetFX3 -All -LimitAccess -Source "$OS\sources\sxs" -LogPath "$CurrentLog" | Out-Null
    }
    Catch {
        $ErrorMessage = $_.Exception.Message
        Write-Warning "$ErrorMessage"
    }
    #===================================================================================================
    #   Post Action
    #===================================================================================================
    Update-DotNetOS -Force
    Update-CumulativeOS -Force
    #===================================================================================================
}
function Enable-WindowsOptionalFeatureOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($EnableFeature)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Enable Windows Optional Feature"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($FeatureName in $EnableFeature) {
        Write-Host $FeatureName -ForegroundColor DarkGray
        Try {
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Enable-WindowsOptionalFeatureOS.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            Enable-WindowsOptionalFeature -FeatureName $FeatureName -Path "$MountDirectory" -All -LogPath "$CurrentLog" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
    #===================================================================================================
    #   Post Action
    #===================================================================================================
    Update-CumulativeOS -Force
    Invoke-DismCleanupImage
    #===================================================================================================
}
function Expand-DaRTPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($WinPEDaRT)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    $MicrosoftDartCab = "$OSDBuilderContent\$WinPEDaRT"
    Write-Host -ForegroundColor Green "Microsoft DaRT: $MicrosoftDartCab"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    if (Test-Path "$MicrosoftDartCab") {
        #===================================================================================================
        expand.exe "$MicrosoftDartCab" -F:*.* "$MountWinPE" | Out-Null
        if (Test-Path "$MountWinPE\Windows\System32\winpeshl.ini") {Remove-Item -Path "$MountWinPE\Windows\System32\winpeshl.ini" -Force}
        #===================================================================================================
        expand.exe "$MicrosoftDartCab" -F:*.* "$MountWinRE" | Out-Null
        (Get-Content "$MountWinRE\Windows\System32\winpeshl.ini") | ForEach-Object {$_ -replace '-prompt','-network'} | Out-File "$MountWinRE\Windows\System32\winpeshl.ini"
        #===================================================================================================
        expand.exe "$MicrosoftDartCab" -F:*.* "$MountWinSE" | Out-Null
        if (Test-Path "$MountWinSE\Windows\System32\winpeshl.ini") {Remove-Item -Path "$MountWinSE\Windows\System32\winpeshl.ini" -Force}

        $MicrosoftDartConfig = $(Join-Path $(Split-Path "$MicrosoftDartCab") 'DartConfig.dat')
        if (Test-Path $MicrosoftDartConfig) {
            Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinPE\Windows\System32\DartConfig.dat" -Force
            Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinSE\Windows\System32\DartConfig.dat" -Force
            Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinRE\Windows\System32\DartConfig.dat" -Force
        }
        
        $MicrosoftDartConfig = $(Join-Path $(Split-Path "$MicrosoftDartCab") 'DartConfig8.dat')
        if (Test-Path $MicrosoftDartConfig) {
            Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinPE\Windows\System32\DartConfig.dat" -Force
            Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinSE\Windows\System32\DartConfig.dat" -Force
            Copy-Item -Path $MicrosoftDartConfig -Destination "$MountWinRE\Windows\System32\DartConfig.dat" -Force
        }
        #===================================================================================================
    } else {Write-Warning "Microsoft DaRT do not exist in $MicrosoftDartCab"}
}
function Export-InstallwimOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Export to $OS\sources\install.wim"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$WimTemp\install.wim" -SourceIndex 1 -DestinationImagePath "$OS\sources\install.wim" -LogPath "$CurrentLog" | Out-Null
}
function Export-PEBootWim {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Rebuild $OSMediaPath\OS\sources\boot.wim"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinPE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\WimTemp\winpe.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\boot.wim" -LogPath "$CurrentLog" | Out-Null
    
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinSE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\WimTemp\winse.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\boot.wim" -Setbootable -LogPath "$CurrentLog" | Out-Null
    Copy-Item -Path "$OSMediaPath\WinPE\boot.wim" -Destination "$OSMediaPath\OS\sources\boot.wim" -Force | Out-Null
}
function Export-PEWims {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Export WIMs to $OSMediaPath\WinPE"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinPE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\WimTemp\winpe.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\winpe.wim" -LogPath "$CurrentLog" | Out-Null
    
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinRE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\WimTemp\winre.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\winre.wim" -LogPath "$CurrentLog" | Out-Null

    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinSE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\WimTemp\winse.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\winse.wim" -LogPath "$CurrentLog" | Out-Null
}
function Export-SessionsXmlOS {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    Write-Verbose "$OSMediaPath\Sessions.xml"
    Copy-Item "$OSMediaPath\Sessions.xml" "$OSMediaPath\info\Sessions.xml" -Force | Out-Null

    [xml]$SessionsXML = Get-Content -Path "$OSMediaPath\info\Sessions.xml"

    $Sessions = $SessionsXML.SelectNodes('Sessions/Session') | ForEach-Object {
        New-Object -Type PSObject -Property @{
            Id = $_.Tasks.Phase.package.id
            KBNumber = $_.Tasks.Phase.package.name
            TargetState = $_.Tasks.Phase.package.targetState
            Client = $_.Client
            Complete = $_.Complete
            Status = $_.Status
        }
    }
    
    $Sessions = $Sessions | Where-Object {$_.Id -like "Package*"}
    $Sessions = $Sessions | Select-Object -Property Id, KBNumber, TargetState, Client, Status, Complete | Sort-Object Complete -Descending

    $Sessions | Out-File "$OSMediaPath\Sessions.txt"
    $Sessions | Out-File "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Sessions.txt"
    $Sessions | Export-Clixml -Path "$OSMediaPath\info\xml\Sessions.xml"
    $Sessions | Export-Clixml -Path "$OSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Sessions.xml"
    $Sessions | ConvertTo-Json | Out-File "$OSMediaPath\info\json\Sessions.json"
    $Sessions | ConvertTo-Json | Out-File "$OSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Sessions.json"

    Remove-Item "$OSMediaPath\Sessions.xml" -Force | Out-Null
}
function Get-FeatureUpdateDownloads {
    $FeatureUpdateDownloads = @()
    $FeatureUpdateDownloads = Get-OSDSUS FeatureUpdate
<#     $CatalogsXmls = @()
    $CatalogsXmls = Get-ChildItem "$($MyInvocation.MyCommand.Module.ModuleBase)\CatalogsESD\*" -Include *.xml
    foreach ($CatalogsXml in $CatalogsXmls) {
        $FeatureUpdateDownloads += Import-Clixml -Path "$($CatalogsXml.FullName)"
    } #>
    #===================================================================================================
    #   Get Downloadeds
    #===================================================================================================
    foreach ($Download in $FeatureUpdateDownloads) {
        $FullUpdatePath = "$OSDBuilderPath\Media\$($Download.FileName)"
        if (Test-Path $FullUpdatePath) {
            $Download.OSDStatus = "Downloaded"
        }
    }
    #===================================================================================================
    #   Return
    #===================================================================================================
    $FeatureUpdateDownloads = $FeatureUpdateDownloads | Select-Object -Property * | Sort-Object -Property CreationDate -Descending
    Return $FeatureUpdateDownloads
}
function Get-OSBuildTask {
    [CmdletBinding()]
    Param (
        [switch]$GridView
    )

    Begin {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) BEGIN"

        #===================================================================================================
        Write-Verbose '19.1.1 Initialize OSDBuilder'
        #===================================================================================================
        Get-OSDBuilder -CreatePaths -HideDetails

        #===================================================================================================
        Write-Verbose '19.1.1 Gather All OSBuildTask'
        #===================================================================================================
        $AllOSBuildTasks = @()
        $AllOSBuildTasks = Get-ChildItem -Path "$OSDBuilderTasks" OSBuild*.json -File | Select-Object -Property *
    }

    Process {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) PROCESS"

        $OSBuildTask = foreach ($Item in $AllOSBuildTasks) {
            #===================================================================================================
            #Write-Verbose '19.1.1 Get Windows Image Information'
            #===================================================================================================
            $OSBuildTaskPath = $($Item.FullName)
            Write-Verbose "OSBuildTask Full Path: $OSBuildTaskPath"
            $OSBTask = @()
            $OSBTask = Get-Content "$($Item.FullName)" | ConvertFrom-Json

            $OSBTaskProps = @()
            $OSBTaskProps = Get-Item "$($Item.FullName)" | Select-Object -Property *
            
            if ([System.Version]$OSBTask.TaskVersion -lt [System.Version]"19.1.3.0") {
                $ObjectProperties = @{
                    LastWriteTime       = $OSBTaskProps.LastWriteTime
                    TaskName            = $OSBTask.TaskName
                    TaskVersion         = $OSBTask.TaskVersion
                    OSMediaName         = $OSBTask.MediaName
                    FullName            = $Item.FullName
                }
                New-Object -TypeName PSObject -Property $ObjectProperties
                Write-Verbose ""
            }

            if ([System.Version]$OSBTask.TaskVersion -gt [System.Version]"19.1.3.0") {

                if ($null -eq $OSBTask.Languages) {
                    Write-Warning "Reading Task: $OSBuildTaskPath"
                    Write-Warning "Searching for OSMFamily: $($OSBTask.OSMFamily)"
                    $LangUpdate = Get-OSMedia | Where-Object {$_.OSMFamilyV1 -eq $OSBTask.OSMFamily} | Select-Object -Last 1
                    Write-Warning "Adding Language: $($LangUpdate.Languages)"
                    $OSBTask | Add-Member -Type NoteProperty -Name 'Languages' -Value "$LangUpdate.Languages"
                    $OSBTask.Languages = $LangUpdate.Languages
                    $OSBTask.OSMFamily = $OSBTask.InstallationType + " " + $OSBTask.EditionId + " " + $OSBTask.Arch + " " + [string]$OSBTask.Build + " " + $OSBTask.Languages
                    Write-Warning "Updating OSMFamily: $($OSBTask.OSMFamily)"
                    Write-Warning "Updating Task: $OSBuildTaskPath"
                    $OSBTask | ConvertTo-Json | Out-File $OSBuildTaskPath
                    Write-Host ""
                }

                $ObjectProperties = @{
                    TaskType            = $OSBTask.TaskType
                    TaskVersion         = $OSBTask.TaskVersion
                    TaskName            = $OSBTask.TaskName
                    TaskGuid            = $OSBTask.TaskGuid
                    CustomName          = $OSBTask.CustomName
                    SourceOSMedia       = $OSBTask.Name
                    ImageName           = $OSBTask.ImageName
                    Arch                = $OSBTask.Arch
                    ReleaseId           = $OSBTask.ReleaseId
                    UBR                 = $OSBTask.UBR
                    Languages           = $OSBTask.Languages
                    EditionId           = $OSBTask.EditionId
                    FullName            = $Item.FullName
                    LastWriteTime       = $OSBTaskProps.LastWriteTime
                    CreatedTime         = [datetime]$OSBTask.CreatedTime
                    ModifiedTime        = [datetime]$OSBTask.ModifiedTime
                    OSMFamily           = $OSBTask.OSMFamily
                    OSMGuid             = $OSBTask.OSMGuid
                }
                New-Object -TypeName PSObject -Property $ObjectProperties
                Write-Verbose ""
            }
        }

        #===================================================================================================
        #Write-Verbose '19.1.3 Output'
        #===================================================================================================
        if ($GridView.IsPresent) {$OSBuildTask | Select-Object TaskType,TaskVersion,TaskName,CustomName,SourceOSMedia,ImageName,Arch,ReleaseId,UBR,Languages,EditionId,FullName,LastWriteTime,OSMFamily,OSMGuid | Sort-Object TaskName | Out-GridView -PassThru -Title 'OSBuildTask'}
        else {$OSBuildTask | Select-Object TaskType,TaskVersion,TaskName,CustomName,SourceOSMedia,ImageName,Arch,ReleaseId,UBR,Languages,EditionId,FullName,LastWriteTime,OSMFamily,OSMGuid | Sort-Object TaskName }
    }

    END {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) END"
    }
}
function Get-OSDBuilderVersion {
    param (
        [Parameter(Position=1)]
        [switch]$HideDetails
    )
    $global:OSDBuilderVersion = $(Get-Module -Name OSDBuilder).Version
    if ($HideDetails -eq $false) {
        Write-Host "OSDBuilder $OSDBuilderVersion"
        Write-Host ""
    }
}
function Get-OSDUpdateDownloads {
    [CmdletBinding()]
    Param (
        [string]$OSDGuid,
        [string]$UpdateTitle,
        [switch]$Silent
    )
    #===================================================================================================
    #   Filtering
    #===================================================================================================
    if ($OSDGuid) {
        $OSDUpdateDownload = Get-OSDUpdates -Silent | Where-Object {$_.OSDGuid -eq $OSDGuid}
    } elseif ($UpdateTitle) {
        $OSDUpdateDownload = Get-OSDUpdates -Silent | Where-Object {$_.UpdateTitle -eq $UpdateTitle}
    } else {
        Break
    }
    #===================================================================================================
    #   Download
    #===================================================================================================
    foreach ($Update in $OSDUpdateDownload) {
        $DownloadPath = "$OSDBuilderPath\Content\OSDUpdate\$($Update.Catalog)\$($Update.Title)"
        $DownloadFullPath = "$DownloadPath\$($Update.FileName)"
        if (!(Test-Path $DownloadPath)) {New-Item -Path "$DownloadPath" -ItemType Directory -Force | Out-Null}
        if (!(Test-Path $DownloadFullPath)) {
            Write-Host "$DownloadFullPath"
            Write-Host "$($Update.OriginUri)" -ForegroundColor Gray
            $WebClient = New-Object System.Net.WebClient
            $WebClient.DownloadFile("$($Update.OriginUri)","$DownloadFullPath")
            #Start-BitsTransfer -Source $Update.OriginUri -Destination $DownloadFullPath
        }
    }
}
function Get-OSDUpdates {
    Param (
        [switch]$Silent
    )
    $AllOSDUpdates = @()
    if ($Silent.IsPresent) {
        $AllOSDUpdates = Get-OSDSUS Windows -Silent
    } else {
        $AllOSDUpdates = Get-OSDSUS Windows
    }
    Write-Verbose ""
<#     $CatalogsXmls = @()
    $CatalogsXmls = Get-ChildItem "$($MyInvocation.MyCommand.Module.ModuleBase)\Catalogs\*" -Include *.xml
    foreach ($CatalogsXml in $CatalogsXmls) {
        $AllOSDUpdates += Import-Clixml -Path "$($CatalogsXml.FullName)"
    } #>
    #===================================================================================================
    #   Standard Filters
    #===================================================================================================
<#     $AllOSDUpdates = $AllOSDUpdates | Where-Object {$_.FileName -notlike "*.exe"}
    $AllOSDUpdates = $AllOSDUpdates | Where-Object {$_.FileName -notlike "*.psf"}
    $AllOSDUpdates = $AllOSDUpdates | Where-Object {$_.FileName -notlike "*.txt"}
    $AllOSDUpdates = $AllOSDUpdates | Where-Object {$_.FileName -notlike "*delta.exe"}
    $AllOSDUpdates = $AllOSDUpdates | Where-Object {$_.FileName -notlike "*express.cab"}
    $AllOSDUpdates = $AllOSDUpdates | Where-Object {$_.Title -notlike "* Next *"} #>
    #===================================================================================================
    #   Get Downloaded Updates
    #===================================================================================================
    foreach ($Update in $AllOSDUpdates) {
        $FullUpdatePath = "$OSDBuilderPath\Content\OSDUpdate\$($Update.Catalog)\$($Update.Title)\$($Update.FileName)"
        if (Test-Path $FullUpdatePath) {
            $Update.OSDStatus = "Downloaded"
        }
    }
    #===================================================================================================
    #   Return
    #===================================================================================================
    $AllOSDUpdates = $AllOSDUpdates | Select-Object -Property *
    Return $AllOSDUpdates
}
function Get-OSTemplateDrivers {
    [CmdletBinding()]
    Param ()

    $DriverTemplates = @()

    #Write-Host "$OSDBuilderTemplates\Drivers\AutoApply\Global" -ForegroundColor Gray
    [array]$DriverTemplates = Get-Item "$OSDBuilderTemplates\Drivers\AutoApply\Global"

    #Write-Host "$OSDBuilderTemplates\Drivers\AutoApply\Global $OSArchitecture" -ForegroundColor Gray
    [array]$DriverTemplates += Get-Item "$OSDBuilderTemplates\Drivers\AutoApply\Global $OSArchitecture"

    #Write-Host "$OSDBuilderTemplates\Drivers\AutoApply\$UpdateOS" -ForegroundColor Gray
    [array]$DriverTemplates += Get-Item "$OSDBuilderTemplates\Drivers\AutoApply\$UpdateOS"

    if ($OSInstallationType -notlike "*Server*") {
        #Write-Host "$OSDBuilderTemplates\Drivers\AutoApply\$UpdateOS $OSArchitecture" -ForegroundColor Gray
        [array]$DriverTemplates += Get-Item "$OSDBuilderTemplates\Drivers\AutoApply\$UpdateOS $OSArchitecture"
    }
    if ($OSInstallationType -notlike "*Server*" -and $OSMajorVersion -eq 10) {
        #Write-Host "$OSDBuilderTemplates\Drivers\AutoApply\$UpdateOS $OSArchitecture $ReleaseId" -ForegroundColor Gray
        [array]$DriverTemplates += Get-Item "$OSDBuilderTemplates\Drivers\AutoApply\$UpdateOS $OSArchitecture $ReleaseId"
    }
    Return $DriverTemplates
}
function Get-OSTemplateExtraFiles {
    [CmdletBinding()]
    Param ()

    $ExtraFilesTemplates = @()

    #Write-Host "$OSDBuilderTemplates\ExtraFiles\AutoApply\Global" -ForegroundColor DarkGray
    [array]$ExtraFilesTemplates = Get-ChildItem "$OSDBuilderTemplates\ExtraFiles\AutoApply\Global" | Where-Object {$_.PSIsContainer -eq $true} 

    #Write-Host "$OSDBuilderTemplates\ExtraFiles\AutoApply\Global $OSArchitecture" -ForegroundColor DarkGray
    [array]$ExtraFilesTemplates += Get-ChildItem "$OSDBuilderTemplates\ExtraFiles\AutoApply\Global $OSArchitecture" | Where-Object {$_.PSIsContainer -eq $true} 

    #Write-Host "$OSDBuilderTemplates\ExtraFiles\AutoApply\$UpdateOS" -ForegroundColor DarkGray
    [array]$ExtraFilesTemplates += Get-ChildItem "$OSDBuilderTemplates\ExtraFiles\AutoApply\$UpdateOS" | Where-Object {$_.PSIsContainer -eq $true} 

    if ($OSInstallationType -notlike "*Server*") {
        #Write-Host "$OSDBuilderTemplates\ExtraFiles\AutoApply\$UpdateOS $OSArchitecture" -ForegroundColor DarkGray
        [array]$ExtraFilesTemplates += Get-ChildItem "$OSDBuilderTemplates\ExtraFiles\AutoApply\$UpdateOS $OSArchitecture" | Where-Object {$_.PSIsContainer -eq $true} 
    }
    if ($OSInstallationType -notlike "*Server*" -and $OSMajorVersion -eq 10) {
        #Write-Host "$OSDBuilderTemplates\ExtraFiles\AutoApply\$UpdateOS $OSArchitecture $ReleaseId" -ForegroundColor DarkGray
        [array]$ExtraFilesTemplates += Get-ChildItem "$OSDBuilderTemplates\ExtraFiles\AutoApply\$UpdateOS $OSArchitecture $ReleaseId" | Where-Object {$_.PSIsContainer -eq $true} 
    }
    Return $ExtraFilesTemplates
}
function Get-OSTemplateRegistryReg {
    [CmdletBinding()]
    Param ()

    $RegistryTemplatesRegOriginal = @()
    $RegistryTemplatesRegOriginal = Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply" *.reg -Recurse | Select-Object -Property Name, BaseName, Extension, Directory, FullName
    
    foreach ($REG in $RegistryTemplatesRegOriginal) {
        if (!(Test-Path "$($REG.FullName).Offline")) {
           Write-Host "Creating $($REG.FullName).Offline" -ForegroundColor DarkGray
           $REGContent = Get-Content -Path $REG.FullName
            $REGContent = $REGContent -replace 'HKEY_CURRENT_USER','HKEY_LOCAL_MACHINE\OfflineDefaultUser'
            $REGContent = $REGContent -replace 'HKEY_LOCAL_MACHINE\\SOFTWARE','HKEY_LOCAL_MACHINE\OfflineSoftware'
            $REGContent = $REGContent -replace 'HKEY_LOCAL_MACHINE\\SYSTEM','HKEY_LOCAL_MACHINE\OfflineSystem'
            $REGContent = $REGContent -replace 'HKEY_USERS\\.DEFAULT','HKEY_LOCAL_MACHINE\OfflineDefault'
           $REGContent | Set-Content "$($REG.FullName).Offline" -Force
        }
    }

    $RegistryTemplatesReg = @()

    #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\Global" -ForegroundColor DarkGray
    [array]$RegistryTemplatesReg = Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\Global\*" *.reg.Offline -Recurse

    #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\Global $OSArchitecture" -ForegroundColor DarkGray
    [array]$RegistryTemplatesReg += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\Global $OSArchitecture\*" *.reg.Offline -Recurse

    #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS" -ForegroundColor DarkGray
    [array]$RegistryTemplatesReg += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS\*" *.reg.Offline -Recurse

    if ($OSInstallationType -notlike "*Server*") {
        #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture" -ForegroundColor DarkGray
        [array]$RegistryTemplatesReg += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture\*" *.reg.Offline -Recurse
    }
    if ($OSInstallationType -notlike "*Server*" -and $OSMajorVersion -eq 10) {
        #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture $ReleaseId" -ForegroundColor DarkGray
        [array]$RegistryTemplatesReg += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture $ReleaseId\*" *.reg.Offline -Recurse
    }
    Return $RegistryTemplatesReg
}
function Get-OSTemplateRegistryXml {
    [CmdletBinding()]
    Param ()

    $RegistryTemplatesXml = @()

    #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\Global" -ForegroundColor DarkGray
    [array]$RegistryTemplatesXml = Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\Global\*" *.xml -Recurse

    #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\Global $OSArchitecture" -ForegroundColor DarkGray
    [array]$RegistryTemplatesXml += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\Global $OSArchitecture\*" *.xml -Recurse

    #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS" -ForegroundColor DarkGray
    [array]$RegistryTemplatesXml += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS\*" *.xml -Recurse

    if ($OSInstallationType -notlike "*Server*") {
        #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture" -ForegroundColor DarkGray
        [array]$RegistryTemplatesXml += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture\*" *.xml -Recurse
    }
    if ($OSInstallationType -notlike "*Server*" -and $OSMajorVersion -eq 10) {
        #Write-Host "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture $ReleaseId" -ForegroundColor DarkGray
        [array]$RegistryTemplatesXml += Get-ChildItem "$OSDBuilderTemplates\Registry\AutoApply\$UpdateOS $OSArchitecture $ReleaseId\*" *.xml -Recurse
    }
    Return $RegistryTemplatesXml
}
function Get-OSTemplateScripts {
    [CmdletBinding()]
    Param ()

    $ScriptTemplates = @()

    #Write-Host "$OSDBuilderTemplates\Scripts\AutoApply\Global" -ForegroundColor DarkGray
    [array]$ScriptTemplates = Get-ChildItem "$OSDBuilderTemplates\Scripts\AutoApply\Global\*" *.ps1 -Recurse

    #Write-Host "$OSDBuilderTemplates\Scripts\AutoApply\Global $OSArchitecture" -ForegroundColor DarkGray
    [array]$ScriptTemplates += Get-ChildItem "$OSDBuilderTemplates\Scripts\AutoApply\Global $OSArchitecture\*" *.ps1 -Recurse

    #Write-Host "$OSDBuilderTemplates\Scripts\AutoApply\$UpdateOS" -ForegroundColor DarkGray
    [array]$ScriptTemplates += Get-ChildItem "$OSDBuilderTemplates\Scripts\AutoApply\$UpdateOS\*" *.ps1 -Recurse

    if ($OSInstallationType -notlike "*Server*") {
        #Write-Host "$OSDBuilderTemplates\Scripts\AutoApply\$UpdateOS $OSArchitecture" -ForegroundColor DarkGray
        [array]$ScriptTemplates += Get-ChildItem "$OSDBuilderTemplates\Scripts\AutoApply\$UpdateOS $OSArchitecture\*" *.ps1 -Recurse
    }
    if ($OSInstallationType -notlike "*Server*" -and $OSMajorVersion -eq 10) {
        #Write-Host "$OSDBuilderTemplates\Scripts\AutoApply\$UpdateOS $OSArchitecture $ReleaseId" -ForegroundColor DarkGray
        [array]$ScriptTemplates += Get-ChildItem "$OSDBuilderTemplates\Scripts\AutoApply\$UpdateOS $OSArchitecture $ReleaseId\*" *.ps1 -Recurse
    }
    Return $ScriptTemplates
}
function Get-PEBuildTask {
    [CmdletBinding()]
    Param (
        [switch]$GridView
    )

    BEGIN {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) BEGIN"

        #===================================================================================================
        Write-Verbose '19.1.1 Initialize OSDBuilder'
        #===================================================================================================
        Get-OSDBuilder -CreatePaths -HideDetails

        #===================================================================================================
        Write-Verbose '19.1.1 Gather All PEBuildTask'
        #===================================================================================================
        $AllPEBuildTasks = @()
        $AllPEBuildTasks = Get-ChildItem -Path "$OSDBuilderTasks" *.json -File | Select-Object -Property *
        $AllPEBuildTasks = $AllPEBuildTasks | Where-Object {$_.Name -like "MDT*" -or $_.Name -like "Recovery*" -or $_.Name -like "WinPE*"}
    }

    PROCESS {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) PROCESS"

        $PEBuildTask = foreach ($Item in $AllPEBuildTasks) {
            #===================================================================================================
            #Write-Verbose '19.1.1 Get Windows Image Information'
            #===================================================================================================
            $PEBuildTaskPath = $($Item.FullName)
            Write-Verbose "PEBuildTask Full Path: $PEBuildTaskPath"
            
            $PEBTask = @()
            $PEBTask = Get-Content "$($Item.FullName)" | ConvertFrom-Json

            $PEBTaskProps = @()
            $PEBTaskProps = Get-Item "$($Item.FullName)" | Select-Object -Property *
            
            if ([System.Version]$PEBTask.TaskVersion -lt [System.Version]"19.1.3.0") {
                $ObjectProperties = @{
                    LastWriteTime       = $PEBTaskProps.LastWriteTime
                    TaskName            = $PEBTask.TaskName
                    TaskVersion         = $PEBTask.TaskVersion
                    Name                = $PEBTask.MediaName
                    FullName            = $Item.FullName
                }
                New-Object -TypeName PSObject -Property $ObjectProperties
                Write-Verbose ""
            }

            if ([System.Version]$PEBTask.TaskVersion -gt [System.Version]"19.1.3.0") {

                if ($null -eq $PEBTask.Languages) {
                    Write-Warning "Reading Task: $PEBuildTaskPath"
                    Write-Warning "Searching for OSMFamily: $($PEBTask.OSMFamily)"
                    $LangUpdate = Get-OSMedia | Where-Object {$_.OSMFamilyV1 -eq $PEBTask.OSMFamily} | Select-Object -Last 1
                    Write-Warning "Adding Language: $($LangUpdate.Languages)"
                    $PEBTask | Add-Member -Type NoteProperty -Name 'Languages' -Value "$LangUpdate.Languages"
                    $PEBTask.Languages = $LangUpdate.Languages
                    $PEBTask.OSMFamily = $PEBTask.InstallationType + " " + $PEBTask.EditionId + " " + $PEBTask.Arch + " " + [string]$PEBTask.Build + " " + $PEBTask.Languages
                    Write-Warning "Updating OSMFamily: $($PEBTask.OSMFamily)"
                    Write-Warning "Updating Task: $PEBuildTaskPath"
                    $PEBTask | ConvertTo-Json | Out-File $PEBuildTaskPath
                    Write-Host ""
                }

                $ObjectProperties = @{
                    TaskType            = $PEBTask.TaskType
                    TaskVersion         = $PEBTask.TaskVersion
                    TaskName            = $PEBTask.TaskName
                    TaskGuid            = $PEBTask.TaskGuid
                    CustomName          = $PEBTask.CustomName
                    SourceOSMedia       = $PEBTask.Name
                    ImageName           = $PEBTask.ImageName
                    Arch                = $PEBTask.Arch
                    ReleaseId           = $PEBTask.ReleaseId
                    UBR                 = $PEBTask.UBR
                    EditionId           = $PEBTask.EditionId
                    FullName            = $Item.FullName
                    LastWriteTime       = $PEBTaskProps.LastWriteTime
                    CreatedTime         = [datetime]$PEBTask.CreatedTime
                    ModifiedTime        = [datetime]$PEBTask.ModifiedTime
                    OSMFamily           = $PEBTask.OSMFamily
                    OSMGuid             = $PEBTask.OSMGuid
                }
                New-Object -TypeName PSObject -Property $ObjectProperties
                Write-Verbose ""
            }
        }

        #===================================================================================================
        #Write-Verbose '19.1.3 Output'
        #===================================================================================================
        if ($GridView.IsPresent) {$PEBuildTask | Select-Object TaskType,TaskVersion,TaskName,CustomName,SourceOSMedia,ImageName,Arch,ReleaseId,UBR,EditionId,FullName,LastWriteTime,OSMFamily,OSMGuid | Sort-Object TaskName | Out-GridView -PassThru -Title 'PEBuildTask'}
        else {$PEBuildTask | Select-Object TaskType,TaskVersion,TaskName,CustomName,SourceOSMedia,ImageName,Arch,ReleaseId,UBR,EditionId,FullName,LastWriteTime,OSMFamily,OSMGuid | Sort-Object TaskName }
    }

    END {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) END"
    }
}
function Get-TaskBuildPacks {
    #===================================================================================================
    #   Content Box 
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $TaskBuildPacks = Get-ChildItem -Path "$OSDBuilderPath\BuildPacks" -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name

    if ($null -eq $TaskBuildPacks) {Write-Warning "BuildPacks: No Packs exist in $OSDBuilderPath\BuildPacks"}
    else {
        if ($ExistingTask.BuildPacks) {
            foreach ($Item in $ExistingTask.BuildPacks) {
                $TaskBuildPacks = $TaskBuildPacks | Where-Object {$_.Name -ne $Item}
            }
        }
        $TaskBuildPacks = $TaskBuildPacks | Out-GridView -Title "BuildPacks: Select an OSDBuildPack to add to this Task and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $TaskBuildPacks) {Write-Host "$($Item.Name)" -ForegroundColor White}
    Return $TaskBuildPacks
}
function Get-TaskContentAddFeatureOnDemand {
    #===================================================================================================
    #   Install.Wim Features On Demand
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $FeaturesOnDemandIsoExtractDir =@()
    $FeaturesOnDemandIsoExtractDir = $ContentIsoExtract

    if ($OSMedia.InstallationType -eq 'Client') {
        if ($($OSMedia.Arch) -eq 'x64') {$FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.FullName -like "*x64*"}}
        if ($($OSMedia.Arch) -eq 'x86') {$FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.FullName -like "*x86*"}}
    }

    $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*lp.cab"}
    $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*Language-Pack*"}
    $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*Language-Interface-Pack*"}
    $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*LanguageFeatures*"}
    $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*LanguageExperiencePack*"}
    $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.FullName -notlike "*metadata*"}

    if ($OSMedia.ReleaseId -gt 1803) {
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*ActiveDirectory*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*BitLocker-Recovery*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*CertificateServices*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*DHCP-Tools*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*DNS-Tools*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*FailoverCluster*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*FileServices-Tools*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*GroupPolicy-Management*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*IPAM-Client*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*LLDP*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*NetworkController*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*NetworkLoadBalancing*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*RasCMAK*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*RasRip*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*RemoteAccess-Management*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*RemoteDesktop-Services*"}
        #$FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*Server-AppCompat*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*ServerManager-Tools*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*Shielded-VM*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*SNMP-Client*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*StorageManagement*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*StorageMigrationService*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*StorageReplica*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*SystemInsights*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*VolumeActivation*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*WMI-SNMP-Provider*"}
        $FeaturesOnDemandIsoExtractDir = $FeaturesOnDemandIsoExtractDir | Where-Object {$_.Name -notlike "*WSUS-Tools*"}
    }

    $FeaturesOnDemandUpdatesDir = @()
    if (Test-Path "$OSDBuilderContent\Updates\FeatureOnDemand") {
        $FeaturesOnDemandUpdatesDir = Get-ChildItem -Path "$OSDBuilderContent\Updates\FeatureOnDemand" *.cab -Recurse | Select-Object -Property Name, FullName
    }
    
    $AddFeatureOnDemand = [array]$FeaturesOnDemandIsoExtractDir + [array]$FeaturesOnDemandUpdatesDir

    if ($OSMedia.InstallationType -eq 'Client') {$AddFeatureOnDemand = $AddFeatureOnDemand | Where-Object {$_.FullName -notlike "*Windows Server*"}}
    if ($OSMedia.InstallationType -like "*Server*") {$AddFeatureOnDemand = $AddFeatureOnDemand | Where-Object {$_.FullName -like "*Windows Server*"}}
    if ($($OSMedia.ReleaseId)) {
        if ($($OSMedia.ReleaseId) -eq 1909) {
            $AddFeatureOnDemand = $AddFeatureOnDemand | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
        } else {
            $AddFeatureOnDemand = $AddFeatureOnDemand | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
        }
    }

    foreach ($Pack in $AddFeatureOnDemand) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $AddFeatureOnDemand) {Write-Warning "Install.wim Features On Demand: Not Found"}
    else {
        if ($ExistingTask.AddFeatureOnDemand) {
            foreach ($Item in $ExistingTask.AddFeatureOnDemand) {
                $AddFeatureOnDemand = $AddFeatureOnDemand | Where-Object {$_.FullName -ne $Item}
            }
        }
        $AddFeatureOnDemand = $AddFeatureOnDemand | Sort-Object -Property FullName | Out-GridView -Title "Install.wim Features On Demand: Select Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $AddFeatureOnDemand) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $AddFeatureOnDemand
}
function Get-TaskContentAddWindowsPackage {
    #===================================================================================================
    #   Content Packages
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $AddWindowsPackage = Get-ChildItem -Path "$OSDBuilderContent\Packages\*" -Include *.cab, *.msu -Recurse | Select-Object -Property Name, FullName
    $AddWindowsPackage = $AddWindowsPackage | Where-Object {$_.FullName -like "*$($OSMedia.Arch)*"}
    foreach ($Item in $AddWindowsPackage) {$Item.FullName = $($Item.FullName).replace("$OSDBuilderContent\",'')}

    if ($null -eq $AddWindowsPackage) {Write-Warning "Packages: To select Windows Packages, add Content to $OSDBuilderContent\Packages"}
    else {
        if ($ExistingTask.AddWindowsPackage) {
            foreach ($Item in $ExistingTask.AddWindowsPackage) {
                $AddWindowsPackage = $AddWindowsPackage | Where-Object {$_.FullName -ne $Item}
            }
        }
        $AddWindowsPackage = $AddWindowsPackage | Out-GridView -Title "Packages: Select Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $AddWindowsPackage) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $AddWindowsPackage
}
function Get-TaskContentDrivers {
    #===================================================================================================
    #   Content Drivers 
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $Drivers = Get-ChildItem -Path "$OSDBuilderContent\Drivers" -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    foreach ($Pack in $Drivers) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}

    if ($null -eq $Drivers) {Write-Warning "Drivers: To select Windows Drivers, add Content to $OSDBuilderContent\Drivers"}
    else {
        if ($ExistingTask.Drivers) {
            foreach ($Item in $ExistingTask.Drivers) {
                $Drivers = $Drivers | Where-Object {$_.FullName -ne $Item}
            }
        }
        $Drivers = $Drivers | Out-GridView -Title "Drivers: Select Driver Paths to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $Drivers) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $Drivers
}
function Get-TaskContentExtraFiles {
    #===================================================================================================
    #   Content ExtraFiles
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $ExtraFiles = Get-ChildItem -Path "$OSDBuilderContent\ExtraFiles" -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    $ExtraFiles = $ExtraFiles | Where-Object {(Get-ChildItem $_.FullName | Measure-Object).Count -gt 0}
    foreach ($Pack in $ExtraFiles) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}

    if ($null -eq $ExtraFiles) {Write-Warning "Extra Files: To select Extra Files, add Content to $OSDBuilderContent\ExtraFiles"}
    else {
        if ($ExistingTask.ExtraFiles) {
            foreach ($Item in $ExistingTask.ExtraFiles) {
                $ExtraFiles = $ExtraFiles | Where-Object {$_.FullName -ne $Item}
            }
        }
        $ExtraFiles = $ExtraFiles | Out-GridView -Title "Extra Files: Select directories to inject and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $ExtraFiles) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $ExtraFiles
}
function Get-TaskContentIsoExtract {
    [CmdletBinding()]
    Param ()
    $ContentIsoExtract = Get-ChildItem -Path "$OSDBuilderContent\IsoExtract\*" -Include *.cab, *.appx -Recurse | Select-Object -Property Name, FullName
    if ($($OSMedia.ReleaseId)) {
        if ($($OSMedia.ReleaseId) -eq 1909) {
            $AddFeatureOnDemand = $AddFeatureOnDemand | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
        } else {
            $ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
        }
    }
    foreach ($IsoExtractPackage in $ContentIsoExtract) {$IsoExtractPackage.FullName = $($IsoExtractPackage.FullName).replace("$OSDBuilderContent\",'')}

    $ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.FullName -notlike "*\arm64\*"}

    if ($($OSMedia.Arch) -eq 'x64') {$ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.Name -notlike "*x86*"}}
    if ($($OSMedia.Arch) -eq 'x64') {$ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.FullName -notlike "*\x86\*"}}

    if ($($OSMedia.Arch) -eq 'x86') {$ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.Name -notlike "*x64*"}}
    if ($($OSMedia.Arch) -eq 'x86') {$ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.Name -notlike "*amd64*"}}
    if ($($OSMedia.Arch) -eq 'x86') {$ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.FullName -notlike "*\x64\*"}}
    if ($($OSMedia.Arch) -eq 'x86') {$ContentIsoExtract = $ContentIsoExtract | Where-Object {$_.FullName -notlike "*\amd64\*"}}

    Return $ContentIsoExtract
}
function Get-TaskContentLanguageCopySources {
    #===================================================================================================
    #   Content Scripts
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $LanguageCopySources = Get-OSMedia -Revision OK
    $LanguageCopySources = $LanguageCopySources | Where-Object {$_.Arch -eq $OSMedia.Arch}
    $LanguageCopySources = $LanguageCopySources | Where-Object {$_.Build -eq $OSMedia.Build}
    $LanguageCopySources = $LanguageCopySources | Where-Object {$_.OperatingSystem -eq $OSMedia.OperatingSystem}
    $LanguageCopySources = $LanguageCopySources | Where-Object {$_.OSMFamily -ne $OSMedia.OSMFamily}

    if ($ExistingTask.LanguageCopySources) {
        foreach ($Item in $ExistingTask.LanguageCopySources) {
            $LanguageCopySources = $LanguageCopySources | Where-Object {$_.OSMFamily -ne $Item}
        }
    }
    $LanguageCopySources = $LanguageCopySources | Out-GridView -Title "SourcesLanguageCopy: Select OSMedia to copy the Language Sources and press OK (Esc or Cancel to Skip)" -PassThru

    foreach ($Item in $LanguageCopySources) {Write-Host "$($Item.OSMFamily)" -ForegroundColor White}
    Return $LanguageCopySources
}
function Get-TaskContentLanguageFeature {
    [CmdletBinding()]
    Param ()
    $LanguageFodIsoExtractDir = @()
    $LanguageFodIsoExtractDir = $ContentIsoExtract | Where-Object {$_.Name -like "*LanguageFeatures*"}
    if ($OSMedia.InstallationType -eq 'Client') {
        if ($($OSMedia.Arch) -eq 'x86') {$LanguageFodIsoExtractDir = $LanguageFodIsoExtractDir | Where-Object {$_.FullName -like "*x86*"}}
        if ($($OSMedia.Arch) -eq 'x64') {$LanguageFodIsoExtractDir = $LanguageFodIsoExtractDir | Where-Object {$_.FullName -like "*x64*" -or $_.FullName -like "*amd64*"}}
    }

    $LanguageFodUpdatesDir = @()
    if (Test-Path "$OSDBuilderContent\Updates\LanguageFeature") {
        $LanguageFodUpdatesDir = Get-ChildItem -Path "$OSDBuilderContent\Updates\LanguageFeature" *.cab -Recurse | Select-Object -Property Name, FullName
        foreach ($Package in $LanguageFodUpdatesDir) {$Package.FullName = $($Package.FullName).replace("$OSDBuilderContent\",'')}
        if ($($OSMedia.Arch) -eq 'x86') {$LanguageFodUpdatesDir = $LanguageFodUpdatesDir | Where-Object {$_.FullName -like "*x86*"}}
        if ($($OSMedia.Arch) -eq 'x64') {$LanguageFodUpdatesDir = $LanguageFodUpdatesDir | Where-Object {$_.FullName -like "*x64*" -or $_.FullName -like "*amd64*"}}
        if ($($OSMedia.ReleaseId)) {
            if ($($OSMedia.ReleaseId) -eq 1909) {
                $LanguageFodUpdatesDir = $LanguageFodUpdatesDir | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
            } else {
                $LanguageFodUpdatesDir = $LanguageFodUpdatesDir | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
            }
        }
    }

    [array]$LanguageFeature = [array]$LanguageFodIsoExtractDir + [array]$LanguageFodUpdatesDir
    if ($null -eq $LanguageFeature) {Write-Warning "Install.wim Language Features On Demand: Not Found"}
    else {
        if ($ExistingTask.LanguageFeature) {
            foreach ($Item in $ExistingTask.LanguageFeature) {
                $LanguageFeature = $LanguageFeature | Where-Object {$_.FullName -ne $Item}
            }
        }
        $LanguageFeature = $LanguageFeature | Sort-Object -Property FullName | Out-GridView -Title "Install.wim Language Features On Demand: Select Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
        if($null -eq $LanguageFeature) {Write-Warning "Install.wim Language Features On Demand: Skipping"}
    }
    foreach ($Item in $LanguageFeature) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $LanguageFeature
}
function Get-TaskContentLanguageInterfacePack {
    [CmdletBinding()]
    Param ()
    $LanguageLipIsoExtractDir = @()
    $LanguageLipIsoExtractDir = $ContentIsoExtract | Where-Object {$_.Name -like "*Language-Interface-Pack*"}
    $LanguageLipIsoExtractDir = $LanguageLipIsoExtractDir | Where-Object {$_.Name -like "*$($OSMedia.Arch)*"}

    $LanguageLipUpdatesDir = @()
    if (Test-Path "$OSDBuilderContent\Updates\LanguageInterfacePack") {
        $LanguageLipUpdatesDir = Get-ChildItem -Path "$OSDBuilderContent\Updates\LanguageInterfacePack" *.cab -Recurse | Select-Object -Property Name, FullName
        foreach ($Package in $LanguageLipUpdatesDir) {$Package.FullName = $($Package.FullName).replace("$OSDBuilderContent\",'')}
        $LanguageLipUpdatesDir = $LanguageLipUpdatesDir | Where-Object {$_.FullName -like "*$($OSMedia.Arch)*"}
        if ($($OSMedia.ReleaseId)) {
            if ($($OSMedia.ReleaseId) -eq 1909) {
                $LanguageLipUpdatesDir = $LanguageLipUpdatesDir | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
            } else {
                $LanguageLipUpdatesDir = $LanguageLipUpdatesDir | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
            }
        }
    }
    
    [array]$LanguageInterfacePack = [array]$LanguageLipIsoExtractDir + [array]$LanguageLipUpdatesDir
    if ($null -eq $LanguageInterfacePack) {Write-Warning "Install.wim Language Interface Packs: Not Found"}
    else {
        if ($ExistingTask.LanguageInterfacePack) {
            foreach ($Item in $ExistingTask.LanguageInterfacePack) {
                $LanguageInterfacePack = $LanguageInterfacePack | Where-Object {$_.FullName -ne $Item}
            }
        }
        $LanguageInterfacePack = $LanguageInterfacePack | Sort-Object -Property FullName | Out-GridView -Title "Install.wim Language Interface Packs: Select Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
        if($null -eq $LanguageInterfacePack) {Write-Warning "Install.wim Language Interface Packs: Skipping"}
    }
    foreach ($Item in $LanguageInterfacePack) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $LanguageInterfacePack
}
function Get-TaskContentLanguagePack {
    [CmdletBinding()]
    Param ()
    $LanguageLpIsoExtractDir = @()
    $LanguageLpIsoExtractDir = $ContentIsoExtract | Where-Object {$_.FullName -notlike "*FOD*"}
    $LanguageLpIsoExtractDir = $LanguageLpIsoExtractDir | Where-Object {$_.FullName -notlike "*LanguageFeatures*"}
    $LanguageLpIsoExtractDir = $LanguageLpIsoExtractDir | Where-Object {$_.FullName -like "*\langpacks\*"}
    $LanguageLpIsoExtractDir = $LanguageLpIsoExtractDir | Where-Object {$_.Name -notlike "*Language-Interface-Pack*"}

    $LanguageLpUpdatesDir = @()
    if (Test-Path "$OSDBuilderContent\Updates\LanguagePack") {
        $LanguageLpUpdatesDir = Get-ChildItem -Path "$OSDBuilderContent\Updates\LanguagePack" *.cab -Recurse | Select-Object -Property Name, FullName
        $LanguageLpUpdatesDir = $LanguageLpUpdatesDir | Where-Object {$_.FullName -like "*$($OSMedia.Arch)*"}
    }

    $LanguageLpLegacyDir = @()
    if (Test-Path "$OSDBuilderContent\LanguagePacks") {
        $LanguageLpLegacyDir = Get-ChildItem -Path "$OSDBuilderContent\LanguagePacks" *.cab -Recurse | Select-Object -Property Name, FullName
        $LanguageLpLegacyDir = $LanguageLpLegacyDir | Where-Object {$_.FullName -like "*$($OSMedia.Arch)*"}
    }

    [array]$LanguagePack = [array]$LanguageLpIsoExtractDir + [array]$LanguageLpUpdatesDir + [array]$LanguageLpLegacyDir

    if ($OSMedia.InstallationType -eq 'Client') {$LanguagePack = $LanguagePack | Where-Object {$_.FullName -notlike "*Windows Server*"}}
    if ($OSMedia.InstallationType -like "*Server*") {$LanguagePack = $LanguagePack | Where-Object {$_.FullName -like "*Windows Server*"}}
    if ($($OSMedia.ReleaseId)) {
        if ($($OSMedia.ReleaseId) -eq 1909) {
            $LanguagePack = $LanguagePack | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
        } else {
            $LanguagePack = $LanguagePack | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
        }
    }

    foreach ($Package in $LanguagePack) {$Package.FullName = $($Package.FullName).replace("$OSDBuilderContent\",'')}

    if ($null -eq $LanguagePack) {Write-Warning "Install.wim Language Packs: Not Found"}
    else {
        if ($ExistingTask.LanguagePack) {
            foreach ($Item in $ExistingTask.LanguagePack) {
                $LanguagePack = $LanguagePack | Where-Object {$_.FullName -ne $Item}
            }
        }
        $LanguagePack = $LanguagePack | Sort-Object -Property FullName | Out-GridView -Title "Install.wim Language Packs: Select Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
        if ($null -eq $LanguagePack) {Write-Warning "Install.wim Language Packs: Skipping"}
    }
    foreach ($Item in $LanguagePack) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $LanguagePack
}
function Get-TaskContentLocalExperiencePacks {
    [CmdletBinding()]
    Param ()
    $LocalExperiencePacks = $ContentIsoExtract | Where-Object {$_.FullName -like "*\LocalExperiencePack\*" -and $_.Name -like "*.appx"}
    if ($OSMedia.InstallationType -eq 'Client') {$LocalExperiencePacks = $LocalExperiencePacks | Where-Object {$_.FullName -notlike "*Server*"}}
    if ($OSMedia.InstallationType -eq 'Server') {$LocalExperiencePacks = $LocalExperiencePacks | Where-Object {$_.FullName -like "*Server*"}}
    if ($OSMedia.InstallationType -eq 'Server') {$LocalExperiencePacks = $LocalExperiencePacks | Where-Object {$_.FullName -notlike "*Windows 10*"}}

    foreach ($Pack in $LocalExperiencePacks) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $LocalExperiencePacks) {Write-Warning "Install.wim Local Experience Packs: Not Found"}
    else {
        if ($ExistingTask.LocalExperiencePacks) {
            foreach ($Item in $ExistingTask.LocalExperiencePacks) {
                $LocalExperiencePacks = $LocalExperiencePacks | Where-Object {$_.FullName -ne $Item}
            }
        }
        $LocalExperiencePacks = $LocalExperiencePacks | Sort-Object -Property FullName | Out-GridView -Title "Install.wim Local Experience Packs: Select Capabilities to apply and press OK (Esc or Cancel to Skip)" -PassThru
        if ($null -eq $LocalExperiencePacks) {Write-Warning "Install.wim Local Experience Packs: Skipping"}
    }
    foreach ($Item in $LocalExperiencePacks) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $LocalExperiencePacks
}
function Get-TaskContentScripts {
    #===================================================================================================
    #   Content Scripts
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $Scripts = Get-ChildItem -Path "$OSDBuilderContent\Scripts" *.ps1 -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($Item in $Scripts) {$Item.FullName = $($Item.FullName).replace("$OSDBuilderContent\",'')}

    if ($null -eq $Scripts) {Write-Warning "Scripts: To select PowerShell Scripts add Content to $OSDBuilderContent\Scripts"}
    else {
        if ($ExistingTask.Scripts) {
            foreach ($Item in $ExistingTask.Scripts) {
                $Scripts = $Scripts | Where-Object {$_.FullName -ne $Item}
            }
        }
        $Scripts = $Scripts | Out-GridView -Title "Scripts: Select PowerShell Scripts to execute and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $Scripts) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $Scripts
}
function Get-TaskContentStartLayoutXML {
    #===================================================================================================
    #   Content StartLayout
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $StartLayoutXML = Get-ChildItem -Path "$OSDBuilderContent\StartLayout" *.xml -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($Item in $StartLayoutXML) {$Item.FullName = $($Item.FullName).replace("$OSDBuilderContent\",'')}

    if ($null -eq $StartLayoutXML) {Write-Warning "StartLayoutXML: To select a Start Layout, add Content to $OSDBuilderContent\StartLayout"}
    else {
        if ($ExistingTask.StartLayoutXML) {
            foreach ($Item in $ExistingTask.StartLayoutXML) {
                $StartLayoutXML = $StartLayoutXML | Where-Object {$_.FullName -ne $Item}
            }
        }
        $StartLayoutXML = $StartLayoutXML | Out-GridView -Title "StartLayoutXML: Select a Start Layout XML to apply and press OK (Esc or Cancel to Skip)" -OutputMode Single
    }
    foreach ($Item in $StartLayoutXML) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $StartLayoutXML
}
function Get-TaskContentUnattendXML {
    #===================================================================================================
    #   Content Unattend
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $UnattendXML = Get-ChildItem -Path "$OSDBuilderContent\Unattend" *.xml -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($Item in $UnattendXML) {$Item.FullName = $($Item.FullName).replace("$OSDBuilderContent\",'')}
    
    if ($null -eq $UnattendXML) {Write-Warning "UnattendXML: To select an Unattend XML, add Content to $OSDBuilderContent\Unattend"}
    else {
        if ($ExistingTask.UnattendXML) {
            foreach ($Item in $ExistingTask.UnattendXML) {
                $UnattendXML = $UnattendXML | Where-Object {$_.FullName -ne $Item}
            }
        }
        $UnattendXML = $UnattendXML | Out-GridView -Title "UnattendXML: Select a Windows Unattend XML File to apply and press OK (Esc or Cancel to Skip)" -OutputMode Single
    }
    foreach ($Item in $UnattendXML) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $UnattendXML
}
function Get-TaskDisableWindowsOptionalFeature {
    #===================================================================================================
    #   DisableWindowsOptionalFeature
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    if (Test-Path "$($OSMedia.FullName)\info\xml\Get-WindowsOptionalFeature.xml") {
        $DisableWindowsOptionalFeature = Import-CliXml "$($OSMedia.FullName)\info\xml\Get-WindowsOptionalFeature.xml"
    }
    $DisableWindowsOptionalFeature = $DisableWindowsOptionalFeature | Select-Object -Property FeatureName, State | Sort-Object -Property FeatureName | Where-Object {$_.State -eq 2 -or $_.State -eq 3}
    $DisableWindowsOptionalFeature = $DisableWindowsOptionalFeature | Select-Object -Property FeatureName
    if ($ExistingTask.DisableWindowsOptionalFeature) {
        foreach ($Item in $ExistingTask.DisableWindowsOptionalFeature) {
            $DisableWindowsOptionalFeature = $DisableWindowsOptionalFeature | Where-Object {$_.FeatureName -ne $Item}
        }
    }
    $DisableWindowsOptionalFeature = $DisableWindowsOptionalFeature | Out-GridView -PassThru -Title "Disable-WindowsOptionalFeature: Select Windows Optional Features to Disable and press OK (Esc or Cancel to Skip)"
    foreach ($Item in $DisableWindowsOptionalFeature) {Write-Host "$($Item.FeatureName)" -ForegroundColor White}
    Return $DisableWindowsOptionalFeature
}
function Get-TaskEnableWindowsOptionalFeature {
    #===================================================================================================
    #   EnableWindowsOptionalFeature
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    if (Test-Path "$($OSMedia.FullName)\info\xml\Get-WindowsOptionalFeature.xml") {
        $EnableWindowsOptionalFeature = Import-CliXml "$($OSMedia.FullName)\info\xml\Get-WindowsOptionalFeature.xml"
    }
    $EnableWindowsOptionalFeature = $EnableWindowsOptionalFeature | Select-Object -Property FeatureName, State | Sort-Object -Property FeatureName | Where-Object {$_.State -eq 0}
    $EnableWindowsOptionalFeature = $EnableWindowsOptionalFeature | Select-Object -Property FeatureName
    if ($ExistingTask.EnableWindowsOptionalFeature) {
        foreach ($Item in $ExistingTask.EnableWindowsOptionalFeature) {
            $EnableWindowsOptionalFeature = $EnableWindowsOptionalFeature | Where-Object {$_.FeatureName -ne $Item}
        }
    }

    $EnableWindowsOptionalFeature = $EnableWindowsOptionalFeature | Out-GridView -PassThru -Title "Enable-WindowsOptionalFeature: Select Windows Optional Features to ENABLE and press OK (Esc or Cancel to Skip)"
    foreach ($Item in $EnableWindowsOptionalFeature) {Write-Host "$($Item.FeatureName)" -ForegroundColor White}
    Return $EnableWindowsOptionalFeature
}
function Get-TaskRemoveAppxProvisionedPackage {
    #===================================================================================================
    #   RemoveAppx
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    if ($($OSMedia.InstallationType) -eq 'Client') {
        if (Test-Path "$($OSMedia.FullName)\info\xml\Get-AppxProvisionedPackage.xml") {
            $RemoveAppxProvisionedPackage = Import-CliXml "$($OSMedia.FullName)\info\xml\Get-AppxProvisionedPackage.xml"
            $RemoveAppxProvisionedPackage = $RemoveAppxProvisionedPackage | Select-Object -Property DisplayName, PackageName
            if ($ExistingTask.RemoveAppxProvisionedPackage) {
                foreach ($Item in $ExistingTask.RemoveAppxProvisionedPackage) {
                    $RemoveAppxProvisionedPackage = $RemoveAppxProvisionedPackage | Where-Object {$_.PackageName -ne $Item}
                }
            }
            $RemoveAppxProvisionedPackage = $RemoveAppxProvisionedPackage | Out-GridView -Title "Remove-AppxProvisionedPackage: Select Packages to REMOVE and press OK (Esc or Cancel to Skip)" -PassThru
        }
        foreach ($Item in $RemoveAppxProvisionedPackage) {Write-Host "$($Item.PackageName)" -ForegroundColor White}
        Return $RemoveAppxProvisionedPackage
    } else {Write-Warning "Remove-AppxProvisionedPackage: Unsupported"}
}
function Get-TaskRemoveWindowsCapability {
    #===================================================================================================
    #   RemoveCapability
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    if (Test-Path "$($OSMedia.FullName)\info\xml\Get-WindowsCapability.xml") {
        $RemoveWindowsCapability = Import-CliXml "$($OSMedia.FullName)\info\xml\Get-WindowsCapability.xml"
        $RemoveWindowsCapability = $RemoveWindowsCapability | Where-Object {$_.State -eq 4}
        $RemoveWindowsCapability = $RemoveWindowsCapability | Select-Object -Property Name, State
        if ($ExistingTask.RemoveWindowsCapability) {
            foreach ($Item in $ExistingTask.RemoveWindowsCapability) {
                $RemoveWindowsCapability = $RemoveWindowsCapability | Where-Object {$_.Name -ne $Item}
            }
        }
        $RemoveWindowsCapability = $RemoveWindowsCapability | Out-GridView -Title "Remove-WindowsCapability: Select Windows InBox Capability to REMOVE and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $RemoveWindowsCapability) {Write-Host "$($Item.Name)" -ForegroundColor White}
    Return $RemoveWindowsCapability
}
function Get-TaskRemoveWindowsPackage {
    #===================================================================================================
    #   RemovePackage
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    if (Test-Path "$($OSMedia.FullName)\info\xml\Get-WindowsPackage.xml") {
        $RemoveWindowsPackage = Import-CliXml "$($OSMedia.FullName)\info\xml\Get-WindowsPackage.xml"
        $RemoveWindowsPackage = $RemoveWindowsPackage | Select-Object -Property PackageName
        if ($ExistingTask.RemoveWindowsPackage) {
            foreach ($Item in $ExistingTask.RemoveWindowsPackage) {
                $RemoveWindowsPackage = $RemoveWindowsPackage | Where-Object {$_.PackageName -ne $Item}
            }
        }
        $RemoveWindowsPackage = $RemoveWindowsPackage | Out-GridView -Title "Remove-WindowsPackage: Select Packages to REMOVE and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $RemoveWindowsPackage) {Write-Host "$($Item.PackageName)" -ForegroundColor White}
    Return $RemoveWindowsPackage
}
function Get-TaskWinPEADK {
    #===================================================================================================
    #   WinPE ADK
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEADK = Get-ChildItem -Path ("$OSDBuilderContent\WinPE\ADK\*","$OSDBuilderContent\ADK\*\Windows Preinstallation Environment\*\WinPE_OCs") *.cab -Recurse -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    foreach ($Pack in $WinPEADK) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    
    if ($($OSMedia.ReleaseId) -eq 1909) {
        $WinPEADK = $WinPEADK | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
    } else {
        $WinPEADK = $WinPEADK | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
    }

    if ($OSMedia.Arch -eq 'x86') {$WinPEADK = $WinPEADK | Where-Object {$_.FullName -like "*x86*"}
    } else {$WinPEADK = $WinPEADK | Where-Object {($_.FullName -like "*x64*") -or ($_.FullName -like "*amd64*")}}

    $WinPEADKIE = @()
    $WinPEADKIE = $ContentIsoExtractWinPE | Select-Object -Property Name, FullName
    [array]$WinPEADK = [array]$WinPEADK + [array]$WinPEADKIE

    if ($null -eq $WinPEADK) {Write-Warning "WinPE.wim ADK Packages: Add Content to $OSDBuilderContent\ADK"}
    else {
        if ($ExistingTask.WinPEADK) {
            foreach ($Item in $ExistingTask.WinPEADK) {
                $WinPEADK = $WinPEADK | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEADK = $WinPEADK | Out-GridView -Title "WinPE.wim ADK Packages: Select ADK Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEADK) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEADK
}
function Get-TaskWinPEADKPE {
    #===================================================================================================
    #   WinPE ADK
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEADKPE = Get-ChildItem -Path ("$OSDBuilderContent\WinPE\ADK\*","$OSDBuilderContent\ADK\*\Windows Preinstallation Environment\*\WinPE_OCs") *.cab -Recurse -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    foreach ($Pack in $WinPEADKPE) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    
    if ($($OSMedia.ReleaseId) -eq 1909) {
        $WinPEADKPE = $WinPEADKPE | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
    } else {
        $WinPEADKPE = $WinPEADKPE | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
    }

    if ($OSMedia.Arch -eq 'x86') {$WinPEADKPE = $WinPEADKPE | Where-Object {$_.FullName -like "*x86*"}
    } else {$WinPEADKPE = $WinPEADKPE | Where-Object {($_.FullName -like "*x64*") -or ($_.FullName -like "*amd64*")}}

    $WinPEADKPEIE = @()
    $WinPEADKPEIE = $ContentIsoExtractWinPE | Select-Object -Property Name, FullName
    [array]$WinPEADKPE = [array]$WinPEADKPE + [array]$WinPEADKPEIE

    if ($null -eq $WinPEADKPE) {Write-Warning "WinPE.wim ADK Packages: Add Content to $OSDBuilderContent\ADK"}
    else {
        if ($ExistingTask.WinPEADKPE) {
            foreach ($Item in $ExistingTask.WinPEADKPE) {
                $WinPEADKPE = $WinPEADKPE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEADKPE = $WinPEADKPE | Out-GridView -Title "WinPE.wim ADK Packages: Select ADK Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEADKPE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEADKPE
}
function Get-TaskWinPEADKRE {
    #===================================================================================================
    #   WinRE ADK
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEADKRE = Get-ChildItem -Path ("$OSDBuilderContent\WinPE\ADK\*","$OSDBuilderContent\ADK\*\Windows Preinstallation Environment\*\WinPE_OCs") *.cab -Recurse -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    
    foreach ($Pack in $WinPEADKRE) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}

    if ($($OSMedia.ReleaseId) -eq 1909) {
        $WinPEADKRE = $WinPEADKRE | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
    } else {
        $WinPEADKRE = $WinPEADKRE | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
    }

    if ($OSMedia.Arch -eq 'x86') {$WinPEADKRE = $WinPEADKRE | Where-Object {$_.FullName -like "*x86*"}
    } else {$WinPEADKRE = $WinPEADKRE | Where-Object {($_.FullName -like "*x64*") -or ($_.FullName -like "*amd64*")}}

    $WinPEADKREIE = @()
    $WinPEADKREIE = $ContentIsoExtractWinPE | Select-Object -Property Name, FullName
    [array]$WinPEADKRE = [array]$WinPEADKRE + [array]$WinPEADKREIE

    if ($null -eq $WinPEADKRE) {Write-Warning "WinRE.wim ADK Packages: Add Content to $OSDBuilderContent\ADK"}
    else {
        if ($ExistingTask.WinPEADKRE) {
            foreach ($Item in $ExistingTask.WinPEADKRE) {
                $WinPEADKRE = $WinPEADKRE | Where-Object {$_.FullName -ne $Item}
            }
        }
        Write-Warning "If you add too many ADK Packages to WinRE, like .Net and PowerShell"
        Write-Warning "You run a risk of your WinRE size increasing considerably"
        Write-Warning "If your MBR System or UEFI Recovery Partition are 500MB,"
        Write-Warning "your WinRE.wim should not be more than 400MB (100MB Free)"
        Write-Warning "Consider changing your Task Sequences to have a 984MB"
        Write-Warning "MBR System or UEFI Recovery Partition"
        $WinPEADKRE = $WinPEADKRE | Out-GridView -Title "WinRE.wim ADK Packages: Select ADK Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEADKRE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEADKRE
}
function Get-TaskWinPEADKSE {
    #===================================================================================================
    #   WinRE ADK
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEADKSE = Get-ChildItem -Path ("$OSDBuilderContent\WinPE\ADK\*","$OSDBuilderContent\ADK\*\Windows Preinstallation Environment\*\WinPE_OCs") *.cab -Recurse -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    foreach ($Pack in $WinPEADKSE) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}

    if ($($OSMedia.ReleaseId) -eq 1909) {
        $WinPEADKSE = $WinPEADKSE | Where-Object {$_.FullName -match '1903' -or $_.FullName -match '1909'}
    } else {
        $WinPEADKSE = $WinPEADKSE | Where-Object {$_.FullName -like "*$($OSMedia.ReleaseId)*"}
    }

    if ($OSMedia.Arch -eq 'x86') {$WinPEADKSE = $WinPEADKSE | Where-Object {$_.FullName -like "*x86*"}
    } else {$WinPEADKSE = $WinPEADKSE | Where-Object {($_.FullName -like "*x64*") -or ($_.FullName -like "*amd64*")}}

    $WinPEADKSEIE = @()
    $WinPEADKSEIE = $ContentIsoExtractWinPE | Select-Object -Property Name, FullName
    [array]$WinPEADKSE = [array]$WinPEADKSE + [array]$WinPEADKSEIE

    if ($null -eq $WinPEADKSE) {Write-Warning "WinSE.wim ADK Packages: Add Content to $OSDBuilderContent\ADK"}
    else {
        if ($ExistingTask.WinPEADKSE) {
            foreach ($Item in $ExistingTask.WinPEADKSE) {
                $WinPEADKSE = $WinPEADKSE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEADKSE = $WinPEADKSE | Out-GridView -Title "WinSE.wim ADK Packages: Select ADK Packages to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEADKSE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEADKSE
}
function Get-TaskWinPEDaRT {
    #===================================================================================================
    #   WinPE DaRT
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEDaRT = Get-ChildItem -Path ("$OSDBuilderContent\DaRT","$OSDBuilderContent\WinPE\DaRT") *.cab -Recurse -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    $WinPEDaRT = $WinPEDaRT | Where-Object {$_.FullName -like "*$($OSMedia.Arch)*"}
    foreach ($Pack in $WinPEDaRT) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEDaRT) {Write-Warning "WinPEDaRT: Add Content to $OSDBuilderContent\DaRT"}
    else {
        if ($ExistingTask.WinPEDaRT) {
            foreach ($Item in $ExistingTask.WinPEDaRT) {
                $WinPEDaRT = $WinPEDaRT | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEDaRT = $WinPEDaRT | Out-GridView -Title "WinPEDaRT: Select a WinPE DaRT Package to apply and press OK (Esc or Cancel to Skip)" -OutputMode Single
    }
    foreach ($Item in $WinPEDaRT) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEDaRT
}
function Get-TaskWinPEDrivers {
    #===================================================================================================
    #   WinPE Add-WindowsDriver
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEDrivers = Get-ChildItem -Path ("$OSDBuilderContent\Drivers","$OSDBuilderContent\WinPE\Drivers") -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    foreach ($Pack in $WinPEDrivers) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEDrivers) {Write-Warning "WinPEDrivers: To select WinPE Drivers, add Content to $OSDBuilderContent\Drivers"}
    else {
        if ($ExistingTask.WinPEDrivers) {
            foreach ($Item in $ExistingTask.WinPEDrivers) {
                $WinPEDrivers = $WinPEDrivers | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEDrivers = $WinPEDrivers | Out-GridView -Title "WinPEDrivers: Select Driver Paths to apply and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEDrivers) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEDrivers
}
function Get-TaskWinPEExtraFiles {
    #===================================================================================================
    #   WinPEExtraFiles
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEExtraFiles = Get-ChildItem -Path ("$OSDBuilderContent\ExtraFiles","$OSDBuilderContent\WinPE\ExtraFiles") -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    $WinPEExtraFiles = $WinPEExtraFiles | Where-Object {(Get-ChildItem $_.FullName | Measure-Object).Count -gt 0}
    foreach ($Pack in $WinPEExtraFiles) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEExtraFiles) {Write-Warning "WinPEExtraFiles: To select WinPE Extra Files, add Content to $OSDBuilderContent\ExtraFiles"}
    else {
        if ($ExistingTask.WinPEExtraFiles) {
            foreach ($Item in $ExistingTask.WinPEExtraFiles) {
                $WinPEExtraFiles = $WinPEExtraFiles | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEExtraFiles = $WinPEExtraFiles | Out-GridView -Title "WinPEExtraFiles: Select directories to inject and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEExtraFiles) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEExtraFiles
}
function Get-TaskWinPEExtraFilesPE {
    #===================================================================================================
    #   WinPEExtraFilesPE
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEExtraFilesPE = Get-ChildItem -Path ("$OSDBuilderContent\ExtraFiles","$OSDBuilderContent\WinPE\ExtraFiles") -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    $WinPEExtraFilesPE = $WinPEExtraFilesPE | Where-Object {(Get-ChildItem $_.FullName | Measure-Object).Count -gt 0}
    foreach ($Pack in $WinPEExtraFilesPE) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEExtraFilesPE) {Write-Warning "WinPEExtraFilesPE: To select WinPE Extra Files, add Content to $OSDBuilderContent\ExtraFiles"}
    else {
        if ($ExistingTask.WinPEExtraFilesPE) {
            foreach ($Item in $ExistingTask.WinPEExtraFilesPE) {
                $WinPEExtraFilesPE = $WinPEExtraFilesPE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEExtraFilesPE = $WinPEExtraFilesPE | Out-GridView -Title "WinPEExtraFilesPE: Select directories to inject and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEExtraFilesPE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEExtraFilesPE
}
function Get-TaskWinPEExtraFilesRE {
    #===================================================================================================
    #   WinPEExtraFilesRE
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEExtraFilesRE = Get-ChildItem -Path ("$OSDBuilderContent\ExtraFiles","$OSDBuilderContent\WinPE\ExtraFiles") -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    $WinPEExtraFilesRE = $WinPEExtraFilesRE | Where-Object {(Get-ChildItem $_.FullName | Measure-Object).Count -gt 0}
    foreach ($Pack in $WinPEExtraFilesRE) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEExtraFilesRE) {Write-Warning "WinPEExtraFilesRE: To select WinRE Extra Files, add Content to $OSDBuilderContent\ExtraFiles"}
    else {
        if ($ExistingTask.WinPEExtraFilesRE) {
            foreach ($Item in $ExistingTask.WinPEExtraFilesRE) {
                $WinPEExtraFilesRE = $WinPEExtraFilesRE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEExtraFilesRE = $WinPEExtraFilesRE | Out-GridView -Title "WinPEExtraFilesRE: Select directories to inject and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEExtraFilesRE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEExtraFilesRE
}
function Get-TaskWinPEExtraFilesSE {
    #===================================================================================================
    #   WinSE Add-ExtraFiles
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEExtraFilesSE = Get-ChildItem -Path ("$OSDBuilderContent\ExtraFiles","$OSDBuilderContent\WinPE\ExtraFiles") -Directory -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName
    $WinPEExtraFilesSE = $WinPEExtraFilesSE | Where-Object {(Get-ChildItem $_.FullName | Measure-Object).Count -gt 0}
    foreach ($Pack in $WinPEExtraFilesSE) {$Pack.FullName = $($Pack.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEExtraFilesSE) {Write-Warning "WinPEExtraFilesSE: To select WinSE Extra Files, add Content to $OSDBuilderContent\ExtraFiles"}
    else {
        if ($ExistingTask.WinPEExtraFilesSE) {
            foreach ($Item in $ExistingTask.WinPEExtraFilesSE) {
                $WinPEExtraFilesSE = $WinPEExtraFilesSE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEExtraFilesSE = $WinPEExtraFilesSE | Out-GridView -Title "WinPEExtraFilesSE: Select directories to inject and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEExtraFilesSE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEExtraFilesSE
}
function Get-TaskWinPEScripts {
    #===================================================================================================
    #   WinPE PowerShell Scripts
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEScripts = Get-ChildItem -Path ("$OSDBuilderContent\Scripts","$OSDBuilderContent\WinPE\Scripts") *.ps1 -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($TaskScript in $WinPEScripts) {$TaskScript.FullName = $($TaskScript.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEScripts) {Write-Warning "WinPE PowerShell Scripts: To select PowerShell Scripts add Content to $OSDBuilderContent\Scripts"}
    else {
        if ($ExistingTask.WinPEScripts) {
            foreach ($Item in $ExistingTask.WinPEScripts) {
                $WinPEScripts = $WinPEScripts | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEScripts = $WinPEScripts | Out-GridView -Title "WinPE PowerShell Scripts: Select PowerShell Scripts to execute and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEScripts) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEScripts
}
function Get-TaskWinPEScriptsPE {
    #===================================================================================================
    #   WinPE PowerShell Scripts
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEScriptsPE = Get-ChildItem -Path ("$OSDBuilderContent\Scripts","$OSDBuilderContent\WinPE\Scripts") *.ps1 -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($TaskScript in $WinPEScriptsPE) {$TaskScript.FullName = $($TaskScript.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEScriptsPE) {Write-Warning "WinPE PowerShell Scripts: To select PowerShell Scripts add Content to $OSDBuilderContent\Scripts"}
    else {
        if ($ExistingTask.WinPEScriptsPE) {
            foreach ($Item in $ExistingTask.WinPEScriptsPE) {
                $WinPEScriptsPE = $WinPEScriptsPE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEScriptsPE = $WinPEScriptsPE | Out-GridView -Title "WinPE PowerShell Scripts: Select PowerShell Scripts to execute and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEScriptsPE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEScriptsPE
}
function Get-TaskWinPEScriptsRE {
    #===================================================================================================
    #   WinRE PowerShell Scripts
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEScriptsRE = Get-ChildItem -Path ("$OSDBuilderContent\Scripts","$OSDBuilderContent\WinPE\Scripts") *.ps1 -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($TaskScript in $WinPEScriptsRE) {$TaskScript.FullName = $($TaskScript.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEScriptsRE) {Write-Warning "WinRE PowerShell Scripts: To select PowerShell Scripts add Content to $OSDBuilderContent\Scripts"}
    else {
        if ($ExistingTask.WinPEScriptsRE) {
            foreach ($Item in $ExistingTask.WinPEScriptsRE) {
                $WinPEScriptsRE = $WinPEScriptsRE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEScriptsRE = $WinPEScriptsRE | Out-GridView -Title "WinRE PowerShell Scripts: Select PowerShell Scripts to execute and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEScriptsRE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEScriptsRE
}
function Get-TaskWinPEScriptsSE {
    #===================================================================================================
    #   WinSE PowerShell Scripts
    #===================================================================================================
    [CmdletBinding()]
    Param ()
    $WinPEScriptsSE = Get-ChildItem -Path ("$OSDBuilderContent\Scripts","$OSDBuilderContent\WinPE\Scripts") *.ps1 -ErrorAction SilentlyContinue | Select-Object -Property Name, FullName, Length, CreationTime | Sort-Object -Property FullName
    foreach ($TaskScript in $WinPEScriptsSE) {$TaskScript.FullName = $($TaskScript.FullName).replace("$OSDBuilderContent\",'')}
    if ($null -eq $WinPEScriptsSE) {Write-Warning "WinSE PowerShell Scripts: To select PowerShell Scripts add Content to $OSDBuilderContent\Scripts"}
    else {
        if ($ExistingTask.WinPEScriptsSE) {
            foreach ($Item in $ExistingTask.WinPEScriptsSE) {
                $WinPEScriptsSE = $WinPEScriptsSE | Where-Object {$_.FullName -ne $Item}
            }
        }
        $WinPEScriptsSE = $WinPEScriptsSE | Out-GridView -Title "WinSE PowerShell Scripts: Select PowerShell Scripts to execute and press OK (Esc or Cancel to Skip)" -PassThru
    }
    foreach ($Item in $WinPEScriptsSE) {Write-Host "$($Item.FullName)" -ForegroundColor White}
    Return $WinPEScriptsSE
}
function Import-AutoExtraFilesPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($WinPEAutoExtraFiles -ne $true) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "WinPE: Import AutoExtraFiles"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Write-Host "Source: $WinPE\AutoExtraFiles" -ForegroundColor DarkGray
    $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Import-AutoExtraFilesPE.log"

    robocopy "$WinPE\AutoExtraFiles" "$MountWinPE" *.* /e /ndl /xf bcp47*.dll /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    robocopy "$WinPE\AutoExtraFiles" "$MountWinRE" *.* /e /ndl /xf bcp47*.dll /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    robocopy "$WinPE\AutoExtraFiles" "$MountWinSE" *.* /e /ndl /xf bcp47*.dll /xx /b /np /ts /tee /r:0 /w:0 /Log+:"$CurrentLog" | Out-Null
    #===================================================================================================
}
function Import-RegistryRegOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   ABORT
    #===================================================================================================
    if ([string]::IsNullOrWhiteSpace($RegistryTemplatesReg)) {Return}
    #===================================================================================================
    #   Execute
    #===================================================================================================
    if ($RegistryTemplatesReg) {
        Show-ActionTime; Write-Host -ForegroundColor Green "OS: Template Registry REG"
        #======================================================================================
        # Load Registry Hives
        #======================================================================================
        if (Test-Path "$MountDirectory\Users\Default\NTUser.dat") {
            Write-Host "Loading Offline Registry Hive Default User" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineDefaultUser $MountDirectory\Users\Default\NTUser.dat" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\DEFAULT") {
            Write-Host "Loading Offline Registry Hive DEFAULT" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineDefault $MountDirectory\Windows\System32\Config\DEFAULT" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\SOFTWARE") {
            Write-Host "Loading Offline Registry Hive SOFTWARE" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineSoftware $MountDirectory\Windows\System32\Config\SOFTWARE" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\SYSTEM") {
            Write-Host "Loading Offline Registry Hive SYSTEM" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineSystem $MountDirectory\Windows\System32\Config\SYSTEM" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        #======================================================================================
        #	Process Registry REG
        #======================================================================================
        foreach ($RegistryREG in $RegistryTemplatesReg) {
            Write-Host "Processing $($RegistryREG.FullName)"
            $REGImportContent = @()
            $REGImportContent = Get-Content -Path $RegistryREG.FullName
            foreach ($Line in $REGImportContent) {
                Write-Host "$Line" -ForegroundColor Gray
            }
            Start-Process reg -ArgumentList ('import',"`"$($RegistryREG.FullName)`"") -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        #======================================================================================
        #	Unload Registry Hives
        #======================================================================================
        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Host "Unloading Registry HKLM\OfflineDefaultUser" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefaultUser" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Host "Unloading Registry HKLM\OfflineDefault" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefault" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Host "Unloading Registry HKLM\OfflineSoftware" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSoftware" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Host "Unloading Registry HKLM\OfflineSystem" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSystem" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }

        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Host "Unloading Registry HKLM\OfflineDefaultUser (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefaultUser" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Host "Unloading Registry HKLM\OfflineDefault (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefault" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Host "Unloading Registry HKLM\OfflineSoftware (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSoftware" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Host "Unloading Registry HKLM\OfflineSystem (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSystem" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }

        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Warning "HKLM:\OfflineDefaultUser could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Warning "HKLM:\OfflineDefault could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Warning "HKLM:\OfflineSoftware could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Warning "HKLM:\OfflineSystem could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
    }
    #======================================================================================
}
function Import-RegistryXmlOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   ABORT
    #===================================================================================================
    if ([string]::IsNullOrWhiteSpace($RegistryTemplatesXml)) {Return}
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "OS: Template Registry XML"
    if ($RegistryTemplatesXml) {
        #======================================================================================
        # Load Registry Hives
        #======================================================================================
        if (Test-Path "$MountDirectory\Users\Default\NTUser.dat") {
            Write-Host "Loading Offline Registry Hive Default User" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineDefaultUser $MountDirectory\Users\Default\NTUser.dat" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\DEFAULT") {
            Write-Host "Loading Offline Registry Hive DEFAULT" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineDefault $MountDirectory\Windows\System32\Config\DEFAULT" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\SOFTWARE") {
            Write-Host "Loading Offline Registry Hive SOFTWARE" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineSoftware $MountDirectory\Windows\System32\Config\SOFTWARE" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountDirectory\Windows\System32\Config\SYSTEM") {
            Write-Host "Loading Offline Registry Hive SYSTEM" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "load HKLM\OfflineSystem $MountDirectory\Windows\System32\Config\SYSTEM" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        #======================================================================================
        #	Process Registry XML
        #======================================================================================
        foreach ($RegistryXml in $RegistryTemplatesXml) {
            $RegistrySettings = @()
            Write-Host "Processing $($RegistryXml.FullName)"

            [xml]$XmlDocument = Get-Content -Path $RegistryXml.FullName
            $nodes = $XmlDocument.SelectNodes("//*[@action]")

            foreach ($node in $nodes) {
                $NodeAction = $node.attributes['action'].value
                $NodeDefault = $node.attributes['default'].value
                $NodeHive = $node.attributes['hive'].value
                $NodeKey = $node.attributes['key'].value
                $NodeName = $node.attributes['name'].value
                $NodeType = $node.attributes['type'].value
                $NodeValue = $node.attributes['value'].value

                $obj = new-object psobject -prop @{Action=$NodeAction;Default=$NodeDefault;Hive=$NodeHive;Key=$NodeKey;Name=$NodeName;Type=$NodeType;Value=$NodeValue}
                $RegistrySettings += $obj
            }

            foreach ($RegEntry in $RegistrySettings) {
                $RegAction = $RegEntry.Action
                $RegDefault = $RegEntry.Default
                $RegHive = $RegEntry.Hive
                #$RegHive = $RegHive -replace 'HKEY_LOCAL_MACHINE','HKLM:' -replace 'HKEY_CURRENT_USER','HKCU:' -replace 'HKEY_USERS','HKU:'
                $RegKey = $RegEntry.Key
                $RegName = $RegEntry.Name
                $RegType = $RegEntry.Type
                $RegType = $RegType -replace 'REG_SZ','String'
                $RegType = $RegType -replace 'REG_DWORD','DWord'
                $RegType = $RegType -replace 'REG_QWORD','QWord'
                $RegType = $RegType -replace 'REG_MULTI_SZ','MultiString'
                $RegType = $RegType -replace 'REG_EXPAND_SZ','ExpandString'
                $RegType = $RegType -replace 'REG_BINARY','Binary'
                $RegValue = $RegEntry.Value

                if ($RegType -eq 'Binary') {
                    $RegValue = $RegValue -replace '(..(?!$))','$1,'
                    $RegValue = $RegValue.Split(',') | ForEach-Object {"0x$_"}
                }

                $RegPath = "Registry::$RegHive\$RegKey"
                $RegPath = $RegPath -replace 'HKEY_CURRENT_USER','HKEY_LOCAL_MACHINE\OfflineDefaultUser'
                $RegPath = $RegPath -replace 'HKEY_LOCAL_MACHINE\\SOFTWARE','HKEY_LOCAL_MACHINE\OfflineSoftware'
                $RegPath = $RegPath -replace 'HKEY_LOCAL_MACHINE\\SYSTEM','HKEY_LOCAL_MACHINE\OfflineSystem'
                $RegPath = $RegPath -replace 'HKEY_USERS\\.DEFAULT','HKEY_LOCAL_MACHINE\OfflineDefault'
                
                if ($RegAction -eq "D") {
                    Write-Host "Remove-ItemProperty -LiteralPath $RegPath" -ForegroundColor Red
                    if ($RegDefault -eq '0' -and $RegName -eq '' -and $RegValue -eq '') {
                        Remove-ItemProperty -LiteralPath $RegPath -Force -ErrorAction SilentlyContinue | Out-Null
                    } elseif ($RegDefault -eq '1') {
                        Write-Host "-Name '(Default)'"
                        Remove-ItemProperty -LiteralPath $RegPath -Name '(Default)' -Force -ErrorAction SilentlyContinue | Out-Null
                    } else {
                        Write-Host "-Name $RegName"
                        Remove-ItemProperty -LiteralPath $RegPath -Name $RegName -Force -ErrorAction SilentlyContinue | Out-Null
                    }
                } else {
                    if (!(Test-Path -LiteralPath $RegPath)) {
                        Write-Host "New-Item -Path $RegPath" -ForegroundColor Gray
                        New-Item -Path $RegPath -Force | Out-Null
                    }
                    if ($RegDefault -eq '1') {$RegName = '(Default)'}
                    if (!($RegType -eq '')) {
                        Write-Host "New-ItemProperty -LiteralPath $RegPath" -ForegroundColor Gray
                        Write-Host "-Name $RegName -PropertyType $RegType -Value $RegValue" -ForegroundColor DarkGray
                        New-ItemProperty -LiteralPath $RegPath -Name $RegName -PropertyType $RegType -Value $RegValue -Force | Out-Null
                    }
                }
            }
        }
        #======================================================================================
        #	Unload Registry Hives
        #======================================================================================
        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Host "Unloading Registry HKLM\OfflineDefaultUser" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefaultUser" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Host "Unloading Registry HKLM\OfflineDefault" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefault" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Host "Unloading Registry HKLM\OfflineSoftware" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSoftware" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Host "Unloading Registry HKLM\OfflineSystem" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSystem" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }

        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Host "Unloading Registry HKLM\OfflineDefaultUser (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefaultUser" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Host "Unloading Registry HKLM\OfflineDefault (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineDefault" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Host "Unloading Registry HKLM\OfflineSoftware (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSoftware" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Host "Unloading Registry HKLM\OfflineSystem (Second Attempt)" -ForegroundColor DarkGray
            Start-Process reg -ArgumentList "unload HKLM\OfflineSystem" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }

        if (Test-Path -Path "HKLM:\OfflineDefaultUser") {
            Write-Warning "HKLM:\OfflineDefaultUser could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineDefault") {
            Write-Warning "HKLM:\OfflineDefault could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineSoftware") {
            Write-Warning "HKLM:\OfflineSoftware could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
        if (Test-Path -Path "HKLM:\OfflineSystem") {
            Write-Warning "HKLM:\OfflineSystem could not be dismounted.  Open Regedit and unload the Hive manually"
            Pause
        }
    }
    #======================================================================================
}
function Invoke-DismCleanupImage {
    [CmdletBinding()]
    Param (
        [switch]$HideCleanupProgress
    )
    #19.10.14 Removed Out-Null.  Modified Warning Message
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipComponentCleanup) {Return}
    if ($OSVersion -like "6.1*") {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: DISM Cleanup-Image StartComponentCleanup ResetBase"
    #===================================================================================================
    #   Abort Pending Operations
    #===================================================================================================
    if ($OSMajorVersion -eq 10) {
        if ($(Get-WindowsCapability -Path $MountDirectory | Where-Object {$_.state -eq "*pending*"})) {
            Write-Warning "Cannot run WindowsImage Cleanup on a WIM with Pending Installations"
            Return
        }
    }
    #===================================================================================================
    #   CurrentLog
    #===================================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Invoke-DismCleanupImage.log"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    if ($HideCleanupProgress.IsPresent) {
        Write-Warning "This process will take between 5 - 200 minutes to complete, depending on the number of Updates"
        Write-Warning "Check Task Manager DISM and DISMHOST processes for activity"
        Write-Host -ForegroundColor DarkGray "                  $CurrentLog"
        Dism /Image:"$MountDirectory" /Cleanup-Image /StartComponentCleanup /ResetBase /LogPath:"$CurrentLog" | Out-Null
    } else {
        Write-Verbose "$CurrentLog"
        Dism /Image:"$MountDirectory" /Cleanup-Image /StartComponentCleanup /ResetBase /LogPath:"$CurrentLog"
    }
    #===================================================================================================
}
function Mount-InstallwimMEDIA {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "Mount Install.wim: $MountDirectory"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    if (!(Test-Path "$MountDirectory")) {New-Item "$MountDirectory" -ItemType Directory -Force | Out-Null}

    if ($InstallWimType -eq "esd") {
        Write-Host -ForegroundColor Gray "                  Image: Mount $TempESD (Index 1) to $MountDirectory"
        Mount-WindowsImage -ImagePath "$TempESD" -Index '1' -Path "$MountDirectory" -ReadOnly | Out-Null
    } else {
        Write-Host -ForegroundColor Gray "                  Image: Mount $OSImagePath (Index $OSImageIndex) to $MountDirectory"
        Mount-WindowsImage -ImagePath "$OSImagePath" -Index $OSImageIndex -Path "$MountDirectory" -ReadOnly | Out-Null
    }
}
function Mount-InstallwimOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Mount to $MountDirectory"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Mount-WindowsImage.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Mount-WindowsImage -ImagePath "$WimTemp\install.wim" -Index 1 -Path "$MountDirectory" -LogPath "$CurrentLog" | Out-Null
}
function Mount-OSDOfflineRegistryPE {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [string]$MountPath
    )
    if (($MountPath) -and (Test-Path "$MountPath" -ErrorAction SilentlyContinue)) {
        if (Test-Path "$MountPath\Windows\ServiceProfiles\LocalService\NTUser.dat") {
            Write-Verbose "Loading Offline Registry Hive System Profile" 
            Start-Process reg -ArgumentList "load HKLM\OfflineDefaultUser $MountPath\Windows\ServiceProfiles\LocalService\NTUser.dat" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountPath\Windows\System32\Config\DEFAULT") {
            Write-Verbose "Loading Offline Registry Hive DEFAULT" 
            Start-Process reg -ArgumentList "load HKLM\OfflineDefault $MountPath\Windows\System32\Config\DEFAULT" -Wait -WindowStyle Hidden -ErrorAction SilentlyContinue
        }
        if (Test-Path "$MountPath\Windows\System32\Config\SOFTWARE") {
            Write-Verbose "Loading Offline Registry Hive SOFTWARE" 
            Start-Process reg -ArgumentList "load HKLM\OfflineSoftware $MountPath\Windows\System32\Config\SOFTWARE" -Wait -WindowStyle Hidden -ErrorAction Stop
        }
        if (Test-Path "$MountPath\Windows\System32\Config\SYSTEM") {
            Write-Verbose "Loading Offline Registry Hive SYSTEM" 
            Start-Process reg -ArgumentList "load HKLM\OfflineSystem $MountPath\Windows\System32\Config\SYSTEM" -Wait -WindowStyle Hidden -ErrorAction Stop
        }
    }
}
function Mount-WinPEwim {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Mount WinPE.wim to $MountWinPE"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Mount-WindowsImage-WinPE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Mount-WindowsImage -ImagePath "$OSMediaPath\WimTemp\winpe.wim" -Index 1 -Path "$MountWinPE" -LogPath "$CurrentLog" | Out-Null
}
function Mount-WinREwim {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Mount WinRE.wim to $MountWinRE"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Mount-WindowsImage-WinRE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Mount-WindowsImage -ImagePath "$OSMediaPath\WimTemp\winre.wim" -Index 1 -Path "$MountWinRE" -LogPath "$CurrentLog" | Out-Null
}
function Mount-WinSEwim {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Mount WinSE.wim to $MountWinSE"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Mount-WindowsImage-WinSE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Mount-WindowsImage -ImagePath "$OSMediaPath\WimTemp\winse.wim" -Index 1 -Path "$MountWinSE" -LogPath "$CurrentLog" | Out-Null
}
function New-DirectoriesOSMedia {
    [CmdletBinding()]
    Param ()
    if (!(Test-Path "$Info"))           {New-Item "$Info" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$Info\json"))      {New-Item "$Info\json" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$Info\logs"))      {New-Item "$Info\logs" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$Info\xml"))       {New-Item "$Info\xml" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$OS"))             {New-Item "$OS" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$WinPE"))          {New-Item "$WinPE" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$PEInfo"))         {New-Item "$PEInfo" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$PEInfo\json"))    {New-Item "$PEInfo\json" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$PEInfo\logs"))    {New-Item "$PEInfo\logs" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$PEInfo\xml"))     {New-Item "$PEInfo\xml" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$WimTemp"))        {New-Item "$WimTemp" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$MountDirectory")) {New-Item "$MountDirectory" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$MountWinPE"))     {New-Item "$MountWinPE" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$MountWinSE"))     {New-Item "$MountWinSE" -ItemType Directory -Force | Out-Null}
    if (!(Test-Path "$MountWinRE"))     {New-Item "$MountWinRE" -ItemType Directory -Force | Out-Null}
}
function New-OSDBuilderCreatePaths {
    [CmdletBinding()]
    Param ()

    $OSDBuilderHomeDirectories = @(
        $OSDBuilderPath
        $OSDBuilderOSBuilds
        $OSDBuilderOSImport
        $OSDBuilderOSMedia
        $OSDBuilderPEBuilds
        $OSDBuilderTasks
        $OSDBuilderTemplates
        $OSDBuilderContent
        "$OSDBuilderContent\ADK"
        "$OSDBuilderContent\ADK\Windows 10 1903\Windows Preinstallation Environment"
        "$OSDBuilderContent\ADK\Windows 10 1909\Windows Preinstallation Environment"
        "$OSDBuilderContent\DaRT"
        "$OSDBuilderContent\DaRT\DaRT 10"
        "$OSDBuilderContent\Drivers"
        "$OSDBuilderContent\ExtraFiles"
        "$OSDBuilderContent\IsoExtract"
        "$OSDBuilderContent\IsoExtract\Windows 10 1903 FOD x64"
        "$OSDBuilderContent\IsoExtract\Windows 10 1903 FOD x64"
        "$OSDBuilderContent\IsoExtract\Windows 10 1903 Language"
        "$OSDBuilderContent\IsoExtract\Windows 10 1909 Language"
        "$OSDBuilderContent\IsoExtract\Windows Server 2019 1809 FOD x64"
        "$OSDBuilderContent\IsoExtract\Windows Server 2019 1809 Language"
        #"$OSDBuilderContent\LanguagePacks"
        "$OSDBuilderContent\Mount"
        "$OSDBuilderContent\OneDrive"
        "$OSDBuilderContent\OSDUpdate"
        "$OSDBuilderContent\Packages"
        #"$OSDBuilderContent\Packages\Win10 x64 1809"
        #"$OSDBuilderContent\Provisioning"
        #"$OSDBuilderContent\Registry"
        "$OSDBuilderContent\Scripts"
        "$OSDBuilderContent\StartLayout"
        "$OSDBuilderContent\Unattend"
        #"$OSDBuilderContent\Updates"
        #"$OSDBuilderContent\Updates\Custom"
        #"$OSDBuilderContent\WinPE"
        #"$OSDBuilderContent\WinPE\ADK\Win10 x64 1809"
        #"$OSDBuilderContent\WinPE\DaRT\DaRT 10"
        #"$OSDBuilderContent\WinPE\Drivers"
        #"$OSDBuilderContent\WinPE\Drivers\WinPE 10 x64"
        #"$OSDBuilderContent\WinPE\Drivers\WinPE 10 x86"
        #"$OSDBuilderContent\WinPE\ExtraFiles"
        #"$OSDBuilderContent\WinPE\Scripts"
    )

    foreach ($item in $OSDBuilderHomeDirectories) {
        if (!(Test-Path "$item")) {New-Item "$item" -ItemType Directory -Force | Out-Null}
    }

    if ($BuildPacksEnabled = $true) {
        $OSDBuilderHomeDirectories = @(
            $OSDBuilderBuildPacks
            "$OSDBuilderBuildPacks\_Mandatory\OSDrivers\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\OSDrivers\x64"
            "$OSDBuilderBuildPacks\_Mandatory\OSDrivers\x86"
            "$OSDBuilderBuildPacks\_Mandatory\OSExtraFiles\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\OSExtraFiles\x64"
            "$OSDBuilderBuildPacks\_Mandatory\OSExtraFiles\x86"
            "$OSDBuilderBuildPacks\_Mandatory\OSPoshMods\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\OSRegistry\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\OSRegistry\x64"
            "$OSDBuilderBuildPacks\_Mandatory\OSRegistry\x86"
            "$OSDBuilderBuildPacks\_Mandatory\OSScripts\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\OSScripts\x64"
            "$OSDBuilderBuildPacks\_Mandatory\OSScripts\x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEADK\1809 x64"
            "$OSDBuilderBuildPacks\_Mandatory\PEADK\1809 x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEADK\1903 x64"
            "$OSDBuilderBuildPacks\_Mandatory\PEADK\1903 x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEADK\1909 x64"
            "$OSDBuilderBuildPacks\_Mandatory\PEADK\1909 x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEDrivers\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\PEDrivers\x64"
            "$OSDBuilderBuildPacks\_Mandatory\PEDrivers\x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEExtraFiles\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\PEExtraFiles\x64"
            "$OSDBuilderBuildPacks\_Mandatory\PEExtraFiles\x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEPoshMods\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\PERegistry\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\PERegistry\x64"
            "$OSDBuilderBuildPacks\_Mandatory\PERegistry\x86"
            "$OSDBuilderBuildPacks\_Mandatory\PEScripts\ALL"
            "$OSDBuilderBuildPacks\_Mandatory\PEScripts\x64"
            "$OSDBuilderBuildPacks\_Mandatory\PEScripts\x86"
            "$OSDBuilderBuildPacks\_Template\OSDrivers\ALL"
            "$OSDBuilderBuildPacks\_Template\OSDrivers\x64"
            "$OSDBuilderBuildPacks\_Template\OSDrivers\x86"
            "$OSDBuilderBuildPacks\_Template\OSExtraFiles\ALL"
            "$OSDBuilderBuildPacks\_Template\OSExtraFiles\x64"
            "$OSDBuilderBuildPacks\_Template\OSExtraFiles\x86"
            "$OSDBuilderBuildPacks\_Template\OSPoshMods\ALL"
            "$OSDBuilderBuildPacks\_Template\OSRegistry\ALL"
            "$OSDBuilderBuildPacks\_Template\OSRegistry\x64"
            "$OSDBuilderBuildPacks\_Template\OSRegistry\x86"
            "$OSDBuilderBuildPacks\_Template\OSScripts\ALL"
            "$OSDBuilderBuildPacks\_Template\OSScripts\x64"
            "$OSDBuilderBuildPacks\_Template\OSScripts\x86"
            "$OSDBuilderBuildPacks\_Template\PEADK\1809 x64"
            "$OSDBuilderBuildPacks\_Template\PEADK\1809 x86"
            "$OSDBuilderBuildPacks\_Template\PEADK\1903 x64"
            "$OSDBuilderBuildPacks\_Template\PEADK\1903 x86"
            "$OSDBuilderBuildPacks\_Template\PEADK\1909 x64"
            "$OSDBuilderBuildPacks\_Template\PEADK\1909 x86"
            "$OSDBuilderBuildPacks\_Template\PEDrivers\ALL"
            "$OSDBuilderBuildPacks\_Template\PEDrivers\x64"
            "$OSDBuilderBuildPacks\_Template\PEDrivers\x86"
            "$OSDBuilderBuildPacks\_Template\PEExtraFiles\ALL"
            "$OSDBuilderBuildPacks\_Template\PEExtraFiles\x64"
            "$OSDBuilderBuildPacks\_Template\PEExtraFiles\x86"
            "$OSDBuilderBuildPacks\_Template\PEPoshMods\ALL"
            "$OSDBuilderBuildPacks\_Template\PERegistry\ALL"
            "$OSDBuilderBuildPacks\_Template\PERegistry\x64"
            "$OSDBuilderBuildPacks\_Template\PERegistry\x86"
            "$OSDBuilderBuildPacks\_Template\PEScripts\ALL"
            "$OSDBuilderBuildPacks\_Template\PEScripts\x64"
            "$OSDBuilderBuildPacks\_Template\PEScripts\x86"
        )
        foreach ($item in $OSDBuilderHomeDirectories) {
            if (!(Test-Path "$item")) {New-Item "$item" -ItemType Directory -Force | Out-Null}
        }
    }
}
function Remove-AppxProvisionedPackageOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ([string]::IsNullOrWhiteSpace($RemoveAppx)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Remove Appx Packages"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($item in $RemoveAppx) {
        Write-Host $item -ForegroundColor DarkGray
        Try {
            Remove-AppxProvisionedPackage -Path "$MountDirectory" -PackageName $item -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Remove-AppxProvisionedPackage.log" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
}
function Remove-WindowsCapabilityOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($RemoveCapability)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Remove Windows Capability"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Name in $RemoveCapability) {
        Write-Host $Name -ForegroundColor DarkGray
        Try {
            Remove-WindowsCapability -Path "$MountDirectory" -Name $Name -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Remove-WindowsCapability.log" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
}
function Remove-WindowsPackageOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ([string]::IsNullOrWhiteSpace($RemovePackage)) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Remove Windows Packages"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($PackageName in $RemovePackage) {
        Write-Host $PackageName -ForegroundColor DarkGray
        Try {
            Remove-WindowsPackage -Path "$MountDirectory" -PackageName $PackageName -LogPath "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Remove-WindowsPackage.log" | Out-Null
        }
        Catch {
            $ErrorMessage = $_.Exception.Message
            Write-Warning "$ErrorMessage"
        }
    }
}
function Rename-OSMedia {
    [CmdletBinding()]
    Param ()

    BEGIN {
        #===================================================================================================
        #   Header
        #===================================================================================================
        #   Write-Host '========================================================================================' -ForegroundColor DarkGray
        #   Write-Host -ForegroundColor Green "$($MyInvocation.MyCommand.Name) BEGIN"
        #===================================================================================================
        #   Get-OSDBuilder
        #===================================================================================================
        Get-OSDBuilder -CreatePaths -HideDetails
        #===================================================================================================
        Write-Verbose '19.1.1 Gather All OSMedia'
        #===================================================================================================
        $AllOSMedia = @()
        $AllOSMedia = Get-ChildItem -Path "$OSDBuilderOSMedia" -Directory | Select-Object -Property * | Where-Object {Test-Path $(Join-Path $_.FullName "info\xml\Get-WindowsImage.xml")}
    }

    PROCESS {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) PROCESS"

        $RenameOSMedia = foreach ($Item in $AllOSMedia) {
            #===================================================================================================
            #Write-Verbose '19.1.1 Get Windows Image Information'
            #===================================================================================================
            $RenameOSMediaPath = $($Item.FullName)
            Write-Verbose "OSMedia Full Path: $RenameOSMediaPath"
            
            $OSMWindowsImage = @()
            $OSMWindowsImage = Import-Clixml -Path "$RenameOSMediaPath\info\xml\Get-WindowsImage.xml"
            
            $OSMVersion = $($OSMWindowsImage.Version)
            Write-Verbose "Version: $OSMVersion"

            $OSMImageName = $($OSMWindowsImage.ImageName)
            Write-Verbose "ImageName: $OSMImageName"

            $OSMArch = $OSMWindowsImage.Architecture
            if ($OSMArch -eq '0') {$OSMArch = 'x86'}
            if ($OSMArch -eq '6') {$OSMArch = 'ia64'}
            if ($OSMArch -eq '9') {$OSMArch = 'x64'}
            if ($OSMArch -eq '12') {$OSMArch = 'x64 ARM'}
            Write-Verbose "Arch: $OSMArch"

            $OSMEditionId = $($OSMWindowsImage.EditionId)
            Write-Verbose "EditionId: $OSMEditionId"

            $OSMInstallationType = $($OSMWindowsImage.InstallationType)
            Write-Verbose "InstallationType: $OSMInstallationType"

            $OSMMajorVersion = $($OSMWindowsImage.MajorVersion)
            Write-Verbose "MajorVersion: $OSMMajorVersion"

            $OSMMinorVersion = $($OSMWindowsImage.MinorVersion)
            Write-Verbose "MinorVersion: $OSMMinorVersion"

            $OSMBuild = $OSMWindowsImage.Build
            Write-Verbose "Build: $OSMBuild"

            $OSMLanguages = $($OSMWindowsImage.Languages)
            Write-Verbose "Languages: $OSMLanguages"

            $OperatingSystem = ''
            if ($OSMMajorVersion -eq 6 -and $OSMInstallationType -eq 'Client') {$OperatingSystem = 'Windows 7'}
            if ($OSMMajorVersion -eq 10 -and $OSMInstallationType -eq 'Client') {$OperatingSystem = 'Windows 10'}
            if ($OSMMajorVersion -eq 10 -and $OSMInstallationType -eq 'Server' -and $OSMImageName -like "*2016*") {$OperatingSystem = 'Server 2016'}
            if ($OSMMajorVersion -eq 10 -and $OSMInstallationType -eq 'Server' -and $OSMImageName -like "*2019*") {$OperatingSystem = 'Server 2019'}

            $OSMUBR = $($OSMWindowsImage.UBR)
            Write-Verbose "UBR: $OSMUBR"
			
            #   OSMFamily V1
            $OSMFamilyV1 = $(Get-Date -Date $($OSMWindowsImage.CreatedTime)).ToString("yyyyMMddHHmmss") + $OSMEditionID
            #   OSMFamily V2
            $OSMFamily = $OSMInstallationType + " " + $OSMEditionId + " " + $OSMArch + " " + [string]$OSMBuild + " " + $OSMLanguages
            Write-Verbose "OSMFamily: $OSMFamily"

            #$OSMWindowsImage | ForEach {$_.PSObject.Properties.Remove('Guid')}

            $OSMGuid = $($OSMWindowsImage.OSMGuid)
            if (-not ($OSMGuid)) {
                $OSMGuid = $(New-Guid)
                $OSMWindowsImage | Add-Member -Type NoteProperty -Name "OSMGuid" -Value $OSMGuid
                $OSMWindowsImage | Out-File "$RenameOSMediaPath\WindowsImage.txt"
                $OSMWindowsImage | Out-File "$RenameOSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage.txt"
                $OSMWindowsImage | Export-Clixml -Path "$RenameOSMediaPath\info\xml\Get-WindowsImage.xml"
                $OSMWindowsImage | Export-Clixml -Path "$RenameOSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage.xml"
                $OSMWindowsImage | ConvertTo-Json | Out-File "$RenameOSMediaPath\info\json\Get-WindowsImage.json"
                $OSMWindowsImage | ConvertTo-Json | Out-File "$RenameOSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage.json"
                (Get-Content "$RenameOSMediaPath\WindowsImage.txt") | Where-Object {$_.Trim(" `t")} | Set-Content "$RenameOSMediaPath\WindowsImage.txt"
                Write-Verbose "Guid (New): $OSMGuid"
            } else {
                Write-Verbose "Guid: $OSMGuid"
            }

            #===================================================================================================
            #Write-Verbose '19.1.1 Gather Registry Information'
            #===================================================================================================
            $OSMRegistry = @()
            if (Test-Path "$RenameOSMediaPath\info\xml\CurrentVersion.xml") {
                Write-Verbose "Registry: $RenameOSMediaPath\info\xml\CurrentVersion.xml"
                $OSMRegistry = Import-Clixml -Path "$RenameOSMediaPath\info\xml\CurrentVersion.xml"
            } else {
                Write-Verbose "Registry: $RenameOSMediaPath\info\xml\CurrentVersion.xml (Not Found)"
            }
            [string]$OSMReleaseId = $($OSMRegistry.ReleaseId)

            if ($OSMBuild -eq 7600) {$OSMReleaseId = 7600}
            if ($OSMBuild -eq 7601) {$OSMReleaseId = 7601}
            if ($OSMBuild -eq 9600) {$OSMReleaseId = 9600}
            if ($OSMBuild -eq 10240) {$OSMReleaseId = 1507}
            if ($OSMBuild -eq 14393) {$OSMReleaseId = 1607}
            if ($OSMBuild -eq 15063) {$OSMReleaseId = 1703}
            if ($OSMBuild -eq 16299) {$OSMReleaseId = 1709}
            if ($OSMBuild -eq 17134) {$OSMReleaseId = 1803}
            if ($OSMBuild -eq 17763) {$OSMReleaseId = 1809}
            #if ($OSMBuild -eq 18362) {$OSMReleaseId = 1903}

            Write-Verbose "ReleaseId: $OSMReleaseId"

            if ($OSMReleaseId -eq 7601) {$OSMReleaseId = 'SP1'}

            $FullNameFormat = "$OSMImageName $OSMArch $OSMReleaseId $OSMUBR $($OSMWindowsImage.Languages)"

            $FullNameFormat = $FullNameFormat -replace '\(', ''
            $FullNameFormat = $FullNameFormat -replace '\)', ''

            if ($($($OSMWindowsImage.Languages).count) -eq 1) {$FullNameFormat = $FullNameFormat.replace(' en-US','')}

            if (!($Item.Name -eq $FullNameFormat)) {
                #===================================================================================================
                #Write-Verbose '19.1.1 Object Properties'
                #===================================================================================================
                $ObjectProperties = @{
                    
                    FullNameFormat      = $FullNameFormat
                    Name                = $Item.Name
                    FullName            = $Item.FullName
                }
                New-Object -TypeName PSObject -Property $ObjectProperties
                Write-Verbose ""
            }

        }

        #===================================================================================================
        #Write-Verbose '19.1.3 Output'
        #===================================================================================================
        $RenameOSMedia = $RenameOSMedia | Select-Object FullNameFormat,Name,FullName | Out-GridView -PassThru -Title 'Rename-OSMedia: Select one or more OSMedia to Rename and press OK'
        foreach ($Item in $RenameOSMedia){
            Write-Warning "Renaming $($Item.FullName) to $($Item.FullNameFormat)"
            Rename-Item -Path "$($Item.FullName)" -NewName "$($Item.FullNameFormat)" -Force
        }
    }

    END {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) END"
    }
}
function Repair-OSBuildTask {
    [CmdletBinding()]
    Param ()
    BEGIN {
        #===================================================================================================
        #   Header
        #===================================================================================================
        #   Write-Host '========================================================================================' -ForegroundColor DarkGray
        #   Write-Host -ForegroundColor Green "$($MyInvocation.MyCommand.Name) BEGIN"
        #===================================================================================================
        #   Get-OSDBuilder
        #===================================================================================================
        Get-OSDBuilder -CreatePaths -HideDetails
        #===================================================================================================
        Write-Verbose '19.1.6 Gather All OSBuildTask'
        #===================================================================================================
        $OSBuildTask = @()
        $OSBuildTask = Get-OSBuildTask | Where-Object {$null -eq $_.OSMGuid}
    }
    
    PROCESS {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        Write-Host "$($MyInvocation.MyCommand.Name) PROCESS"

        foreach ($Item in $OSBuildTask) {
            $TaskFile = Get-Item -Path "$($Item.FullName)" | Select-Object -Property *
            Write-Warning "Repair Required: $($Item.FullName)"

            #===================================================================================================
            Write-Verbose 'Read Task'
            #===================================================================================================
            $Task = @()
            $Task = Get-Content "$($Item.FullName)" | ConvertFrom-Json

            if ([System.Version]$Task.TaskVersion -gt [System.Version]"19.1.3.0") {
                Write-Warning "Error: OSBuild Task does not need a Repair . . . Exiting!"
                Return
            }
    
            Write-Host "Select the OSMedia that will be used with this OSBuild Task"
            Write-Host "Previous OSMedia: $($Task.MediaName)"
            $OSMedia = Get-OSMedia

            if ($Task.MediaName -like "*x64*") {$OSMedia = $OSMedia | Where-Object {$_.Arch -eq 'x64'}}
            if ($Task.MediaName -like "*x86*") {$OSMedia = $OSMedia | Where-Object {$_.Arch -eq 'x86'}}
            if ($Task.MediaName -like "*1511*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1511'}}
            if ($Task.MediaName -like "*1607*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1607'}}
            if ($Task.MediaName -like "*1703*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1703'}}
            if ($Task.MediaName -like "*1709*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1709'}}
            if ($Task.MediaName -like "*1803*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1803'}}
            if ($Task.MediaName -like "*1809*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1809'}}
            
            $OSMedia = $OSMedia | Out-GridView -OutputMode Single -Title "$($Task.TaskName): Select the OSMedia used with this OSBuild Task"
    
            if ($null -eq $OSMedia) {
                Write-Warning "Error: OSMedia was not selected . . . Exiting!"
                Return
            }

            Write-Host "Selected $($OSMedia.Name)"

            #===================================================================================================
            Write-Verbose '19.1.5 Create OSBuild Task'
            #===================================================================================================
            $NewTask = [ordered]@{
                "TaskType" = [string]"OSBuild";
                "TaskName" = [string]$Task.TaskName;
                "TaskVersion" = [string]$OSDBuilderVersion;
                "TaskGuid" = [string]$(New-Guid);
                "CustomName" = [string]$Task.BuildName;
    
                "OSMFamily" = [string]$OSMedia.OSMFamily;
                "OSMGuid" = [string]$OSMedia.OSMGuid;
                "Name" = [string]$OSMedia.Name;
                "ImageName" = [string]$OSMedia.ImageName;
                "Arch" = [string]$OSMedia.Arch;
                "ReleaseId" = [string]$($OSMedia.ReleaseId);
                "UBR" = [string]$OSMedia.UBR;
                "EditionId" = [string]$OSMedia.EditionId;
                "InstallationType" = [string]$OSMedia.InstallationType;
                "MajorVersion" = [string]$OSMedia.MajorVersion;
                "Build" = [string]$OSMedia.Build;
                "CreatedTime" = [datetime]$OSMedia.CreatedTime;
                "ModifiedTime" = [datetime]$OSMedia.ModifiedTime;
    
                "EnableNetFX3" = [string]$Task.EnableNetFX3;
                "StartLayoutXML" = [string]$Task.ImportStartLayout;
                "UnattendXML" = [string]$Task.UseWindowsUnattend;
                "WinPEAutoExtraFiles" = [string]"False";
                "WinPEDaRT" = [string]$Task.WinPEAddDaRT;

                "ExtraFiles" = [string[]]$Task.RobocopyExtraFiles;
                "Scripts" = [string[]]$Task.InvokeScript;
                "Drivers" = [string[]]$Task.AddWindowsDriver;
    
                "AddWindowsPackage" = [string[]]$Task.AddWindowsPackage;
                "RemoveWindowsPackage" = [string[]]$Task.RemoveWindowsPackage;
                "AddFeatureOnDemand" = [string[]]$Task.AddFeatureOnDemand;
                "EnableWindowsOptionalFeature" = [string[]]$Task.EnableWindowsOptionalFeature;
                "DisableWindowsOptionalFeature" = [string[]]$Task.DisableWindowsOptionalFeature;
                "RemoveAppxProvisionedPackage" = [string[]]$Task.RemoveAppxProvisionedPackage;
                "RemoveWindowsCapability" = [string[]]$Task.RemoveWindowsCapability;
    
                "WinPEDrivers" = [string[]]$Task.WinPEAddWindowsDriver;
                "WinPEScriptsPE" = [string[]]$Task.WinPEInvokeScriptPE;
                "WinPEScriptsRE" = [string[]]$Task.WinPEInvokeScriptRE;
                "WinPEScriptsSE" = [string[]]$Task.WinPEInvokeScriptSetup;
                "WinPEExtraFilesPE" = [string[]]$Task.WinPERobocopyExtraFilesPE;
                "WinPEExtraFilesRE" = [string[]]$Task.WinPERobocopyExtraFilesRE;
                "WinPEExtraFilesSE" = [string[]]$Task.WinPERobocopyExtraFilesSetup;
                "WinPEADKPE" = [string[]]$Task.WinPEAddADKPE;
                "WinPEADKRE" = [string[]]$Task.WinPEAddADKRE;
                "WinPEADKSE" = [string[]]$Task.WinPEAddADKSetup;
    
                "LangSetAllIntl" = [string]$Task.LangSetAllIntl;
                "LangSetInputLocale" = [string]$Task.LangSetInputLocale;
                "LangSetSKUIntlDefaults" = [string]$Task.LangSetSKUIntlDefaults;
                "LangSetSetupUILang" = [string]$Task.LangSetSetupUILang;
                "LangSetSysLocale" = [string]$Task.LangSetSysLocale;
                "LangSetUILang" = [string]$Task.LangSetUILang;
                "LangSetUILangFallback" = [string]$Task.LangSetUILangFallback;
                "LangSetUserLocale" = [string]$Task.LangSetUserLocale;
                "LanguageFeature" = [string[]]$Task.AddLanguageFeature;
                "LanguageInterfacePack" = [string[]]$Task.AddLanguageInterfacePack;
                "LanguagePack" = [string[]]$Task.AddLanguagePack;
            }
			
            #===================================================================================================
            Write-Verbose '19.1.7 Create Backup'
            #===================================================================================================
            if (!(Test-Path "$($TaskFile.Directory)\Repair")) {
                New-Item -Path "$($TaskFile.Directory)\Repair"-ItemType Directory -Force | Out-Null
            }

            if (!(Test-Path "$($TaskFile.Directory)\Repair\$($TaskFile.Name)")) {
                Write-Host "Creating Backup $($TaskFile.Directory)\Repair\$($TaskFile.Name)"
                Copy-Item -Path "$($TaskFile.FullName)" -Destination "$($TaskFile.Directory)\Repair\$($TaskFile.Name)" -Force
            }
    
            #===================================================================================================
            Write-Verbose '19.1.1 New-OSBuildTask Complete'
            #===================================================================================================
            $NewTask | ConvertTo-Json | Out-File "$($Item.FullName)" -Encoding ascii
            Write-Host "Update Complete: $($Task.TaskName)"
            Write-Host '========================================================================================' -ForegroundColor DarkGray
        }
    }

    END {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) END"
    }
}
function Repair-PEBuildTask {
    [CmdletBinding()]
    Param ()
    Begin {
        #===================================================================================================
        #   Header
        #===================================================================================================
        #   Write-Host '========================================================================================' -ForegroundColor DarkGray
        #   Write-Host -ForegroundColor Green "$($MyInvocation.MyCommand.Name) BEGIN"
        #===================================================================================================
        #   Get-OSDBuilder
        #===================================================================================================
        Get-OSDBuilder -CreatePaths -HideDetails
        #===================================================================================================
        Write-Verbose '19.1.6 Gather All PEBuildTask'
        #===================================================================================================
        $PEBuildTask = @()
        $PEBuildTask = Get-PEBuildTask | Where-Object {$null -eq $_.OSMGuid}
    }
    
    PROCESS {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        Write-Host "$($MyInvocation.MyCommand.Name) PROCESS"

        foreach ($Item in $PEBuildTask) {
            $TaskFile = Get-Item -Path "$($Item.FullName)" | Select-Object -Property *
            Write-Warning "Repair Required: $($Item.FullName)"

            #===================================================================================================
            Write-Verbose 'Read Task'
            #===================================================================================================
            $Task = @()
            $Task = Get-Content "$($Item.FullName)" | ConvertFrom-Json

            if ([System.Version]$Task.TaskVersion -gt [System.Version]"19.1.3.0") {
                Write-Warning "Error: PEBuild Task does not need a Repair . . . Exiting!"
                Return
            }
    
            Write-Host "Select the OSMedia that will be used with this PEBuild Task"
            Write-Host "Previous OSMedia: $($Task.MediaName)"
            $OSMedia = Get-OSMedia
            
            if ($Task.MediaName -like "*x64*") {$OSMedia = $OSMedia | Where-Object {$_.Arch -eq 'x64'}}
            if ($Task.MediaName -like "*x86*") {$OSMedia = $OSMedia | Where-Object {$_.Arch -eq 'x86'}}
            if ($Task.MediaName -like "*1511*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1511'}}
            if ($Task.MediaName -like "*1607*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1607'}}
            if ($Task.MediaName -like "*1703*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1703'}}
            if ($Task.MediaName -like "*1709*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1709'}}
            if ($Task.MediaName -like "*1803*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1803'}}
            if ($Task.MediaName -like "*1809*") {$OSMedia = $OSMedia | Where-Object {$_.ReleaseId -eq '1809'}}

            $OSMedia = $OSMedia | Out-GridView -OutputMode Single -Title "$($Task.TaskName): Select the OSMedia used with this PEBuild Task"
    
            if ($null -eq $OSMedia) {
                Write-Warning "Error: OSMedia was not selected . . . Exiting!"
                Return
            }

            Write-Host "Selected $($OSMedia.Name)"

            #===================================================================================================
            Write-Verbose '19.1.5 Create PEBuild Task'
            #===================================================================================================
            $NewTask = [ordered]@{
                "TaskType" = 'PEBuild'
                "TaskName" = [string]$Task.TaskName;
                "TaskVersion" = [string]$OSDBuilderVersion;
                "TaskGuid" = [string]$(New-Guid);
    
                "OSMFamily" = [string]$OSMedia.OSMFamily;
                "OSMGuid" = [string]$OSMedia.OSMGuid;
                "Name" = [string]$OSMedia.Name;
                "ImageName" = [string]$OSMedia.ImageName;
                "Arch" = [string]$OSMedia.Arch;
                "ReleaseId" = [string]$($OSMedia.ReleaseId);
                "UBR" = [string]$OSMedia.UBR;
                "EditionId" = [string]$OSMedia.EditionId;
                "InstallationType" = [string]$OSMedia.InstallationType;
                "MajorVersion" = [string]$OSMedia.MajorVersion;
                "Build" = [string]$OSMedia.Build;
                "CreatedTime" = [datetime]$OSMedia.CreatedTime;
                "ModifiedTime" = [datetime]$OSMedia.ModifiedTime;

                "WinPEOutput" = [string]$Task.PEOutput;
                "CustomName" = [string]'';
                "MDTDeploymentShare" = [string]$Task.DeploymentShare;
                "ScratchSpace" = [string]$Task.ScratchSpace;
                "SourceWim" = [string]$Task.SourceWim;
                "WinPEAutoExtraFiles" = [string]$Task.AutoExtraFiles;
                "WinPEDaRT" = [string]$Task.WinPEAddDaRT;
                "WinPEDrivers" = [string[]]$Task.WinPEAddWindowsDriver;
                "WinPEExtraFiles" = [string[]]$Task.WinPERobocopyExtraFiles;
                "WinPEScripts" = [string[]]$Task.WinPEInvokeScript;
                "WinPEADK" = [string[]]$Task.WinPEAddADK;
            }
    
            #===================================================================================================
            Write-Verbose '19.1.7 Create Backup'
            #===================================================================================================
            if (!(Test-Path "$($TaskFile.Directory)\Repair")) {
                New-Item -Path "$($TaskFile.Directory)\Repair"-ItemType Directory -Force | Out-Null
            }

            if (!(Test-Path "$($TaskFile.Directory)\Repair\$($TaskFile.Name)")) {
                Write-Host "Creating Backup $($TaskFile.Directory)\Repair\$($TaskFile.Name)"
                Copy-Item -Path "$($TaskFile.FullName)" -Destination "$($TaskFile.Directory)\Repair\$($TaskFile.Name)" -Force
            }
            
            #===================================================================================================
            Write-Verbose '19.1.7 New-PEBuildTask Complete'
            #===================================================================================================
            $NewTask | ConvertTo-Json | Out-File "$($Item.FullName)" -Encoding ascii
            Write-Host "Update Complete: $($Task.TaskName)"
            Write-Host '========================================================================================' -ForegroundColor DarkGray
        }
    }

    END {
        #Write-Host '========================================================================================' -ForegroundColor DarkGray
        #Write-Host "$($MyInvocation.MyCommand.Name) END"
    }
}
function Save-InventoryOS {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Export Inventory to $OSMediaPath"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Write-Verbose 'Save-InventoryOS'
    Write-Verbose "OSMediaPath: $OSMediaPath"

    $GetAppxProvisionedPackage = @()
    TRY {
        Write-Verbose "$OSMediaPath\AppxProvisionedPackage.txt"
        $GetAppxProvisionedPackage = Get-AppxProvisionedPackage -Path "$MountDirectory"
        $GetAppxProvisionedPackage | Out-File "$OSMediaPath\info\Get-AppxProvisionedPackage.txt"
        $GetAppxProvisionedPackage | Out-File "$OSMediaPath\AppxProvisionedPackage.txt"
        $GetAppxProvisionedPackage | Out-File "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-AppxProvisionedPackage.txt"
        $GetAppxProvisionedPackage | Export-Clixml -Path "$OSMediaPath\info\xml\Get-AppxProvisionedPackage.xml"
        $GetAppxProvisionedPackage | Export-Clixml -Path "$OSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-AppxProvisionedPackage.xml"
        $GetAppxProvisionedPackage | ConvertTo-Json | Out-File "$OSMediaPath\info\json\Get-AppxProvisionedPackage.json"
        $GetAppxProvisionedPackage | ConvertTo-Json | Out-File "$OSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-AppxProvisionedPackage.json"
    }
    CATCH {Write-Warning "Get-AppxProvisionedPackage is not supported by this Operating System"}

    $GetWindowsOptionalFeature = @()
    TRY {
        Write-Verbose "$OSMediaPath\WindowsOptionalFeature.txt"
        $GetWindowsOptionalFeature = Get-WindowsOptionalFeature -Path "$MountDirectory"
        $GetWindowsOptionalFeature | Out-File "$OSMediaPath\info\Get-WindowsOptionalFeature.txt"
        $GetWindowsOptionalFeature | Out-File "$OSMediaPath\WindowsOptionalFeature.txt"
        $GetWindowsOptionalFeature | Out-File "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsOptionalFeature.txt"
        $GetWindowsOptionalFeature | Export-Clixml -Path "$OSMediaPath\info\xml\Get-WindowsOptionalFeature.xml"
        $GetWindowsOptionalFeature | Export-Clixml -Path "$OSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsOptionalFeature.xml"
        $GetWindowsOptionalFeature | ConvertTo-Json | Out-File "$OSMediaPath\info\json\Get-WindowsOptionalFeature.json"
        $GetWindowsOptionalFeature | ConvertTo-Json | Out-File "$OSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsOptionalFeature.json"
    }
    CATCH {Write-Warning "Get-WindowsOptionalFeature is not supported by this Operating System"}

    $GetWindowsCapability = @()
    TRY {
        Write-Verbose "$OSMediaPath\WindowsCapability.txt"
        $GetWindowsCapability = Get-WindowsCapability -Path "$MountDirectory"
        $GetWindowsCapability | Out-File "$OSMediaPath\info\Get-WindowsCapability.txt"
        $GetWindowsCapability | Out-File "$OSMediaPath\WindowsCapability.txt"
        $GetWindowsCapability | Out-File "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsCapability.txt"
        $GetWindowsCapability | Export-Clixml -Path "$OSMediaPath\info\xml\Get-WindowsCapability.xml"
        $GetWindowsCapability | Export-Clixml -Path "$OSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsCapability.xml"
        $GetWindowsCapability | ConvertTo-Json | Out-File "$OSMediaPath\info\json\Get-WindowsCapability.json"
        $GetWindowsCapability | ConvertTo-Json | Out-File "$OSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsCapability.json"            
    }
    CATCH {Write-Warning "Get-WindowsCapability is not supported by this Operating System"}

    $GetWindowsPackage = @()
    TRY {
        Write-Verbose "$OSMediaPath\WindowsPackage.txt"
        $GetWindowsPackage = Get-WindowsPackage -Path "$MountDirectory"
        $GetWindowsPackage | Out-File "$OSMediaPath\info\Get-WindowsPackage.txt"
        $GetWindowsPackage | Out-File "$OSMediaPath\WindowsPackage.txt"
        $GetWindowsPackage | Out-File "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage.txt"
        $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\info\xml\Get-WindowsPackage.xml"
        $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage.xml"
        $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\info\json\Get-WindowsPackage.json"
        $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage.json"
    }
    CATCH {Write-Warning "Get-WindowsPackage is not supported by this Operating System"}
}
function Save-InventoryPE {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Export WIM Inventory to $OSMediaPath\WinPE\info"
    #===================================================================================================
    $GetWindowsImage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsImage-Boot.txt"
    $GetWindowsImage = Get-WindowsImage -ImagePath "$OSMediaPath\WinPE\boot.wim"
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsImage-Boot.txt"
    (Get-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-Boot.txt") | Where-Object {$_.Trim(" `t")} | Set-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-Boot.txt"
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-Boot.txt"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsImage-Boot.xml"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-Boot.xml"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsImage-Boot.json"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-Boot.json"

    #===================================================================================================
    Write-Verbose 'Get-WindowsImage WinPE'
    #===================================================================================================
    $GetWindowsImage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsImage-WinPE.txt"
    $GetWindowsImage = Get-WindowsImage -ImagePath "$OSMediaPath\WinPE\winpe.wim" -Index 1 | Select-Object -Property *
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsImage-WinPE.txt"
    (Get-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-WinPE.txt") | Where-Object {$_.Trim(" `t")} | Set-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-WinPE.txt"
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinPE.txt"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsImage-WinPE.xml"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinPE.xml"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsImage-WinPE.json"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinPE.json"

    #===================================================================================================
    Write-Verbose 'Get-WindowsImage WinRE'
    #===================================================================================================
    $GetWindowsImage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsImage-WinRE.txt"
    $GetWindowsImage = Get-WindowsImage -ImagePath "$OSMediaPath\WinPE\winre.wim" -Index 1 | Select-Object -Property *
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsImage-WinRE.txt"
    (Get-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-WinRE.txt") | Where-Object {$_.Trim(" `t")} | Set-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-WinRE.txt"
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinRE.txt"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsImage-WinRE.xml"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinRE.xml"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsImage-WinRE.json"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinRE.json"

    #===================================================================================================
    Write-Verbose 'Get-WindowsImage Setup'
    #===================================================================================================
    $GetWindowsImage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsImage-WinSE.txt"
    $GetWindowsImage = Get-WindowsImage -ImagePath "$OSMediaPath\WinPE\winse.wim" -Index 1 | Select-Object -Property *
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsImage-WinSE.txt"
    (Get-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-WinSE.txt") | Where-Object {$_.Trim(" `t")} | Set-Content "$OSMediaPath\WinPE\info\Get-WindowsImage-WinSE.txt"
    $GetWindowsImage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinSE.txt"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsImage-WinSE.xml"
    $GetWindowsImage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinSE.xml"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsImage-WinSE.json"
    $GetWindowsImage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinSE.json"
}
function Save-PackageInventoryPE {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Export WinPE Package Inventory to $OSMediaPath\WinPE\info"
    #===================================================================================================
    $GetWindowsPackage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsPackage-WinPE.txt"
    $GetWindowsPackage = Get-WindowsPackage -Path "$MountWinPE"
    $GetWindowsPackage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsPackage-WinPE.txt"
    $GetWindowsPackage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinPE.txt"
    $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsPackage-WinPE.xml"
    $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinPE.xml"
    $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsPackage-WinPE.json"
    $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinPE.json"

    #===================================================================================================
    Write-Verbose 'Get-WindowsPackage WinRE'
    #===================================================================================================
    $GetWindowsPackage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsPackage-WinRE.txt"
    $GetWindowsPackage = Get-WindowsPackage -Path "$MountWinRE"
    $GetWindowsPackage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsPackage-WinRE.txt"
    $GetWindowsPackage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinRE.txt"
    $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsPackage-WinRE.xml"
    $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinRE.xml"
    $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsPackage-WinRE.json"
    $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinRE.json"

    #===================================================================================================
    Write-Verbose 'Get-WindowsPackage WinSE'
    #===================================================================================================
    $GetWindowsPackage = @()
    Write-Verbose "$OSMediaPath\WinPE\info\Get-WindowsPackage-WinSE.txt"
    $GetWindowsPackage = Get-WindowsPackage -Path "$MountWinSE"
    $GetWindowsPackage | Out-File "$OSMediaPath\WinPE\info\Get-WindowsPackage-WinSE.txt"
    $GetWindowsPackage | Out-File "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinSE.txt"
    $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\Get-WindowsPackage-WinSE.xml"
    $GetWindowsPackage | Export-Clixml -Path "$OSMediaPath\WinPE\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinSE.xml"
    $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\Get-WindowsPackage-WinSE.json"
    $GetWindowsPackage | ConvertTo-Json | Out-File "$OSMediaPath\WinPE\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsPackage-WinSE.json"
}
function Save-RegistryCurrentVersionOS {
    [CmdletBinding()]
    Param ()
    $RegKeyCurrentVersion | Out-File "$Info\CurrentVersion.txt"
    $RegKeyCurrentVersion | Out-File "$WorkingPath\CurrentVersion.txt"
    $RegKeyCurrentVersion | Out-File "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-CurrentVersion.txt"
    $RegKeyCurrentVersion | Export-Clixml -Path "$Info\xml\CurrentVersion.xml"
    $RegKeyCurrentVersion | Export-Clixml -Path "$Info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-CurrentVersion.xml"
    $RegKeyCurrentVersion | ConvertTo-Json | Out-File "$Info\json\CurrentVersion.json"
    $RegKeyCurrentVersion | ConvertTo-Json | Out-File "$Info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-CurrentVersion.json"
}
function Save-SessionsXmlOS {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Copy Sessions.xml to $OSMediaPath\info\Sessions.xml"
    Write-Verbose "OSMediaPath: $OSMediaPath"

    if (Test-Path "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml") {
        Write-Verbose "$OSMediaPath\info\Sessions.xml"
        Copy-Item "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml" "$OSMediaPath\info\Sessions.xml" -Force | Out-Null

        [xml]$SessionsXML = Get-Content -Path "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"

        $Sessions = $SessionsXML.SelectNodes('Sessions/Session') | ForEach-Object {
            New-Object -Type PSObject -Property @{
                Id = $_.Tasks.Phase.package.id
                KBNumber = $_.Tasks.Phase.package.name
                TargetState = $_.Tasks.Phase.package.targetState
                Client = $_.Client
                Complete = $_.Complete
                Status = $_.Status
            }
        }
        
        $Sessions = $Sessions | Where-Object {$_.Id -like "Package*"}
        $Sessions = $Sessions | Select-Object -Property Id, KBNumber, TargetState, Client, Status, Complete | Sort-Object Complete -Descending

        $Sessions | Out-File "$OSMediaPath\Sessions.txt"
        $Sessions | Out-File "$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Sessions.txt"
        $Sessions | Export-Clixml -Path "$OSMediaPath\info\xml\Sessions.xml"
        $Sessions | Export-Clixml -Path "$OSMediaPath\info\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Sessions.xml"
        $Sessions | ConvertTo-Json | Out-File "$OSMediaPath\info\json\Sessions.json"
        $Sessions | ConvertTo-Json | Out-File "$OSMediaPath\info\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Sessions.json"
    }
    
    if (Test-Path "$OSMediaPath\Sessions.xml") {
        Remove-Item "$OSMediaPath\Sessions.xml" -Force | Out-Null
    }
}
function Save-VariablesOSD {
    [CmdletBinding()]
    Param ()
    Get-Variable | Select-Object -Property Name, Value | Export-Clixml "$Info\xml\Variables.xml"
    Get-Variable | Where-Object { $_.Value -isnot [System.Collections.Hashtable] } | Select-Object -Property Name, Value | ConvertTo-Json | Out-File "$Info\json\Variables.json"
}
function Save-WimsPE {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: Export WIMs to $OSMediaPath\WinPE"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Write-Verbose "OSMediaPath: $OSMediaPath"

    Write-Verbose "$OSMediaPath\WinPE\boot.wim"
    Copy-Item -Path "$OSMediaPath\OS\sources\boot.wim" -Destination "$OSMediaPath\WinPE\boot.wim" -Force

    Write-Verbose "$OSMediaPath\WinPE\winpe.wim"
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinPE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\OS\sources\boot.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\winpe.wim" -LogPath "$CurrentLog" | Out-Null

    Write-Verbose "$OSMediaPath\WinPE\winre.wim"
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinRE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$MountDirectory\Windows\System32\Recovery\winre.wim" -SourceIndex 1 -DestinationImagePath "$OSMediaPath\WinPE\winre.wim" -LogPath "$CurrentLog" | Out-Null

    Write-Verbose "$OSMediaPath\WinPE\winse.wim"
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Export-WindowsImage-WinSE.log"
    Write-Verbose "CurrentLog: $CurrentLog"
    Export-WindowsImage -SourceImagePath "$OSMediaPath\OS\sources\boot.wim" -SourceIndex 2 -DestinationImagePath "$OSMediaPath\WinPE\winse.wim" -LogPath "$CurrentLog" | Out-Null
}
function Save-WindowsImageContentOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Export Image Content to $Info\Get-WindowsImageContent.txt"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Get-WindowsImageContent -ImagePath "$OS\Sources\install.wim" -Index 1 | Out-File "$Info\Get-WindowsImageContent.txt"
}
function Save-WindowsImageContentPE {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "Export Image Content to $Info\Get-WindowsImageContent.txt"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    Get-WindowsImageContent -ImagePath "$OS\Sources\boot.wim" -Index 1 | Out-File "$Info\Get-WindowsImageContent.txt"
}
function Set-LanguageSettingsOS {
    [CmdletBinding()]
    Param ()
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($OSMajorVersion -ne 10) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Language Settings"

    if ($SetAllIntl) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetAllIntl"
        Dism /Image:"$MountDirectory" /Set-AllIntl:"$SetAllIntl" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetAllIntl.log" | Out-Null
    }
    if ($SetInputLocale) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetInputLocale"
        Dism /Image:"$MountDirectory" /Set-InputLocale:"$SetInputLocale" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetInputLocale.log" | Out-Null
    }
    if ($SetSKUIntlDefaults) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetSKUIntlDefaults"
        Dism /Image:"$MountDirectory" /Set-SKUIntlDefaults:"$SetSKUIntlDefaults" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetSKUIntlDefaults.log" | Out-Null
    }
    if ($SetSetupUILang) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetSetupUILang"
        Dism /Image:"$MountDirectory" /Set-SetupUILang:"$SetSetupUILang" /Distribution:"$OS" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetSetupUILang.log" | Out-Null
    }
    if ($SetSysLocale) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetSysLocale"
        Dism /Image:"$MountDirectory" /Set-SysLocale:"$SetSysLocale" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetSysLocale.log" | Out-Null
    }
    if ($SetUILang) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetUILang"
        Dism /Image:"$MountDirectory" /Set-UILang:"$SetUILang" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetUILang.log" | Out-Null
    }
    if ($SetUILangFallback) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetUILangFallback"
        Dism /Image:"$MountDirectory" /Set-UILangFallback:"$SetUILangFallback" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetUILangFallback.log" | Out-Null
    }
    if ($SetUserLocale) {
        Show-ActionTime
        Write-Host -ForegroundColor Green "OS: SetUserLocale"
        Dism /Image:"$MountDirectory" /Set-UserLocale:"$SetUserLocale" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-SetUserLocale.log" | Out-Null
    }
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Generating Updated Lang.ini"
    Dism /Image:"$MountDirectory" /Gen-LangIni /Distribution:"$OS" /LogPath:"$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dism-gen-langini.log" | Out-Null

    Update-LangIniMEDIA -OSMediaPath "$WorkingPath"
}
function Set-WinREWimOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Replace $MountDirectory\Windows\System32\Recovery\winre.wim"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    if (Test-Path "$MountDirectory\Windows\System32\Recovery\winre.wim") {
        Remove-Item -Path "$MountDirectory\Windows\System32\Recovery\winre.wim" -Force
    }

    Copy-Item -Path "$WinPE\winre.wim" -Destination "$MountDirectory\Windows\System32\Recovery\winre.wim" -Force | Out-Null
    $GetWindowsImage = @()
    $GetWindowsImage = Get-WindowsImage -ImagePath "$WinPE\winre.wim" -Index 1 | Select-Object -Property *
    $GetWindowsImage | Out-File "$PEInfo\Get-WindowsImage-WinRE.txt"
    (Get-Content "$PEInfo\Get-WindowsImage-WinRE.txt") | Where-Object {$_.Trim(" `t")} | Set-Content "$PEInfo\Get-WindowsImage-WinRE.txt"
    $GetWindowsImage | Out-File "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinRE.txt"
    $GetWindowsImage | Export-Clixml -Path "$PEInfo\xml\Get-WindowsImage-WinRE.xml"
    $GetWindowsImage | Export-Clixml -Path "$PEInfo\xml\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinRE.xml"
    $GetWindowsImage | ConvertTo-Json | Out-File "$PEInfo\json\Get-WindowsImage-WinRE.json"
    $GetWindowsImage | ConvertTo-Json | Out-File "$PEInfo\json\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Get-WindowsImage-WinRE.json"
}
function Show-ActionDuration {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Show-ActionDuration
    #===================================================================================================
    $OSDDuration = $(Get-Date) - $Global:OSDStartTime
    Write-Host -ForegroundColor DarkGray "Duration: $($OSDDuration.ToString('mm\:ss'))"
    #===================================================================================================
}
function Show-ActionTime {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Show-ActionTime
    #===================================================================================================
    $Global:OSDStartTime = Get-Date
    Write-Host -ForegroundColor White "$(($Global:OSDStartTime).ToString('yyyy-MM-dd-HHmmss')) " -NoNewline
    #Write-Host -ForegroundColor DarkGray "[$(($Global:OSDStartTime).ToString('yyyy-MM-dd-HHmmss'))] " -NoNewline
    #===================================================================================================
}
function Show-MediaImageInfoOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Show-MediaImageInfoOS
    #===================================================================================================
    Write-Host '========================================================================================' -ForegroundColor DarkGray
    Write-Host -ForegroundColor Green "Source OSMedia Windows Image Information"
    Write-Host "-OSMedia Path:                  $OSMediaPath" -ForegroundColor Yellow
    Write-Host "-Image File:                    $OSImagePath"
    #Write-Host "-Image Index:                   $OSImageIndex"
    Write-Host "-Name:                          $OSImageName"
    Write-Host "-Description:                   $OSImageDescription"
    Write-Host "-Architecture:                  $OSArchitecture"
    Write-Host "-Edition:                       $OSEditionID"
    Write-Host "-Type:                          $OSInstallationType"
    Write-Host "-Languages:                     $OSLanguages"
    Write-Host "-Major Version:                 $OSMajorVersion"
    Write-Host "-Build:                         $OSBuild"
    Write-Host "-Version:                       $OSVersion"
    Write-Host "-SPBuild:                       $OSSPBuild"
    Write-Host "-SPLevel:                       $OSSPLevel"
    #Write-Host "-Bootable:                      $OSImageBootable"
    #Write-Host "-WimBoot:                       $OSWIMBoot"
    Write-Host "-Created Time:                  $OSCreatedTime"
    Write-Host "-Modified Time:                 $OSModifiedTime"
}
function Show-MediaInfoOS {
    [CmdletBinding()]
    Param ()
    Write-Host '========================================================================================' -ForegroundColor DarkGray
    Write-Host -ForegroundColor Green "OSMedia Information"
    Write-Host "-OSMediaName:   $OSMediaName" -ForegroundColor Yellow
    Write-Host "-OSMediaPath:   $OSMediaPath" -ForegroundColor Yellow
    Write-Host "-OS:            $OS"
    Write-Host "-WinPE:         $WinPE"
    Write-Host "-Info:          $Info"
    Write-Host "-Logs:          $Info\logs"
}
function Show-OSDBuilderHomeMap {
    [CmdletBinding()]
    Param ()
    Write-Host ""
    
    if (Test-Path "$OSDBuilderPath")            {Write-Host "OSDBuilder Home:                                    $OSDBuilderPath" -ForegroundColor White}
    else                                        {Write-Host "OSDBuilder Home:                                    $OSDBuilderPath (does not exist)" -ForegroundColor White}
    if ($BuildPacksEnabled -eq $true) {
        if (Test-Path "$OSDBuilderBuildPacks")  {Write-Host "BuildPacks:                                         $OSDBuilderBuildPacks" -ForegroundColor Cyan}
        else                                    {Write-Host "BuildPacks:                                         $OSDBuilderBuildPacks (does not exist)" -ForegroundColor Gray}
    }

<#     if (Test-Path "$OSDBuilderOSImport")            {Write-Host "OSImport:          $OSDBuilderOSImport" -ForegroundColor Gray}
        else                                        {Write-Host "OSImport:          $OSDBuilderOSImport (does not exist)" -ForegroundColor Gray}
    if (Test-Path "$OSDBuilderOSMedia")             {Write-Host "OSMedia:           $OSDBuilderOSMedia" -ForegroundColor Gray}
        else                                        {Write-Host "OSMedia:           $OSDBuilderOSMedia (does not exist)" -ForegroundColor Gray}
    if (Test-Path "$OSDBuilderOSBuilds")            {Write-Host "OSBuilds:          $OSDBuilderOSBuilds" -ForegroundColor Gray}
        else                                        {Write-Host "OSBuilds:          $OSDBuilderOSBuilds (does not exist)" -ForegroundColor Gray}
    if (Test-Path "$OSDBuilderPEBuilds")            {Write-Host "PEBuilds:          $OSDBuilderPEBuilds" -ForegroundColor Gray}
        else                                        {Write-Host "PEBuilds:          $OSDBuilderPEBuilds (does not exist)" -ForegroundColor Gray}
    if (Test-Path "$OSDBuilderTasks")               {Write-Host "Tasks:             $OSDBuilderTasks" -ForegroundColor Gray}
        else                                        {Write-Host "Tasks:             $OSDBuilderTasks (does not exist)" -ForegroundColor Gray}
    if (Test-Path "$OSDBuilderTemplates")           {Write-Host "Templates:         $OSDBuilderTemplates" -ForegroundColor Gray}
        else                                        {Write-Host "Templates:         $OSDBuilderTemplates (does not exist)" -ForegroundColor Gray}
    if (Test-Path "$OSDBuilderContent")             {Write-Host "Content:           $OSDBuilderContent" -ForegroundColor Gray}
        else                                        {Write-Host "Content:           $OSDBuilderContent (does not exist)" -ForegroundColor Gray} #>

}
function Show-OSDBuilderHomeOnline {
    [CmdletBinding()]
    Param ()

    $statuscode = try {(Invoke-WebRequest -Uri $OSDBuilderURL -UseBasicParsing -DisableKeepAlive).StatusCode}
    catch [Net.WebException]{[int]$_.Exception.Response.StatusCode}
    if (!($statuscode -eq "200")) {
    } else {
        $LatestModuleVersion = @()
        $LatestModuleVersion = Invoke-RestMethod -Uri $OSDBuilderURL
        
        if ([System.Version]$($LatestModuleVersion.Version) -eq [System.Version]$OSDBuilderVersion) {
            #Write-Host "OSDBuilder Module $OSDBuilderVersion" -ForegroundColor Green
            foreach ($line in $($LatestModuleVersion.LatestUpdates)) {Write-Host $line -ForegroundColor DarkGray}
            Write-Host ""
            Write-Host "New Links:" -ForegroundColor Cyan
            foreach ($line in $($LatestModuleVersion.NewLinks)) {Write-Host $line -ForegroundColor Gray}
            Write-Host ""
            Write-Host "Helpful Links:" -ForegroundColor Cyan
            foreach ($line in $($LatestModuleVersion.HelpfulLinks)) {Write-Host $line -ForegroundColor Gray}
        } elseif ([System.Version]$($LatestModuleVersion.Version) -lt [System.Version]$OSDBuilderVersion) {
            #Write-Host "OSDBuilder Module $OSDBuilderVersion" -ForegroundColor Green
            Write-Warning "OSDBuilder $OSDBuilderVersion is a Preview Version"
            Write-Host "Release Version: $($LatestModuleVersion.Version)" -ForegroundColor DarkGray
            foreach ($line in $($LatestModuleVersion.LatestUpdates)) {Write-Host $line -ForegroundColor DarkGray}
            Write-Host ""
            Write-Host "New Links:" -ForegroundColor Cyan
            foreach ($line in $($LatestModuleVersion.NewLinks)) {Write-Host $line -ForegroundColor Gray}
            Write-Host ""
            Write-Host "Helpful Links:" -ForegroundColor Cyan
            foreach ($line in $($LatestModuleVersion.HelpfulLinks)) {Write-Host $line -ForegroundColor Gray}
        } else {
            Write-Host "PowerShell Gallery: $($LatestModuleVersion.Version)" -ForegroundColor Gray
            #Write-Host "Installed Version: $OSDBuilderVersion" -ForegroundColor DarkGray
            Write-Warning "Updated OSDBuilder Module on PowerShell Gallery"
            foreach ($line in $($LatestModuleVersion.PSGallery)) {Write-Host $line -ForegroundColor DarkGray}
            Write-Host "Update Module Command: OSDBuilder -Update" -ForegroundColor Cyan
        }
    }  
}
function Show-OSDBuilderHomeTips {
    [CmdletBinding()]
    Param ()

    Write-Host ''

    Write-Host 'Change OSDBuilder Home Path:                        ' -NoNewline
    Write-Host 'OSDBuilder -SetPath D:\OSDBuilder' -ForegroundColor Cyan

    Write-Host 'Create OSDBuilder Directory Structure:              ' -NoNewline
    Write-Host 'OSDBuilder -CreatePaths' -ForegroundColor Cyan

    Write-Host 'Update OSDBuilder Module to the latest version:     ' -NoNewline
    Write-Host 'OSDBuilder -Update' -ForegroundColor Cyan

    Write-Host ''

    Write-Host 'Download missing Microsoft Updates for OSMedia:     ' -NoNewline
    Write-Host 'OSDBuilder -Download OSMediaUpdates' -ForegroundColor Green

    Write-Host 'Download Windows 10 Feature Updates for Import:     ' -NoNewline
    Write-Host 'OSDBuilder -Download FeatureUpdates' -ForegroundColor Green

    Write-Host 'Download the latest OneDriveSetup.exe:              ' -NoNewline
    Write-Host 'OSDBuilder -Download OneDrive' -ForegroundColor Green

    Write-Host 'Download the latest OneDriveSetup.exe (Enterprise): ' -NoNewline
    Write-Host 'OSDBuilder -Download OneDriveEnterprise' -ForegroundColor Green
    Write-Host ''
}
function Show-SkipUpdatesInfo {
    #Show-ActionTime
    #Write-Host -ForegroundColor DarkGray "                  -SkipUpdates Parameter was used"
}
function Show-TaskInfo {
    [CmdletBinding()]
    Param ()        
    #===================================================================================================
    Write-Verbose '19.1.25 OSBuild Task Information'
    #===================================================================================================
    Write-Host '========================================================================================' -ForegroundColor DarkGray
    Write-Host -ForegroundColor Green "OSBuild Task Information"
    Write-Host "-TaskName:                      $TaskName"
    Write-Host "-TaskVersion:                   $TaskVersion"
    Write-Host "-TaskType:                      $TaskType"
    Write-Host "-OSMedia Name:                  $OSMediaName"
    Write-Host "-OSMedia Path:                  $OSMediaPath"
    if ($CustomName) {Write-Host "-Custom Name:                   $CustomName"}
    if ($EnableNetFX3 -eq $true) {Write-Host "-Enable NetFx3:                 $EnableNetFX3"}
    if ($WinPEAutoExtraFiles -eq $true) {Write-Host "-WinPE Auto ExtraFiles:         $WinPEAutoExtraFiles"}

    if ($DisableFeature) {
        Write-Host "-Disable Feature:"
        foreach ($item in $DisableFeature)      {Write-Host $item -ForegroundColor DarkGray}}

    if ($EnableFeature) {
        Write-Host "-Enable Feature:"
        foreach ($item in $EnableFeature)       {Write-Host $item -ForegroundColor DarkGray}}

    if ($RemoveAppx) {
        Write-Host "-Remove Appx:"
        foreach ($item in $RemoveAppx)          {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($RemoveCapability) {
        Write-Host "-Remove Capability:"
        foreach ($item in $RemoveCapability)    {Write-Host $item -ForegroundColor DarkGray}}
        
    if ($RemovePackage) {
        Write-Host "-Remove Packages:"
        foreach ($item in $RemovePackage)       {Write-Host $item -ForegroundColor DarkGray}}


    if ($StartLayoutXML)    {Write-Host "-Start Layout:                  $OSDBuilderContent\$StartLayoutXML"}
    if ($UnattendXML)       {Write-Host "-Unattend:                      $OSDBuilderContent\$UnattendXML"}
    if ($WinPEDaRT)         {Write-Host "-WinPE DaRT:                    $OSDBuilderContent\$WinPEDaRT"}
    
    if ($BuildPacks) {
        Write-Host "-BuildPacks:"
        foreach ($item in $BuildPacks)            {Write-Host "     $item" -ForegroundColor Cyan}}
    
    if ($Drivers) {
        Write-Host "-Drivers:"
        foreach ($item in $Drivers)             {Write-Host "$OSDBuilderContent\$item" -ForegroundColor DarkGray}}
    
    if ($ExtraFiles) {
        Write-Host "-Extra Files:"
        foreach ($item in $ExtraFiles)          {Write-Host "$OSDBuilderContent\$item" -ForegroundColor DarkGray}}

    if ($FeaturesOnDemand) {
        Write-Host "-Features On Demand:"
        foreach ($item in $FeaturesOnDemand)    {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($Packages) {
        Write-Host "-Packages:"
        foreach ($item in $Packages)            {Write-Host $item -ForegroundColor DarkGray}}

    if ($Scripts) {
        Write-Host "-Scripts:"
        foreach ($item in $Scripts)             {Write-Host $item -ForegroundColor DarkGray}}

    if ($WinPEDrivers) {
        Write-Host "-WinPE Drivers:"
        foreach ($item in $WinPEDrivers)        {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEADKPE) {
        Write-Host "-WinPE ADK Packages:"
        foreach ($item in $WinPEADKPE)          {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEADKRE) {
        Write-Host "-WinRE ADK Packages:"
        foreach ($item in $WinPEADKRE)          {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEADKSE) {
        Write-Host "-WinSE ADK Packages:"
        foreach ($item in $WinPEADKSE)          {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEExtraFilesPE) {
        Write-Host "-WinPE Extra Files:"
        foreach ($item in $WinPEExtraFilesPE)   {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEExtraFilesRE) {
        Write-Host "-WinRE Extra Files:"
        foreach ($item in $WinPEExtraFilesRE)   {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEExtraFilesSE) {
        Write-Host "-WinSE Extra Files:"
        foreach ($item in $WinPEExtraFilesSE)   {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEScriptsPE) {
        Write-Host "-WinPE Scripts:"
        foreach ($item in $WinPEScriptsPE)      {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEScriptsRE) {
        Write-Host "-WinRE Scripts:"
        foreach ($item in $WinPEScriptsRE)      {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($WinPEScriptsSE) {
        Write-Host "-WinSE Scripts:"
        foreach ($item in $WinPEScriptsSE)      {Write-Host $item -ForegroundColor DarkGray}}

    if ($SetAllIntl)            {Write-Host "-SetAllIntl (Language):         $SetAllIntl"}
    if ($SetInputLocale)        {Write-Host "-SetInputLocale (Language):     $SetInputLocale"}
    if ($SetSKUIntlDefaults)    {Write-Host "-SetSKUIntlDefaults (Language): $SetSKUIntlDefaults"}
    if ($SetSetupUILang)        {Write-Host "-SetSetupUILang (Language):     $SetSetupUILang"}
    if ($SetSysLocale)          {Write-Host "-SetSysLocale (Language):       $SetSysLocale"}
    if ($SetUILang)             {Write-Host "-SetUILang (Language):          $SetUILang"}
    if ($SetUILangFallback)     {Write-Host "-SetUILangFallback (Language):  $SetUILangFallback"}
    if ($SetUserLocale)         {Write-Host "-SetUserLocale (Language):      $SetUserLocale"}

    if ($LanguageFeatures) {
        Write-Host "-Language Features:"
        foreach ($item in $LanguageFeatures)        {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($LanguageInterfacePacks) {
        Write-Host "-Language Interface Packs:"
        foreach ($item in $LanguageInterfacePacks)  {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($LanguagePacks) {
        Write-Host "-Language Packs:"
        foreach ($item in $LanguagePacks)           {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($LocalExperiencePacks) {
        Write-Host "-Local Experience Packs:"
        foreach ($item in $LocalExperiencePacks)    {Write-Host $item -ForegroundColor DarkGray}}
    
    if ($LanguageCopySources) {
        Write-Host "-Language Sources Copy:"
        foreach ($item in $LanguageCopySources)     {Write-Host $item -ForegroundColor DarkGray}}

    $CombinedOSMedia = Get-OSMedia -Revision OK | Where-Object {$_.OSMFamily -eq $TaskOSMFamily}

    $CombinedTask = [ordered]@{
        "TaskType" = [string]"OSBuild";
        "TaskName" = [string]$TaskName;
        "TaskVersion" = [string]$TaskVersion;
        "TaskGuid" = [string]$(New-Guid);
        "CustomName" = [string]$CustomName;
        "OSMFamily" = [string]$TaskOSMFamily
        "OSMGuid" = [string]$CombinedOSMedia.OSMGuid;
        "Name" = [string]$OSMediaName;

        "ImageName" = [string]$CombinedOSMedia.ImageName;
        "Arch" = [string]$CombinedOSMedia.Arch;
        "ReleaseId" = [string]$CombinedOSMedia.ReleaseId;
        "UBR" = [string]$CombinedOSMedia.UBR;
        "Languages" = [string[]]$CombinedOSMedia.Languages;
        "EditionId" = [string]$CombinedOSMedia.EditionId;
        "InstallationType" = [string]$CombinedOSMedia.InstallationType;
        "MajorVersion" = [string]$CombinedOSMedia.MajorVersion;
        "Build" = [string]$CombinedOSMedia.Build;
        "CreatedTime" = [datetime]$CombinedOSMedia.CreatedTime;
        "ModifiedTime" = [datetime]$CombinedOSMedia.ModifiedTime;

        "EnableNetFX3" = [string]$EnableNetFX3;
        "StartLayoutXML" = [string]$StartLayoutXML;
        "UnattendXML" = [string]$UnattendXML;
        "WinPEAutoExtraFiles" = [string]$WinPEAutoExtraFiles;
        "WinPEDaRT" = [string]$WinPEDaRT;
        BuildPacks = [string[]]$($BuildPacks | Sort-Object -Unique);
        "ExtraFiles" = [string[]]$($ExtraFiles | Sort-Object -Unique);
        "Scripts" = [string[]]$($Scripts | Sort-Object -Unique);
        "Drivers" = [string[]]$($Drivers | Sort-Object -Unique);

        "AddWindowsPackage" = [string[]]$($Packages | Sort-Object -Unique);
        "RemoveWindowsPackage" = [string[]]$($RemovePackage | Sort-Object -Unique);
        "AddFeatureOnDemand" = [string[]]$($FeaturesOnDemand | Sort-Object -Unique);
        "EnableWindowsOptionalFeature" = [string[]]$($EnableFeature | Sort-Object -Unique);
        "DisableWindowsOptionalFeature" = [string[]]$($DisableFeature | Sort-Object -Unique);
        "RemoveAppxProvisionedPackage" = [string[]]$($RemoveAppx | Sort-Object -Unique);
        "RemoveWindowsCapability" = [string[]]$($RemoveCapability | Sort-Object -Unique);

        "WinPEDrivers" = [string[]]$($WinPEDrivers | Sort-Object -Unique);
        "WinPEExtraFilesPE" = [string[]]$($WinPEExtraFilesPE | Sort-Object -Unique);
        "WinPEExtraFilesRE" = [string[]]$($WinPEExtraFilesRE | Sort-Object -Unique);
        "WinPEExtraFilesSE" = [string[]]$($WinPEExtraFilesSE | Sort-Object -Unique);
        "WinPEScriptsPE" = [string[]]$($WinPEScriptsPE | Sort-Object -Unique);
        "WinPEScriptsRE" = [string[]]$($WinPEScriptsRE | Sort-Object -Unique);
        "WinPEScriptsSE" = [string[]]$($WinPEScriptsSE | Sort-Object -Unique);
        "WinPEADKPE" = [string[]]$($WinPEADKPE | Select-Object -Unique);
        "WinPEADKRE" = [string[]]$($WinPEADKRE | Select-Object -Unique);
        "WinPEADKSE" = [string[]]$($WinPEADKSE | Select-Object -Unique);

        "LangSetAllIntl" = [string]$SetAllIntl;
        "LangSetInputLocale" = [string]$SetInputLocale;
        "LangSetSKUIntlDefaults" = [string]$SetSKUIntlDefaults;
        "LangSetSetupUILang" = [string]$SetSetupUILang;
        "LangSetSysLocale" = [string]$SetSysLocale;
        "LangSetUILang" = [string]$SetUILang;
        "LangSetUILangFallback" = [string]$SetUILangFallback;
        "LangSetUserLocale" = [string]$SetUserLocale;
        "LanguageFeature" = [string[]]$($LanguageFeatures | Sort-Object -Unique);
        "LanguageInterfacePack" = [string[]]$($LanguageInterfacePacks | Sort-Object -Unique);
        "LanguagePack" = [string[]]$($LanguagePacks | Sort-Object -Unique);
        "LocalExperiencePacks" = [string[]]$($LocalExperiencePacks | Sort-Object -Unique);
    }
    $CombinedTask | ConvertTo-Json | Out-File "$($CombinedOSMedia.FullName)\OSBuild.json"
}
function Show-WindowsImageInfo {
    [CmdletBinding()]
    Param ()
    Write-Host '========================================================================================' -ForegroundColor DarkGray
    Write-Host -ForegroundColor Green "Windows Image Information"
    Write-Host "Source Path:    $OSSourcePath"
    Write-Host "-Image File:    $OSImagePath"
    Write-Host "-Image Index:   $OSImageIndex"
    Write-Host "-Name:          $OSImageName"
    Write-Host "-Description:   $OSImageDescription"
    Write-Host "-Architecture:  $OSArchitecture"
    Write-Host "-Edition:       $OSEditionID"
    Write-Host "-Type:          $OSInstallationType"
    Write-Host "-Languages:     $OSLanguages"
    Write-Host "-Build:         $OSBuild"
    Write-Host "-Version:       $OSVersion"
    Write-Host "-SPBuild:       $OSSPBuild"
    Write-Host "-SPLevel:       $OSSPLevel"
    Write-Host "-Bootable:      $OSImageBootable"
    Write-Host "-WimBoot:       $OSWIMBoot"
    Write-Host "-Created Time:  $OSCreatedTime"
    Write-Host "-Modified Time: $OSModifiedTime"
    Write-Host "-UBR:           $UBR"
    Write-Host "-OSMGuid:       $OSMGuid"
}
function Show-WorkingInfoOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    Write-Verbose '19.1.1 Working Information'
    #===================================================================================================
    Write-Host '========================================================================================' -ForegroundColor DarkGray
    Write-Host -ForegroundColor Green "Working Information"
    Write-Host "-WorkingName:   $WorkingName" -ForegroundColor Yellow
    Write-Host "-WorkingPath:   $WorkingPath" -ForegroundColor Yellow
    Write-Host "-OS:            $OS"
    Write-Host "-WinPE:         $WinPE"
    Write-Host "-Info:          $Info"
    Write-Host "-Logs:          $Info\logs"
    Write-Host '========================================================================================' -ForegroundColor DarkGray
}
function Update-AdobeOS {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ($null -eq $OSDUpdateAdobeSU) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    if ($Force.IsPresent) {
        Write-Host -ForegroundColor Green "OS: (ASU) Adobe Flash Player Security Update (Forced)"
    } else {
        Write-Host -ForegroundColor Green "OS: (ASU) Adobe Flash Player Security Update"
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateAdobeSU) {
        $UpdateASU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateASU) {Continue}
        if (!(Test-Path "$UpdateASU")) {Write-Warning "Not Found: $UpdateASU"; Continue}

        if (!($Force.IsPresent)) {
            $SessionsXmlInstall = "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"
            if (Test-Path $SessionsXmlInstall) {
                [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-AdobeOS-KB$($Update.FileKBNumber).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateASU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}
function Update-ComponentOS {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesDUC) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($null -eq $OSDUpdateComponentDU) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    if ($Force.IsPresent) {
        Write-Host -ForegroundColor Green "OS: Component Update (Forced)"
    } else {
        Write-Host -ForegroundColor Green "OS: Component Update"
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateComponentDU) {
        $UpdateComp = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateComp) {Continue}
        if (!(Test-Path "$UpdateComp")) {Write-Warning "Not Found: $UpdateComp"; Continue}

        if (!($Force.IsPresent)) {
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-ComponentOS-KB$($Update.FileKBNumber).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateComp" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}
function Update-CumulativeOS {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($SkipUpdatesOSLCU) {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ($null -eq $OSDUpdateLCU) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    if ($Force.IsPresent) {
        Write-Host -ForegroundColor Green "OS: (LCU) Latest Cumulative Update (Forced)"
    } else {
        Write-Host -ForegroundColor Green "OS: (LCU) Latest Cumulative Update"
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateLCU) {
        $UpdateLCU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateLCU) {Continue}
        if (!(Test-Path "$UpdateLCU")) {Write-Warning "Not Found: $UpdateLCU"; Continue}

        if (!($Force.IsPresent)) {
            $SessionsXmlInstall = "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"
            if (Test-Path $SessionsXmlInstall) {
                [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-CumulativeOS-KB$($Update.FileKBNumber).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateLCU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}
function Update-CumulativePE {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesPE) {Return}
    if ($SkipUpdatesPELCU) {Return}
    if ($null -eq $OSDUpdateLCU) {Return}
    #===================================================================================================
    #   Update WinPE
    #===================================================================================================
    if ($OSMajorVersion -ne 10) {
        $OSDUpdateLCU = $OSDUpdateLCU | Where-Object {$_.OSDWinPE -eq $true}
        if ($Force.IsPresent) {Return}
    }
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: (LCU) Latest Cumulative Update"
    if ($OSBuild -ge 18362) {
        Write-Warning "Skipping Update for this version of Windows"
        Return
    }

    foreach ($Update in $OSDUpdateLCU) {
        $UpdateLCU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName

        if ($null -eq $UpdateLCU) {Continue}
        if (!(Test-Path "$UpdateLCU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            $SessionsXmlInstall = "$MountWinPE\Windows\Servicing\Sessions\Sessions.xml"
            if (Test-Path $SessionsXmlInstall) {
                [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-CumulativePE-KB$($Update.KBNumber)-WinPE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountWinPE" -PackagePath "$UpdateLCU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
        if (!($OSVersion -like "6.1.7601.*")) {
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-DismCleanupImage-WinPE.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            if ($SkipComponentCleanup) {
                Write-Warning "Skip: -SkipComponentCleanup Parameter was used"
            } else {
                Dism /Image:"$MountWinPE" /Cleanup-Image /StartComponentCleanup /ResetBase /LogPath:"$CurrentLog" | Out-Null
            }
        }
    }
    #===================================================================================================
    #   Update WinRE
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinRE: (LCU) Latest Cumulative Update"
    foreach ($Update in $OSDUpdateLCU) {
        $UpdateLCU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName

        if ($null -eq $UpdateLCU) {Continue}
        if (!(Test-Path "$UpdateLCU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            $SessionsXmlInstall = "$MountWinRE\Windows\Servicing\Sessions\Sessions.xml"
            if (Test-Path $SessionsXmlInstall) {
                [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-CumulativePE-KB$($Update.KBNumber)-WinRE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountWinRE" -PackagePath "$UpdateLCU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
        if (!($OSVersion -like "6.1.7601.*")) {
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-DismCleanupImage-WinRE.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            if ($SkipComponentCleanup) {
                Write-Warning "Skip: -SkipComponentCleanup Parameter was used"
            } else {
                Dism /Image:"$MountWinRE" /Cleanup-Image /StartComponentCleanup /ResetBase /LogPath:"$CurrentLog" | Out-Null
            }
        }
    }

    if ($SkipUpdatesWinSE) {Return}
    #===================================================================================================
    #   Update WinSE
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinSE: (LCU) Latest Cumulative Update"
    
    if (($OSMajorVersion -eq 10) -and ($ReleaseId -ge 1903)) {Write-Warning 'Not adding LCU to WinSE to resolve Setup issues'; Return}
    foreach ($Update in $OSDUpdateLCU) {
        $UpdateLCU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName

        if ($null -eq $UpdateLCU) {Continue}
        if (!(Test-Path "$UpdateLCU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            $SessionsXmlInstall = "$MountWinSE\Windows\Servicing\Sessions\Sessions.xml"
            if (Test-Path $SessionsXmlInstall) {
                [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-CumulativePE-KB$($Update.KBNumber)-WinSE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountWinSE" -PackagePath "$UpdateLCU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
        if (!($OSVersion -like "6.1.7601.*")) {
            $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-DismCleanupImage-WinSE.log"
            Write-Verbose "CurrentLog: $CurrentLog"
            if ($SkipComponentCleanup) {
                Write-Warning "Skip: -SkipComponentCleanup Parameter was used"
            } else {
                Dism /Image:"$MountWinSE" /Cleanup-Image /StartComponentCleanup /ResetBase /LogPath:"$CurrentLog" | Out-Null
            }
        }
    }
}
function Update-DotNetOS {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ($null -eq $OSDUpdateDotNet) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    if ($Force.IsPresent) {
        Write-Host -ForegroundColor Green "OS: (NetCU) DotNet Framework Cumulative Update (Forced)"
    } else {
        Write-Host -ForegroundColor Green "OS: (NetCU) DotNet Framework Cumulative Update"
    }
    #===================================================================================================
    #   Execute DotNet
    #===================================================================================================
    foreach ($Update in $OSDUpdateDotNet | Where-Object {$_.UpdateGroup -eq 'DotNet'}) {
        $UpdateNetCU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateNetCU) {Continue}
        if (!(Test-Path "$UpdateNetCU")) {Write-Warning "Not Found: $UpdateNetCU"; Continue}
        
        $SessionsXmlInstall = "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"
        if (Test-Path $SessionsXmlInstall) {
            [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
            if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }
        
        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-DotNetOS-KB$($Update.FileKBNumber).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateNetCU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
            if ($ErrorMessage -like "*0x8007371b*") {
                Write-Warning "ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE"
                Write-Warning "One or more required members of the transaction are not present"
                Write-Warning "Since this is a DotNet Update, it is quite possible this won't install until you enable a DotNet Feature like NetFX 3.5"
            }
        }
    }
    #===================================================================================================
    #   Execute DotNetCU
    #===================================================================================================
    foreach ($Update in $OSDUpdateDotNet | Where-Object {$_.UpdateGroup -eq 'DotNetCU'}) {
        $UpdateNetCU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateNetCU) {Continue}
        if (!(Test-Path "$UpdateNetCU")) {Write-Warning "Not Found: $UpdateNetCU"; Continue}
        
        if (!($Force.IsPresent)) {
            $SessionsXmlInstall = "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"
            if (Test-Path $SessionsXmlInstall) {
                [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }
        
        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-DotNetOS-KB$($Update.FileKBNumber).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateNetCU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
            if ($ErrorMessage -like "*0x8007371b*") {
                Write-Warning "ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE"
                Write-Warning "One or more required members of the transaction are not present"
                Write-Warning "Since this is a DotNet Update, it is quite possible this won't install until you enable a DotNet Feature like NetFX 3.5"
            }
        }
    }
}
function Update-LangIniMEDIA {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Updating WinSE.wim with updated Lang.ini"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    $MountWinSELangIni = Join-Path $OSDBuilderContent\Mount "winselangini$((Get-Date).ToString('hhmmss'))"
    if (!(Test-Path "$MountWinSELangIni")) {New-Item "$MountWinSELangIni" -ItemType Directory -Force | Out-Null}

    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Mount-WinSELangIni.log"
    Mount-WindowsImage -ImagePath "$OSMediaPath\WinPE\winse.wim" -Index 1 -Path "$MountWinSELangIni" -LogPath "$CurrentLog" | Out-Null

    Copy-Item -Path "$OS\Sources\lang.ini" -Destination "$MountWinSELangIni\Sources" -Force | Out-Null

    Start-Sleep -Seconds 10
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dismount-WinSELangIni.log"
    try {
        Dismount-WindowsImage -Path "$MountWinSELangIni" -Save -LogPath "$CurrentLog" -ErrorAction SilentlyContinue | Out-Null
    }
    catch {
        Write-Warning "Could not dismount WinSE.wim ... Waiting 30 seconds ..."
        Start-Sleep -Seconds 30
        Dismount-WindowsImage -Path "$MountWinSELangIni" -Save -LogPath "$CurrentLog" | Out-Null
    }
    if (Test-Path "$MountWinSELangIni") {Remove-Item -Path "$MountWinSELangIni" -Force -Recurse | Out-Null}

    Write-Host "Install.wim: Updating Boot.wim Index 2 with updated Lang.ini"
    $MountBootLangIni = Join-Path $OSDBuilderContent\Mount "bootlangini$((Get-Date).ToString('hhmmss'))"
    if (!(Test-Path "$MountBootLangIni")) {New-Item "$MountBootLangIni" -ItemType Directory -Force | Out-Null}

    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Mount-BootLangIni.log"
    Mount-WindowsImage -ImagePath "$OS\Sources\boot.wim" -Index 2 -Path "$MountBootLangIni" -LogPath "$CurrentLog" | Out-Null

    Copy-Item -Path "$OS\Sources\lang.ini" -Destination "$MountBootLangIni\Sources" -Force | Out-Null

    Start-Sleep -Seconds 10
    $CurrentLog = "$OSMediaPath\WinPE\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Dismount-BootLangIni.log"
    try {
        Dismount-WindowsImage -Path "$MountBootLangIni" -Save -LogPath "$CurrentLog" -ErrorAction SilentlyContinue | Out-Null
    }
    catch {
        Write-Warning "Could not dismount Boot.wim ... Waiting 30 seconds ..."
        Start-Sleep -Seconds 30
        Dismount-WindowsImage -Path "$MountBootLangIni" -Save -LogPath "$CurrentLog" | Out-Null
    }
    if (Test-Path "$MountBootLangIni") {Remove-Item -Path "$MountBootLangIni" -Force -Recurse | Out-Null}
}
function Update-ModuleOSDBuilder {
    [CmdletBinding()]
    Param (
        [switch]$CurrentUser
    )
    #===================================================================================================
    #   Uninstall-Module
    #===================================================================================================
    Write-Warning "Uninstall-Module -Name OSDBuilder -AllVersions -Force"
    try {Uninstall-Module -Name OSDBuilder -AllVersions -Force -ErrorAction SilentlyContinue}
    catch {}
    #===================================================================================================
    #   Remove-Module
    #===================================================================================================
    Write-Warning "Remove-Module -Name OSDBuilder -Force"
    try {Remove-Module -Name OSDBuilder -Force -ErrorAction SilentlyContinue}
    catch {}
    #===================================================================================================
    #   Install-Module
    #===================================================================================================
    if ($CurrentUser.IsPresent) {
        Write-Warning "Install-Module -Name OSDBuilder -Scope CurrentUser -Force"
        try {Install-Module -Name OSDBuilder -Scope CurrentUser -Force -ErrorAction SilentlyContinue}
        catch {}
    } else {
        Write-Warning "Install-Module -Name OSDBuilder -Force"
        try {Install-Module -Name OSDBuilder -Force -ErrorAction SilentlyContinue}
        catch {}
    }
    #===================================================================================================
    #   OSDSUS Update-Module
    #===================================================================================================
    Write-Warning "Update-Module -Name -Force OSDSUS"
    try {Update-Module -Name OSDSUS -Force -ErrorAction SilentlyContinue}
    catch {}
    #===================================================================================================
    #   OSDSUS Import-Module
    #===================================================================================================
    Write-Warning "Import-Module -Name OSDSUS -Force"
    try {Import-Module -Name OSDSUS -Force -ErrorAction SilentlyContinue}
    catch {}
    #===================================================================================================
    #   Import-Module
    #===================================================================================================
    Write-Warning "Import-Module -Name OSDBuilder -Force"
    try {Import-Module -Name OSDBuilder -Force -ErrorAction SilentlyContinue}
    catch {}
    #===================================================================================================
    #   Close PowerShell
    #===================================================================================================
    Write-Warning "Close all open PowerShell sessions before using OSDBuilder"
}
function Update-OptionalOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'New-OSBuild') {Return}
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ($null -eq $OSDUpdateOptional) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Optional Updates"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateOptional) {
        $UpdateOptional = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateOptional) {Continue}
        if (!(Test-Path "$UpdateOptional")) {Write-Warning "Not Found: $UpdateOptional"; Continue}

        if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
            Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
        } else {
            Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
            Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-OptionalOS-KB$($Update.FileKBNumber).log"
            Write-Verbose "CurrentLog: $CurrentLog"
            Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateOptional" -LogPath "$CurrentLog" | Out-Null}
            Catch {
                $ErrorMessage = $_.Exception.$ErrorMessage
                Write-Warning "$CurrentLog"
                #Write-Host "$ErrorMessage"
                #if ($ErrorMessage -match '800f081e') {Write-Warning "Update not applicable to this Operating System"}
            }
        }
    }
}
function Update-ServicingStackOS {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($SkipUpdatesOSSSU) {Return}
    if ($OSMajorVersion -ne 10) {Return}
    if ($null -eq $OSDUpdateSSU) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    if ($Force.IsPresent) {
        Write-Host -ForegroundColor Green "OS: (SSU) Servicing Stack Update (Forced)"
    } else {
        Write-Host -ForegroundColor Green "OS: (SSU) Servicing Stack Update"
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateSSU) {
        $UpdateSSU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateSSU) {Continue}
        if (!(Test-Path "$UpdateSSU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-ServicingStackOS-KB$($Update.FileKBNumber).log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateSSU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}
function Update-ServicingStackPE {
    [CmdletBinding()]
    Param (
        [switch]$Force
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesPE) {Return}
    if ($SkipUpdatesPESSU) {Return}
    #if ($OSMajorVersion -ne 10) {Return}
    if ($null -eq $OSDUpdateSSU) {Return}
    #===================================================================================================
    #   Update WinPE
    #===================================================================================================
    if ($OSMajorVersion -ne 10) {
        $OSDUpdateSSU = $OSDUpdateSSU | Where-Object {$_.OSDWinPE -eq $true}
        if ($Force.IsPresent) {Return}
    }
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinPE: (SSU) Servicing Stack Update"
    if ($OSBuild -ge 18362) {
        Write-Warning "Skipping update for this version of Windows"
        Return
    }

    foreach ($Update in $OSDUpdateSSU) {
        $UpdateSSU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateSSU) {Continue}
        if (!(Test-Path "$UpdateSSU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            if (Get-WindowsPackage -Path "$MountWinPE" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-ServicingStackPE-KB$($Update.KBNumber)-WinPE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountWinPE" -PackagePath "$UpdateSSU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
    #===================================================================================================
    #   Update WinRE
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinRE: (SSU) Servicing Stack Update"
    foreach ($Update in $OSDUpdateSSU) {
        $UpdateSSU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateSSU) {Continue}
        if (!(Test-Path "$UpdateSSU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            if (Get-WindowsPackage -Path "$MountWinRE" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"
        
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-ServicingStackPE-KB$($Update.KBNumber)-WinRE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountWinRE" -PackagePath "$UpdateSSU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
    #===================================================================================================
    #   Update WinSE
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "WinSE: (SSU) Servicing Stack Update"
    foreach ($Update in $OSDUpdateSSU) {
        $UpdateSSU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateSSU) {Continue}
        if (!(Test-Path "$UpdateSSU")) {Write-Warning "Not Found: $UpdateSSU"; Continue}

        if (!($Force.IsPresent)) {
            if (Get-WindowsPackage -Path "$MountWinSE" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"
        
        $CurrentLog = "$PEInfo\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-ServicingStackPE-KB$($Update.KBNumber)-WinSE.log"
        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountWinSE" -PackagePath "$UpdateSSU" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}
function Update-SetupDUMEDIA {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Changelog
    #===================================================================================================
    #19.10.14 Resolved issue with color for Update FileName
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipSetupDU) {Return}
    if ($null -eq $OSDUpdateSetupDU) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "MEDIA: (SetupDU) Windows Setup Dynamic Update"
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateSetupDU) {
        $UpdateSetupDU = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        if ($null -eq $UpdateSetupDU) {Continue}
        if (!(Test-Path "$UpdateSetupDU")) {Write-Warning "Not Found: $UpdateSetupDU"; Continue}

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        expand.exe "$UpdateSetupDU" -F:*.* "$OS\Sources" | Out-Null
    }
}
function Update-SourcesPE {
    [CmdletBinding()]
    Param (
        [string]$OSMediaPath
    )
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($SkipUpdates) {Return}
    if ($SkipUpdatesPE) {Return}
    if ($SkipUpdatesOS) {Return}
    if ($ReleaseId -ge 1903) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime; Write-Host -ForegroundColor Green "MEDIA: Update Media Sources with WinSE.wim"
    #===================================================================================================
    #   Warning
    #===================================================================================================
    if ($OSBuild -ge 18362) {
        Write-Warning "Skipping Update for this version of Windows"
        Return
    }
    if ($ReleaseId -ge 1903) {
        Write-Warning "This step is currently disabled for Windows 10 1903"
        Write-Warning "If this is the first time you are seeing this warning,"
        Write-Warning "you should Update-OSMedia from Windows 10 1903 18362.30"
        Return
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    robocopy "$MountWinSE\sources" "$OSMediaPath\OS\sources" setup.exe /ndl /xo /xx /xl /b /np /ts /tee /r:0 /w:0 /Log+:"$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Robocopy-WinSE-MediaSources.log" | Out-Null
    robocopy "$MountWinSE\sources" "$OSMediaPath\OS\sources" setuphost.exe /ndl /xo /xx /xl /b /np /ts /tee /r:0 /w:0 /Log+:"$OSMediaPath\info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Robocopy-WinSE-MediaSources.log" | Out-Null
}
function Update-WindowsServer2012R2OS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'Update-OSMedia') {Return}
    if ($SkipUpdates) {Return}
    if ($OSMajorVersion -eq 10) {Return}
    if ($null -eq $OSDUpdateWinTwelveR2) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Windows Server 2012 R2 Updates"
    $SessionsXmlInstall = "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"
    if (Test-Path $SessionsXmlInstall) {
        [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateWinTwelveR2) {
        $UpdateTwelveR2 = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        $UpdateTwelveR2 = $UpdateTwelveR2 | Select-Object -First 1
        
        if ($null -eq $UpdateTwelveR2) {Continue}
        if (!(Test-Path "$UpdateTwelveR2")) {Write-Warning "Not Found: $UpdateTwelveR2"; Continue}
        
        
        if (Test-Path $SessionsXmlInstall) {
            if ($null -eq $Update.FileKBNumber) {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.KBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            } else {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        #Get updated Sessions.xml and check again
        if (Test-Path $SessionsXmlInstall) {
            [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
        }

        if (Test-Path $SessionsXmlInstall) {
            if ($null -eq $Update.FileKBNumber) {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.KBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            } else {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        if ($null -eq $Update.FileKBNumber) {
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-WindowsServer2012R2OS-KB$($Update.KBNumber).log"
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        } else {
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-WindowsServer2012R2OS-KB$($Update.FileKBNumber).log"
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.FileKBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateTwelveR2" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}
function Update-WindowsSevenOS {
    [CmdletBinding()]
    Param ()
    #===================================================================================================
    #   Abort
    #===================================================================================================
    if ($ScriptName -ne 'Update-OSMedia') {Return}
    if ($SkipUpdates) {Return}
    if ($OSMajorVersion -eq 10) {Return}
    if ($null -eq $OSDUpdateWinSeven) {Return}
    #===================================================================================================
    #   Header
    #===================================================================================================
    Show-ActionTime
    Write-Host -ForegroundColor Green "OS: Windows 7 Updates"
    $SessionsXmlInstall = "$MountDirectory\Windows\Servicing\Sessions\Sessions.xml"
    if (Test-Path $SessionsXmlInstall) {
        [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
    }
    #===================================================================================================
    #   Execute
    #===================================================================================================
    foreach ($Update in $OSDUpdateWinSeven) {
        $UpdateSeven = $(Get-ChildItem -Path $OSDBuilderContent\OSDUpdate -File -Recurse | Where-Object {($_.FullName -like "*$($Update.Title)*") -and ($_.Name -match "$($Update.FileName)")}).FullName
        $UpdateSeven = $UpdateSeven | Select-Object -First 1

        if ($null -eq $UpdateSeven) {Continue}
        if (!(Test-Path "$UpdateSeven")) {Write-Warning "Not Found: $UpdateSeven"; Continue}

        if (Test-Path $SessionsXmlInstall) {
            if ($null -eq $Update.FileKBNumber) {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.KBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            } else {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        #Get updated Sessions.xml and check again
        if (Test-Path $SessionsXmlInstall) {
            [xml]$XmlDocument = Get-Content -Path $SessionsXmlInstall
        }

        if (Test-Path $SessionsXmlInstall) {
            if ($null -eq $Update.FileKBNumber) {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.KBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            } else {
                if ($XmlDocument.Sessions.Session.Tasks.Phase.package | Where-Object {$_.Name -like "*$($Update.FileKBNumber)*" -and $_.targetState -eq 'Installed'}) {
                    Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                    Continue
                }
            }
        }

        if ($null -eq $Update.FileKBNumber) {
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-WindowsSevenOS-KB$($Update.KBNumber).log"
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.KBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        } else {
            $CurrentLog = "$Info\logs\$((Get-Date).ToString('yyyy-MM-dd-HHmmss'))-Update-WindowsSevenOS-KB$($Update.FileKBNumber).log"
            if (Get-WindowsPackage -Path "$MountDirectory" | Where-Object {$_.PackageName -match "$($Update.FileKBNumber)"}) {
                Write-Host -ForegroundColor Gray "INSTALLED         $($Update.Title) - $($Update.FileName)"
                Continue
            }
        }

        Write-Host -ForegroundColor Cyan "INSTALLING        " -NoNewline
        Write-Host -ForegroundColor Gray "$($Update.Title) - $($Update.FileName)"

        Write-Verbose "CurrentLog: $CurrentLog"
        Try {Add-WindowsPackage -Path "$MountDirectory" -PackagePath "$UpdateSeven" -LogPath "$CurrentLog" | Out-Null}
        Catch {
            $ErrorMessage = $_.Exception.$ErrorMessage
            Write-Warning "$CurrentLog"
            Write-Host "$ErrorMessage"
            if ($ErrorMessage -like "*0x800f081e*") {Write-Warning "Update not applicable to this Operating System"}
        }
    }
}