{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      alacritty
      jetbrains-mono

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
      ripgrep
      sd
      shellcheck
      starship
      tealdeer
      zellij
    ];
  };
}
