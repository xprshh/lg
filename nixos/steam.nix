{ config, ... }: {
  programs = {
 donf.enable = true;
    steam = {
      enable = true; # i use steam for light gaming but will get a gaming laptop in the feature so i can heavy gaming
      gamescopeSession.enable = config.programs.gamescope.enable;
    };

    gamescope.enable = true;
  };
}
