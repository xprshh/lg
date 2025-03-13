{pkgs, ...}: let
  nx-clean = pkgs.writeShellScriptBin "nx-clean" ''
sudo nix-env --delete-generations old
sudo nix-collect-garbage -d
sudo nix-store --gc
   sudo nix-store --optimise
  '';
in {
  home.packages = [nx-clean];
}
