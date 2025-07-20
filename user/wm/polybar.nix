{ pkgs, config, ... }:
let
  colours = {
    bg = "#701a1b26";
    fg = "#c0caf5";
    border = "#cfc9c2";
  };

  dimensions = {
    height = "3%";
    offset-x = "45%";
    offset-y = "1.3%";
    border-size = "0";
    radius = 10;
  };

  font = "JetBrainsMonoNerdFont:size=8;0";
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      pulseSupport = true;
      i3Support = true;
    };

    script = builtins.readFile ./polybar.sh;

    settings = {
      "bar/dummy" = {
        modules-center = "dummy";
        width = "0%";
        height = "3.5%";
        background = "#00000000";
        offset-y = dimensions.offset-y;
        wm-restack = "i3";
      };

      "module/dummy" = {
        type = "custom/text";
        label = "dummy bar";
        hidden = true;
      };

      "bar/center" = {
        wm-restack = "i3";

        width = "10%";
        height = dimensions.height;

        offset-x = dimensions.offset-x;
        offset-y = dimensions.offset-y;

        background = colours.bg;
        foreground = colours.fg;

        radius = dimensions.radius;

        modules-center = "date time";
        fixed-center = true;

        override-redirect = true;

        font-0 = font;

        label-active-font = 0;
        label-inactive-font = 0;

        border-size = dimensions.border-size;
        border-color = colours.border;

        separator = " | ";
      };

      "bar/left" = {
        wm-restack = "i3";
        override-redirect = true;

        width = "15%";
        height = dimensions.height;

        offset-y = dimensions.offset-y;
        offset-x = "0.85%";

        background = colours.bg;
        foreground = colours.fg;

        radius = dimensions.radius;

        modules-center = "workspaces";

        font-0 = font;
        label-active-font = 0;
        label-inactive-font = 0;

        border-size = dimensions.border-size;
        border-color = colours.border;
      };

      "bar/right" = {
        wm-restack = "i3";
        override-redirect = true;

        width = "15%";
        height = dimensions.height;

        offset-y = dimensions.offset-y;
        offset-x = "84.15%%";

        background = colours.bg;
        foreground = colours.fg;

        radius = dimensions.radius;

        modules-center = "cpu memory tray";

        font-0 = font;
        label-active-font = 0;
        label-inactive-font = 0;

        border-size = dimensions.border-size;
        border-color = colours.border;

        separator = " | ";
      };

      "module/volume" = {
        type = "internal/pulseaudio";

        format.volume = "<ramp-volume> <label-volume>";
        "format-volume-padding" = "2";

        label.muted.text = "󰖁";
        label.muted.foreground = colours.fg;

        ramp.volume = [
          "󰕿"
          "󰖀"
          "󰕾"
        ];
      };

      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d/%m/%y";
        label = "%date%";
      };

      "module/time" = {
        type = "internal/date";
        internal = 5;
        time = "%H:%M";
        label = "%time%";
      };

      "module/workspaces" = {
        type = "internal/i3";
        pin-workspaces = true;
        show-urgent = true;
        strip-wsnumbers = false;
        index-sort = true;
        enable-click = false;
        enable-scroll = false;

        format = "<label-state> <label-mode>";
        label-mode = "%mode%";
        label-mode-padding = 2;
        label-mode-background = colours.bg;

        label-focused = "%index%";
        label-focused-background = "#565f89";
        label-focused-foreground = colours.fg;
        label-focused-underline = "#bb9af7";
        label-focused-padding = 1;

        label-unfocused = "%index%";
        label-unfocused-padding = 1;

        label-urgent = "%index%";
        label-urgent-foreground = colours.fg;
        label-urgent-background = colours.bg;
        label-urgent-padding = 1;

        label-separator = "|";
        label-separator-padding = 0.5;
        label-separator-foreground = colours.fg;
      };

      "module/window-title" = {
        type = "internal/xwindow";

        format = "<label>";
        format-background = colours.bg;
        format-padding = 2;

        label = "%title%";
        label-maxlen = 50;

        label-empty = "Empty";
        label-empty-foreground = colours.fg;
      };

      "module/tray" = {
        type = "internal/tray";
      };

      "module/cpu" = {
        type = "internal/cpu";

        format = "<label>";

        label = " %percentage%%";
        label-warn = " %percentage%";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 3;
        warn-percentage = 95;

        format = "<label>";

        label = " %gb_used%/%gb_free%";
        label-warn = " %gb_used%/%gb_free%";
      };
    };
  };
}
