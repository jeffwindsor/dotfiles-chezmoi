{ config, pkgs, ... }:{

  environment.systemPackages = with pkgs; [
    hyprland
    wofi
  ];

  programs.hyprland.enable = true;

}
