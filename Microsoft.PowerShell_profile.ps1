# Adding a dummy comment so chocolatey can install tab completion cuz apparently if its below 4 bytes it doesn't work

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
. $profile.currentuserallhosts
