{ config, pkgs, ... }:

{
  users.users.mid = {
      isNormalUser = true;
      description = "The Middle Way";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        audacity
        chromium
        clamav
        firefox
        gimp
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
      ];
  };

}
