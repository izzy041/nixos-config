{ pkgs, config, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    settings = {
            theme = "tokyonight";

      font-family = "JetBrains Mono";
      font-size = 10;

      window-decoration = "none";
      gtk-adwaita = false;
    };

  };
}
