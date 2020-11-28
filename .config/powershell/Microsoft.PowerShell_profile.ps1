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

# $ENV:TERM = "xterm"
# $ENV:EDITOR = "nvim"
# $ENV:VISUAL = "nvim"
# $SHELL = $ENV:SHELL

$MaximumHistoryCount = 32767

Set-Alias tp trash-put

function yw {
  youtube-viewer -C --player=vlc
}

function ec {
  emacsclient --alternate-editor="" -t --create-frame $args
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

function sw {
  sway --my-next-gpu-wont-be-nvidia
}

# function em {
#   emacsclient -a="" -nw $args
# }

function extension-statistics {
  find . -type f | sed 's/.*\.//' | sort | uniq -c
}

Set-PSReadlineKeyHandler -Key Ctrl+e -ViMode Insert -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('ranger .')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
Set-PSReadlineKeyHandler -Key Ctrl+e -ViMode Command -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('ranger .')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

function rr {
  ranger .
}
