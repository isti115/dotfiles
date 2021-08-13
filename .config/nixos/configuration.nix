# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "libra"; # Define your hostname.
  networking.extraHosts =
    ''
      192.168.0.1     router
      192.168.1.115   aquarius
      192.168.3.14    lunokhod
      192.168.0.225   orion
      192.168.0.56    zolipi
      192.168.0.65    zolipi-wifi
      192.168.0.130   lifebook
      192.168.0.133   lifebook-wifi
      192.168.0.3     esztisurface
      192.168.0.105   falcon
      127.0.0.1       local.donko.hu
    '';

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.iwd.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Budapest";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp6s0 = {
    useDHCP = false;
    ipv4.addresses = [ { address = "192.168.0.205"; prefixLength = 24; } ];
  };
  networking.defaultGateway = "192.168.0.1";
  networking.nameservers = ["8.8.8.8"];
  # networking.interfaces.wlan0.useDHCP = true;
  # networking.interfaces.enp1s0f0u2.useDHCP = true;
  # networking.interfaces.wlp5s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.earlyoom = {
    enable = true;
    enableNotifications = true;
  };

  # services.dnsmasq = {
  #   enable = true;
  #   servers = [
  #     "8.8.8.8"
  #     "8.8.4.4"
  #   ];
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
      ];
    };
  };

  environment.etc."xdg/user-dirs.defaults".text = ''
    XDG_DESKTOP_DIR="$HOME/desk"
    XDG_DOWNLOAD_DIR="$HOME/dl"
    XDG_TEMPLATES_DIR="$HOME/templates"
    XDG_PUBLICSHARE_DIR="$HOME/pub"
    XDG_DOCUMENTS_DIR="$HOME/doc"
    XDG_MUSIC_DIR="$HOME/mus"
    XDG_PICTURES_DIR="$HOME/pic"
    XDG_VIDEOS_DIR="$HOME/vid"
  '';

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.users.root.initialHashedPassword = "$6$kurfi4dJv9p5cnXH$DqiCgWRH.UvSX9ptEOf2Akz1onlS5dCQqL..33fC/Cwh24KsO1riX.zewgjPG885gcZWNsbIfyuVhVsikPSjj1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.isti = {
    isNormalUser = true;
    extraGroups = [ "wheel" "adbusers" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$LtpIwW35QyV.BaQh$FtpelPd0rfF8.fMQza9kMJoXFp.M75MtLl4MG0EM10qVFa4utYV7MsL7mJWqRyPIfST7MDanKEws5jUDyO6B9.";
    shell = pkgs.powershell;
  };

  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
    (nerdfonts.override { fonts = [ "DejaVuSansMono" ]; })
    iosevka
    # liberation_ttf
    # fira-code
    # fira-code-symbols
    # mplus-outline-fonts
    # dina-font
    # proggyfonts
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))

    (self: super: {
      # mpv = super.mpv-with-scripts.override {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.mpris ];
      };
    })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # wget
    # firefox
    powershell
    neovim-unwrapped
    # neovim-remote

    git lazygit

    ranger lf edir
    rsync
    lftp
    p7zip
    fd fzf ripgrep
    filelight

    ffmpeg

    htop bottom

    alacritty

    vimiv-qt
    vlc mpv # mpv-unwrapped mpvScripts.mpris
    gimp
    inkscape
    audacity
    filezilla
    qutebrowser firefox
    blender
    zathura

    obs-studio

    qemu
    nmap

    pavucontrol

    breeze-icons hicolor-icon-theme gruvbox-dark-icons-gtk
    xfce.thunar xfce.tumbler # xfce.xfconf xfce.exo

    nodejs
    python3
    lua
    ghc

    trash-cli
    youtube-dl
    xdg-user-dirs
    # earlyoom
  ];

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   configure = {};
  # };

  programs.adb.enable = true;
  programs.tmux.enable = true;

  programs.sway.enable = true;
  programs.sway.extraPackages = with pkgs; [
    waybar playerctl
    wofi
    wl-clipboard clipman
    mako
    grim slurp swappy
    wayvnc
  ];

  programs.steam.enable = true;

  # environment.variables = {
  #   PATH = "~/.local/bin";

  #   EDITOR = "nvim";
  #   VISUAL = "nvim";
  # };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}
