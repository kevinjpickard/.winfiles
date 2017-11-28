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
# Update Help for Modules
$helpJob = Start-Job -ScriptBlock {Update-Help -Force}

### Package Providers
Get-PackageProvider NuGet -Force

### Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco feature enable -n=allowGlobalConfirmation

# Install git
cinst git

# Clone winfiles
git clone https://github.com/kevinjpickard/.winfiles.git $HOME/.winfiles

# Install all packages from packages.config
choco install $HOME/.winfiles/packages.config

# Reload profile for new tools and update $PATH
refreshenv

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

## Create scratch dir
mkdir C:\scratch
cd C:\scratch
curl https://raw.githubusercontent.com/kevinjpickard/.winfiles/master/settings.ps1 -UseBasicParsing -o settings.ps1

# Apply the settings
.\settings.ps1
