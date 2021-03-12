Set-PSReadlineOption -EditMode vi

Set-PSReadlineOption -ViModeIndicator Cursor

Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Insert
Set-PSReadlineKeyHandler -Key Ctrl+r -Function ReverseSearchHistory -ViMode Command

Set-PSReadlineKeyHandler -Key Ctrl+s -Function ForwardSearchHistory -ViMode Insert
Set-PSReadlineKeyHandler -Key Ctrl+s -Function ForwardSearchHistory -ViMode Command

# Set-PSReadlineKeyHandler -Key Ctrl+LeftArrow -Function ReverseSearchHistory -ViMode Command

# Currently not in use:
# Install-Module -Name PSFzf -Scope CurrentUser
#
# Active:
# Install-Module posh-git -Scope CurrentUser
# Install-Module oh-my-posh -Scope CurrentUser
# https://github.com/JanDeDobbeleer/oh-my-posh
# Install-Module oh-my-posh -Scope CurrentUser -AllowPrerelease

Import-Module posh-git
Import-Module oh-my-posh

# Set-Prompt
# Set-Theme AgnosterPlus
# Set-Theme AgnosterPlusCustom
# Set-PoshPrompt -Theme agnosterplus
Set-PoshPrompt -Theme /home/isti/.config/powershell/PoshThemes/agnoster-plus-custom.omp.json

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
  git --git-dir=$Env:HOME/.dotfiles/ --work-tree=$Env:HOME $args
}

function lazydotfiles {
  lazygit --git-dir=$Env:HOME/.dotfiles/ --work-tree=$Env:HOME
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

function exec($cmd) {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert($cmd)
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadlineKeyHandler -Key Ctrl+e -ViMode Insert -ScriptBlock {
  Start-Process -FilePath ranger -ArgumentList '.' -Wait
}
Set-PSReadlineKeyHandler -Key Ctrl+e -ViMode Command -ScriptBlock {
  Start-Process -FilePath ranger -ArgumentList '.' -Wait
}

$fzf_history = {
  $history = Get-Content -Raw (Get-PSReadLineOption).HistorySavePath

  $p = [System.Diagnostics.Process]@{StartInfo = @{
    FileName = "fzf";
    Arguments = "--tac --no-sort --bind tab:toggle-sort --height `"25%`"";
    RedirectStandardInput = $true;
    RedirectStandardOutput = $true;
  }}

  $p.Start()
  $p.StandardInput.Write($history)
  $p.StandardInput.Close()
  $stdout = $p.StandardOutput.ReadToEnd()
  $p.WaitForExit()

  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert($stdout.Trim())
}

Set-PSReadlineKeyHandler -Chord Ctrl+f -ViMode Insert -ScriptBlock $fzf_history
Set-PSReadlineKeyHandler -Chord Ctrl+f -ViMode Command -ScriptBlock $fzf_history

$fzf_directory = {
  exec("fd -t d | fzf | cd")
}

Set-PSReadlineKeyHandler -Chord Ctrl+g -ViMode Insert -ScriptBlock $fzf_directory
Set-PSReadlineKeyHandler -Chord Ctrl+g -ViMode Command -ScriptBlock $fzf_directory
