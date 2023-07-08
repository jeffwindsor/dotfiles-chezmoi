{ config, pkgs, ... }:{

  imports = [
    ./gnome.nix
    #./hyprland.nix
    ./zsh.nix
    ./framework-laptop.nix
  ];

  # users with user only packages
  users.users = [
    mid = {
      isNormalUser = true;
      description = "The Middle Way";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        # applications
        audacity
        gimp
        gnucash
        libreoffice
        megasync
        newsflash
        obsidian
        spotify
        transmission-gtk
        vlc

        # web browsers
        google-chrome
      ];
    };
  ];

  # system wide packages
  environment.systemPackages = with pkgs; [
    # applications
    alacritty
    clamav

    # web browsers
    chromium
    firefox

    # fonts
    jetbrains-mono

    # command line utils
    bat
    bottom
    broot
    chezmoi
    exa
    fclones
    fd
    fortune
    freshfetch
    fzf
    gcc
    git
    gitui
    gnupg
    helix
    lf
    neovim
    nix-direnv
    ripgrep
    sd
    shellcheck
    starship
    tealdeer
    zellij
  ];

#

  nix = {
    # optimize space << https://nixos.wiki/wiki/Storage_optimization#Optimising_the_store
    settings.auto-optimise-store = true;

    # enable flakes << https://nixos.wiki/wiki/Storage_optimization#Automation
    settings.experimental-features = ["nix-command" "flakes"];

    # garbage collection on the regular << https://nixos.wiki/wiki/Storage_optimization#Automation
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # allow more packages
  nixpkgs.config.allowUnfree = true;

  # auto update nixos and nix pacakges
  system.autoUpgrade.enable = true;
}
