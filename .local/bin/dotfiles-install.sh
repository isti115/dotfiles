#! /usr/bin/env sh

# Based on: https://www.atlassian.com/git/tutorials/dotfiles

# git://github.com/<user>/<repo>
git clone --bare http://github.com/Isti115/dotfiles.git $HOME/.dotfiles

function dotfiles {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles checkout
dotfiles config status.showUntrackedFiles no
