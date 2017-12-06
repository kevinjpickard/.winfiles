$IsElevated = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

# Check to see if we are currently running "as Administrator"
if (!($IsElevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);

   exit
}

## Dependencies
# Update Help for Modules, but do it in the background because it can take a while
$helpJob = Start-Job -ScriptBlock {Update-Help -Force}

### Package Providers
Get-PackageProvider NuGet -Force

### Chocolatey
Write-Output "Installing chocolatey..."
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco feature enable -n=allowGlobalConfirmation

# Install git
cinst git

# Clone winfiles
& "C:\Program Files\git\bin\git.exe" clone https://github.com/kevinjpickard/.winfiles.git "$HOME\.winfiles"
# Symlink powershell profile
New-Item -ItemType SymbolicLink "$profile" -Value "$HOME\.winfiles\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\WindowsPowerShell" -Name "profile.ps1" -Value "$HOME\.winfiles\profile.ps1"

# Install all packages from packages.config
choco install "$HOME\.winfiles\packages.config"

# Reload profile for new tools and update $PATH
. $profile
refreshenv

Write-Output "Installing Node tools..."
npm install -g azure-cli
npm install -g babel-cli
npm install -g bower
npm install -g coffee-script
npm install -g conventional-changelog
npm install -g grunt-cli
npm install -g gulp
npm install -g less
npm install -g lineman
npm install -g mocha
npm install -g node-inspector
npm install -g node-sass
npm install -g yo

# Apply the settings
Write-Output "Updating settings..."
"$HOME\.winfiles\settings.ps1"
