{ config, pkgs, ... }:{

  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "frame";
  time.timeZone = "America/Los_Angeles";
  system.stateVersion = "23.05";

  # system packages
  environment.systemPackages = with pkgs; [
    fwupd   # firmware update service
    tlp     # laptop power mgmt service
  ];

  # printing services
  printing.enable = true;

  # sound services via pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # internationalization to be safe
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

  # Extras
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
  networking.networkmanager.enable = true;
  security.rtkit.enable = true;
}
