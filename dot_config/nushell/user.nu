alias ja = yazi
alias lg = lazygit
alias lvim = env NVIM_APPNAME="LazyVim" nvim
alias mvim = env NVIM_APPNAME="mini.nvim" nvim
alias reboot = echo "noop (avoiding accidents)"
alias zj = zellij

# --- GIT ---

def git-carbon-copy [commit: string] {
  let data = (
    git show
      --pretty="%an%x00%ae%x00%ct"
      --no-patch
      $commit
    | str trim
    | parse "{name}\u{0}{email}\u{0}{date}"
    | first
  )

  (
    GIT_COMMITTER_NAME=$data.name
    GIT_COMMITTER_EMAIL=$data.email
    GIT_COMMITTER_DATE=$data.date
    git cherry-pick $commit
  )
}

def --wrapped git-commit-diff [a: string, b: string, n: number = 1, ...rest] {
  git range-diff $"($a)~($n)..($a)" $"($b)~($n)..($b)" ...$rest
}

# --- IP ---

def ip-list-ifnames [] {
  ip -j link | from json | get ifname
}

export extern "ip a s" [
    ifname?: string@ip-list-ifnames
]

# --- NIX ---

def nix-env-list [] {
  nix-env -q
  | lines
  | parse --regex "(?<name>.*)-(?<version>[^-]*)"
  | each { {value: $in.name, description: $"($in.name)@($in.version)"} }
}

export extern "nix-env -e" [
  package: string@"nix-env-list"
]
