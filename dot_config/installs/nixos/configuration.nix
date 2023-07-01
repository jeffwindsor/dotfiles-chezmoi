{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      # services
      avahi   # print services
      fwupd   # firmware update service

      # fonts
      jetbrains-mono

      # shells
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting

      # gnome de
      gnome-extension-manager
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.caffeine
      gnomeExtensions.executor
      gnomeExtensions.forge
      gnomeExtensions.just-perfection
      gnomeExtensions.openweather
      gnomeExtensions.space-bar
      gnomeExtensions.wallpaper-switcher

      # applications
      alacritty
      audacity
      chromium
      clamav
      firefox
      gimp
      gnome-firmware
      gnucash
      google-chrome
      libreoffice
      librewolf
      megasync
      newsflash
      nix-direnv
      obsidian
      spotify
      transmission-gtk
      vlc

      # terminal
      bat
      bottom
      broot
      chezmoi
      exa
      fclones
      fd
      fortune
      fzf
      gcc
      git
      gitui
      helix
      lf
      neovim
      ripgrep
      sd
      shellcheck
      starship
      tealdeer
      tlp
      zellij
    ];
  };

  hardware.pulseaudio.enable = false;

  # Select internationalisation properties.
  i18n ={
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  networking = {
    hostName = "frame";
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  security.rtkit.enable = true;

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };

    flatpak.enable = true;

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      layout = "us";
      xkbVariant = "";
    };
  };

  sound.enable = true;

  system ={
    autoUpgrade.enable = true;
    stateVersion = "23.05";
  };

  time.timeZone = "America/Los_Angeles";

  users = {
    defaultUserShell = pkgs.zsh;
    users.mid = {
      isNormalUser = true;
      description = "The Middle Way";
      extraGroups = [ "networkmanager" "wheel" ];
      #packages = with pkgs; [];
    };
  };

}
