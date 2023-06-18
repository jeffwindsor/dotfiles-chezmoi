{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  time.timeZone = "America/Los_Angeles";
  networking.hostName = "frame"; # Define your hostname.
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mid = {
    isNormalUser = true;
    description = "The Middle Way";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    avahi
    bat
    bottom
    broot
    chezmoi
    clamav
    direnv
    exa
    fclones
    fd
    fortune
    fzf
    gcc
    git
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
    lf
    neovim
    ripgrep
    sd
    shellcheck
    starship
    tealdeer
    tlp
    zellij
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting

    chromium
    clapper
    firefox
    gnucash
    google-chrome
    jetbrains-mono
    librewolf
    megasync
    newsflash
    obsidian
    spotify
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # shells
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # services
  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };

  services.printing = {
    enable = true;
    browsing = true;
    nssmdns = true;
    openFirewall = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "23.05";
}
