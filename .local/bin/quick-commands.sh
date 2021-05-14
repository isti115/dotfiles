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
swaymsg create_output                            # Create virtual output
# - Termite ------------------------------------ #
termite -e "pwsh -c 'echo sajt; sleep 5'"        # Echo something
termite -e "pwsh --noexit -c fc-list"            # List available fonts
# - Audio -------------------------------------- #
pactl load-module module-loopback latency_msec=1 # PulseAudio - Load loopback module
pactl unload-module module-loopback              # PulseAudio - Unload loopback module
pulseaudio -k                                    # PulseAudio - Kill
pkill pipewire                                   # PipeWire - Kill
pw-jack catia                                    # Catia with Jack
pw-jack qjackctl                                 # QJackCtl with Jack
pw-jack bitwig-studio                            # Bitwig with Jack
# - LifeBook ----------------------------------- #
ssh lifebook-wifi "~/swaymsg-anywhere.sh 'exec vncviewer 192.168.0.205 -FullScreen'" # Start VNC viewer
ssh lifebook-wifi "~/swaymsg-anywhere.sh 'workspace back_and_forth'" # Blank or unblank screen
                                                 # Wake LifeBook 00:17:42:c2:a4:4b
ssh lifebook-wifi sudo reboot                    # Reboot LifeBook
ssh lifebook-wifi sudo poweroff                  # Power off / shut down LifeBook
# - Screen Sharing ----------------------------- #
/usr/lib/xdg-desktop-portal-wlr -r -o DP-1       # Share main screen
/usr/lib/xdg-desktop-portal-wlr -r -o HDMI-A-1   # Share secondary screen
/usr/lib/xdg-desktop-portal-wlr -r -o DP-2       # Share tertiary screen
pkill -f xdg-desktop-portal                      # Kill screen sharing
# - Programs with special parameters ----------- #
progl /opt/resolve/bin/resolve                   # Davinci Resolve
grep -oP "(?<=\[).*\.pdf(?=\])" ~/.local/share/zathura/history | wofi --dmenu | xargs zathura
COMMANDS

# - Clipboard ---------------------------------- #
# urxvt -e "sh -c 'wl-paste | xclip -sel clip'"    # Copy clipboard content to XWayland
