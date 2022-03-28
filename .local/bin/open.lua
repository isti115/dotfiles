#!/usr/bin/env lua

associations = {
  { filter = '.*.png$', command = "vimiv" },
  { filter = '.*.jpg$', command = "vimiv" },
  { filter = '.*.pdf$', command = "zathura" },
  { filter = '.*.mp3$', command = "mpv --force-window" },
  { filter = '.*.mp4$', command = "mpv --force-window" },
  { filter = '.*.svg$', command = "inkscape" },
  { filter = '.*.doc$', command = "libreoffice" }
}

for _, a in pairs(associations) do
  if string.match(arg[1], a.filter) then
    os.execute(a.command .. ' "' .. arg[1] .. '"')
    break
  end
end
