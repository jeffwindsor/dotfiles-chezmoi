{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  time.timeZone = "America/Los_Angeles";
  networking.hostName = "frame";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mid = {
    isNormalUser = true;
    description = "The Middle Way";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #bandwhich
      #buku

      alacritty
      audacity
      bat
      bottom
      broot
      chezmoi
      chromium
      clamav
      exa
      fclones
      fd
      firefox
      fortune
      fzf
      gcc
      gimp
      git
      gitui
      gnome-extension-manager
      gnome-firmware
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.caffeine
      gnomeExtensions.executor
      gnomeExtensions.forge
      gnomeExtensions.just-perfection
      gnomeExtensions.openweather
      gnomeExtensions.space-bar
      gnomeExtensions.wallpaper-switcher
      gnucash
      google-chrome
      helix
      lf
      libreoffice
      librewolf
      megasync
      neovim
      newsflash
      nix-direnv
      obsidian
      ripgrep
      sd
      shellcheck
      spotify
      starship
      tealdeer
      tlp
      transmission-gtk
      vlc
      zellij
      zsh
      zsh-autosuggestions
      zsh-syntax-highlighting

      # fonts
      jetbrains-mono
      #font-awesome

    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    avahi   # print services
    fwupd   # firmware update service
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  networking.networkmanager.enable = true;
  security.rtkit.enable = true;

  # zsh and addons
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  programs.zsh.autosuggestions.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  # services
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

  system ={
    autoUpgrade.enable = true;
    stateVersion = "23.05";
  };
}
