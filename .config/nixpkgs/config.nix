{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    staging = import (builtins.fetchTarball {
      # Descriptive name to make the store path easier to identify
      name = "staging";
      # Commit hash for nixos-unstable as of 2018-09-12
      url = "https://github.com/NixOS/nixpkgs/tarball/staging-next";
      # Hash obtained using `nix-prefetch-url --unpack <url>`
      sha256 = "0q847qhj7y6vb7y2i9pgkn3zj8i7qm6pwh0v52nph0s9s9iy4dzs";
    }) {};

    bitwig-studio4 = import ./bitwig-studio4.nix;
  };
}
