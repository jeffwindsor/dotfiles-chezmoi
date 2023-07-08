{ config, pkgs, ... }:{

  # package manager config
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
  nixpkgs.config.allowUnfree = true;    # allow more packages
  system.autoUpgrade.enable = true;     # auto update nixos and nix packages

}
