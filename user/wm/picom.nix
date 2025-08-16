{ pkgs, config, ... }:
let
  fade-step = 0.13;
in
{
  services.picom = {
    enable = true;

    backend = "glx";

    fade = true;

    inactiveOpacity = 0.9;

    settings = {
      corner-radius = 5;
      rounded-corners-exclude = [
        "class_g = 'Polybar'"
      ];
      
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };

      fade-in-step = fade-step;
      fade-out-step = fade-step;

      # Broken ):
      # animations = [
      #   {
      #     triggers = [ "close" "hide" ];
      #     preset = "slide-out";
      #     direction = "down";
      #   }
      # ];

    };
  };
}
