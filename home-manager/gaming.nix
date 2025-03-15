{ config, lib, pkgs, ... }:

{
  # Home packages to install
  home.packages = with pkgs; [
    bottles
    heroic
    mangohud
    goverlay
    gamemode
    wine
    winetricks
    protontricks
  ];


  # Custom module imports
  imports = [
    ./mangohud.nix
  ];
}
