{ config, pkgs, ... }:{

  imports = [
    ./gnome.nix
    #./hyprland.nix
    ./zsh.nix
    ./framework-laptop.nix
  ];

  # users with user only packages
  users.users.mid = {
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
      chromium
      firefox
    ];
  };

  # system wide packages
  environment.systemPackages = with pkgs; [
    # applications
    alacritty
    clamav

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

}
