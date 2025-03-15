{ config, ... }: {
  programs.steam = {
    enable = true; # I use Steam for light gaming but will get a gaming laptop in the future for heavy gaming
    gamescopeSession.enable = config.programs.gamescope.enable;
  };
}
