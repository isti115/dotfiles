Set-PSReadlineOption -EditMode vi

Set-PSReadlineOption -ViModeIndicator Cursor

Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Insert
Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Command

Set-PSReadlineKeyHandler -Key Ctrl+s -Function ForwardSearchHistory -ViMode Insert
Set-PSReadlineKeyHandler -Key Ctrl+s -Function ForwardSearchHistory -ViMode Command

# Set-PSReadlineKeyHandler -Key Ctrl+LeftArrow -Function ReverseSearchHistory -ViMode Command

# Install-Module posh-git -Scope CurrentUser
# Install-Module oh-my-posh -Scope CurrentUser

# https://github.com/JanDeDobbeleer/oh-my-posh

Import-Module posh-git
Import-Module oh-my-posh
# Set-Prompt
Set-Theme AgnosterPlus

$ENV:TERM = "xterm"
# $SHELL = $ENV:SHELL

Set-Alias tp trash-put

function yw {
  youtube-viewer -C --player=vlc
}

function ec {
  emacsclient -create-frame --alternate-editor="" $args
}

function aurclone($name) {
  git clone "https://aur.archlinux.org/$name.git"
}

function aurinstall($name) {
  aurclone $name
  cd $name
  makepkg -si
  cd ../
}

function dotfiles {
  git --git-dir=$home/.dotfiles/ --work-tree=$home $args
}
