{ pkgs, config, ... }:
{
  programs.spotify-player = {
    enable = true;

    settings = {
      client_id = "e5256aba5524472aa58a9d0f59472d18";
      theme = "default";
      login_redirect_uri = "http://127.0.0.1:8989/login";
      client_port = 8080;
      default_device = "spotify-player";

      device = {
        name = "spotify-player";
        device_type = "speaker";
        volume = 70;
        bitrate = 320;
        audio_cache = false;
        normalisation = false;
        autoplay = false;
      };
    };
  };
}
