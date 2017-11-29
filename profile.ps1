# Sometimes powershell spazzes and fucks the prompt colors.
# This unfucks it. And this is easier for me to remember.
function rcolors {
	[Console]::ResetColor()
}

# Again I find this hard to remember.
# My dumbass will remember this better.
function remove-alias {
	param(
		$alias
	)

	remove-item alias:\$alias
}

Set-Variable $env:path "$env:path;C:\tools\cmder;C:\tools\neovim;C:\Users\Kevin Pickard\AppData\Roaming\npm"