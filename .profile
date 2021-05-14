# ~/.profile is loaded under PowerShell when launched as login shell:
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pwsh?view=powershell-7.1#-login---l

export PATH="${PATH}:${HOME}/.local/bin"

export EDITOR=nvim
export VISUAL=nvim

export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
