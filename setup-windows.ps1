Write-Host 'Installing Windows apps with WinGet'

$pkgs = @()

# Put your list of package IDs to install here
# $pkgs += "package.package"

# Microsoft stuff
$pkgs += "Microsoft.WindowsTerminal"
$pkgs += "Microsoft.PowerToys"
$pkgs += "Microsoft.VisualStudioCode"

# Communication tools
$pkgs += "Discord.Discord"
$pkgs += "SlackTechnologies.Slack"

# Entertainment
$pkgs += "Spotify.Spotify"
$pkgs += "Valve.Steam"

# Development tools
$pkgs += "vim.vim"
$pkgs += "suse.RancherDesktop"
$pkgs += "Oracle.VirtualBox"

# General Utilities
$pkgs += "Foxit.FoxitReader"
$pkgs += "File-New-Project.EarTrumpet"
$pkgs += "voidtools.Everything"
$pkgs += "stnkl.EverythingToolbar"
$pkgs += "Balena.Etcher"

# Design & Engineering
$pkgs += "KiCad.KiCad"
$pkgs += "GIMP.GIMP"
$pkgs += "Inkscape.Inkscape"
$pkgs += "Prusa3D.PrusaSlicer"

# Security
$pkgs += "Malwarebytes.Malwarebytes"

Foreach ($pkg in $pkgs) {

	$listOutput = winget list $pkg 

	if ($listOutput.Contains("No installed package found matching input criteria.")) {
		winget install $pkg
	} else {
		Write-Host $pkg": Already Installed, skipping."
	}
}
