$env.EDITOR = 'nvim'

$env.PATH = do {
  use std 'path add'
  path add ~/.local/bin
  $env.PATH
}
