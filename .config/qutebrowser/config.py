config.load_autoconfig(True)

config.source('base16-gruvbox-dark-hard.config.py')

c.fonts.default_family = "Iosevka"
# c.fonts.default_family = "DejaVuSansMono Nerd Font"

c.tabs.last_close = "close"
c.session.lazy_restore = True

c.url.searchengines = {
  "DEFAULT": "google.com/search?q={}",
  "g": "google.com/search?q={}",
  "d": "duckduckgo.com/?q={}",
  "y": "youtube.com/results?search_query={}",
  "enhu": "translate.google.com/?op=translate&sl=en&tl=hu&text={}",
  "huen": "translate.google.com/?op=translate&sl=hu&tl=en&text={}"
}

# c.aliases['r'] = 'session-load'
c.aliases['suspend'] = 'open qute://back ;; tab-next'

# config.set('content.autoplay', False, '*://*.youtube.com/*')

# config.bind("<Space>1", ' ;; '.join([f'tab-select {x}/1' for x in range(20)]))
config.bind("<Space>A", "set-cmd-text :open -t file:///home/isti/tmp/tmp.html#")
config.bind(
  "<Space>a",
  "spawn --userscript qutebrowser-sway.ps1"
)

config.bind("<Ctrl+k>", "tab-move -")
config.bind("<Ctrl+j>", "tab-move +")

config.bind("<Space><Space>", "mode-enter passthrough")
config.bind("<Space>,", "set-cmd-text -s :tab-select")

config.bind("<Space>qq", "tab-close")
config.bind("<Space>qQ", "close")
config.bind("<Space>qa", "quit")
config.bind("<Space>qr", "config-source")

config.bind("<Space>sS", "session-save all")
config.bind("<Space>ss", "set-cmd-text -s :session-save -o")
config.bind("<Space>sl", "set-cmd-text -s :session-load")

config.bind("<Space>tt", "config-cycle tabs.show always multiple never")
config.bind("<Space>ts", "config-cycle statusbar.show always never")

config.bind("<Space>tf", "jseval document.body.requestFullscreen()")

config.bind("<Space><Ctrl+m>", "spawn mpv --force-window=immediate {url}")
config.bind("<Space>m", "spawn umpv --force-window=immediate {url}")
config.bind("<Space>M", "hint --rapid links spawn umpv --force-window=immediate {hint-url}")
