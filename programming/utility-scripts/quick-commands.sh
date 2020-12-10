#! /usr/bin/env sh

# Disabled options
# --cache-file /dev/null \
# --sort-order alphabetical \

wofi \
  --show dmenu \
  --insensitive \
  --prompt "Quick commands:" \
<<COMMANDS | sh
# - Sway --------------------------------------- #
swaymsg "input * tap enabled"                    # Enable tapping on the touchpad
swaymsg output HEADLESS-1 position 4480 600      # Fix the position of the headless output
# - Termite ------------------------------------ #
termite -e "pwsh -c 'echo sajt; sleep 5'"        # Echo something
termite -e "pwsh --noexit -c fc-list"            # List available fonts
# - PulseAudio --------------------------------- #
pactl load-module module-loopback latency_msec=1 # PulseAudio - Load loopback module
pactl unload-module module-loopback              # PulseAudio - Unload loopback module
pulseaudio -k                                    # PulseAudio - Kill
# - LifeBook ----------------------------------- #
                                                 # Wake LifeBook 00:17:42:c2:a4:4b
ssh lifebook sudo reboot                         # Reboot LifeBook
ssh lifebook sudo poweroff                       # Power off / shut down LifeBook
COMMANDS

# - Clipboard ---------------------------------- #
# urxvt -e "sh -c 'wl-paste | xclip -sel clip'"    # Copy clipboard content to XWayland
