{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
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
      gnome-firmware
    ];
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "";
  };
}
