## Dependencies
# Update Help for Modules
Update-Help -Force

### Package Providers
Get-PackageProvider NuGet -Force

### Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco feature enable -n=allowGlobalConfirmation

# system and cli
cinst curl #`curl` comes with GH4W
cinst nuget.commandline
cinst wget
cinst wput

# browsers
cinst GoogleChrome
cinst Firefox
cinst Opera

# dev tools and frameworks
cinst nodejs.install
cinst ruby
cinst vim
cinst winmerge

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

## Other Apps and things I need
cinst 7zip
cinst filezilla
cinst gimp
cinst git
cinst imgburn
cinst putty
cinst spotify
cinst steam
cinst SublimeText3
cinst vagrant
cinst veracrypt
cinst virtualbox
cinst vlc
cinst winscp

.\settings.ps1