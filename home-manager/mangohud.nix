{ pkgs, ... }: {
  programs.mangohud = {
    enable = true;
    settings = {
      preset = "-1";

      font_file = "${pkgs.ubuntu_nerd_font}/share/fonts/ttf/Ubuntu-Nerd-Font-Regular.ttf";
      font_size = 24;
      round_corners = 6.0;

      gpu_temp = true;
      cpu_temp = true;

      ram = true;
      vram = true;

      engine_version = true;
    };
  };
}
