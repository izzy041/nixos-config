{ pkgs, config, ... }:
let
  colours = {
    bg = "1a1b26";
    fg = "";
  };
in
{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      alsaSupport = true;
      pulseSupport = true;
    };
    
    script = "polybar top &amp;";

    settings = {
      "bar/top" = {
        monitor = "\${env:MONITOR:Virtual-1}";

        width = "100%";
        height = "4%";

        background = colours.bg;

        radius-bottom = 10;

        modules-center = "date";
        fixed-center = true;
        modules-right = "volume";

        font-0 = "JetBrainsMonoNerdFont:size=10;0";

        label-active-font = 0;
        label-inactive-font = 0;

        padding = 5;
      };

      "module/volume" = {
        type = "internal/pulseaudio";
        format.volume = "<ramp-volume> <label-volume>";
        label.muted.ext = "󰖁";
        lable.muted.foreground = "#666";
        ramp.volume = ["󰕿" "󰖀" "󰕾"];
      };
      
      "module/date" = {
        type = "internal/date";
        internal = 5;
        date = "%d/%m/%y";
        time = "%H:%M";
        label = "%time% %date%";
      };
    };
  };
}
