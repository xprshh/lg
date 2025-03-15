{ pkgs, ... }: {
  programs.mangohud = {
    enable = true;
    settings = {
      preset = "-1";

      font_file = "${pkgs.iosevka}/share/fonts/truetype/Iosevka-Bold.ttf";
      font_size = 24;
      round_corners = 10.0;

      gpu_temp = true;
      cpu_temp = true;

      ram = true;
      vram = true;

      engine_version = true;
    };
  };
}
