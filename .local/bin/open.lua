#!/usr/bin/env lua

if string.match(arg[1], '.*.png$') then os.execute("vimiv " .. arg[1])
elseif string.match(arg[1], '.*.jpg$') then os.execute("vimiv " .. arg[1])
elseif string.match(arg[1], '.*.pdf$') then os.execute("zathura \"" .. arg[1] .. "\"")
elseif string.match(arg[1], '.*.mp3$') then os.execute("mpv --force-window " .. arg[1])
elseif string.match(arg[1], '.*.svg$') then os.execute("inkscape " .. arg[1])
elseif string.match(arg[1], '.*.doc$') then os.execute("libreoffice " .. arg[1])
end
