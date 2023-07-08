{ config, pkgs, ... }:{

  imports = [
    ./desktop/gnome.nix
    ./component/zsh.nix
    ./component/nixos.nix
    ./service/laptop.nix
    ./service/ntfs.nix
    ./service/audio.nix
    ./service/printing.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "frame";
  time.timeZone       = "America/Los_Angeles";
  system.stateVersion = "23.05";

  # users
  users.users.mid = {
    isNormalUser  = true;
    description   = "The Middle Way";
    extraGroups   = [ "networkmanager" "wheel" ];
  };

  # system wide packages
  environment.systemPackages = with pkgs; [
    # applications
    alacritty
    audacity
    clamav
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
    chromium
    firefox
    google-chrome

    # fonts
    jetbrains-mono

    # command line utils
    bat
    broot
    chezmoi
    exa
    fd
    fortune
    freshfetch
    fzf
    gcc
    git
    gitui
    helix
    neovim
    ripgrep
    sd
    starship
    tealdeer
    xplr
    xclip
    zellij
  ];

}
