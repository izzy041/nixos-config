{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;

  shellIntegration = {
    enableZshIntegration = true;
    enableBashIntegration = true;
  };
    enableGitIntegration = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      window_padding_width = 20;
      placement_strategy = "top";
      enable_audio_bell = false;
    };

    extraConfig = builtins.readFile ./tokyonight.conf;
  };
}
