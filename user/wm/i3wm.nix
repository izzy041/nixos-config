{ config, pkgs, ... }:
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

      bars = [ ];

      keycodebindings = {
        "121" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "122" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
        "123" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
      };

      startup = [
        { command = "xrandr --output Virtual-1 --mode 1920x1080"; }
        {
          command = "feh --bg-fill ~/.dotfiles/user/wallpapers/wallpaper.png";
          always = true;
        }
        {
          command = "~/.dotfiles/user/wm/polybar.sh";
          always = true;
        }
      ];

      gaps = {
        top = 50;
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
