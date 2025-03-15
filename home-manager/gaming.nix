{ config, lib, pkgs, ... }:

{
  # Home packages to install
  home.packages = with pkgs; [
    ppsspp
    bottles
    mangohud
    goverlay
    gamemode
    wine
    winetricks
    protontricks
  ];

  # Enabling Gamemode for performance optimizations
  programs.gamemode.enable = true;

  # Custom module imports
  imports = [
    ./mangohud.nix
  ];
}
