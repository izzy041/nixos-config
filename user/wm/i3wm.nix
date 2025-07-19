{ config, pkgs, ...}:
let
  text_colour = "#c0caf5";
  border_colour = "#f7768e";
  border_colour_light = "#bb9af7";
in
{
  imports = [
    ./picom.nix
    ./polybar.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "kitty";
      modifier = "Mod4";
      defaultWorkspace = "workspace number 1";

      bars = [];

      startup = [
        { command = "xrandr --output Virtual-1 --mode 1920x1080"; }
        { command = "feh --bg-fill ~/.dotfiles/user/wallpapers/wallpaper.png"; }
        {
          command = "~/.dotfiles/user/wm/polybar.sh";
          always = true;
        }
      ];

      gaps = {
      	inner = 10;
      	outer = 5;
      };

      fonts = {
        names = [
          "JetBrains Mono"
        ];
        style = "Regular";
        size = "10";
      };

      window = {
        titlebar = false;
        border = 5;
      };

      colors = {
        focused = {
          border = border_colour;
          childBorder = border_colour;
          background = border_colour;
          text = text_colour;
          indicator = "";
        };
        unfocused = {
          border = border_colour_light;
          childBorder = border_colour_light;
          background = border_colour_light;
          text = text_colour;
          indicator = "";
        };
      };
    };
  };
}
