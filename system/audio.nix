{ pkgs, config, ... }:
{
   security.rtkit.enable = true;
   services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
     audio.enable = true;

     extraConfig.pipewire."92-low-latency" = {
       "context.properties" = {
         "default.clock.rate" = 48000;
         "default.clock.quantum" = 512;
         "default.clock.min-quantum" = 512;
         "default.clock.max-quantum" = 2048;
       };
     };
   };
  
   services.actkbd.enable = true;
}

