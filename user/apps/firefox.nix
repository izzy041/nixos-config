{
  pkgs,
  config,
  inputs,
  ...
}:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.firefox = {
    enable = true;

    profiles.izzy = {
      isDefault = true;

      settings = {
        "browser.download.panel.shown" = true;
        "layout.css.prefers-color-scheme-content-override" = 0;
        "browser.theme.content-theme" = 0;
        "ui.systemUsesDarkTheme" = 1;
      };

      search = {
        default = "ddg";
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "youtube";
            url = "https://www.youtube.com";
          }

          {
            name = "twitch";
            url = "https://twitch.tv";
          }
        ];
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        sponsorblock
        darkreader
        youtube-shorts-block
        proton-pass
        gruvbox-dark-theme
        betterttv
        seventv
      ];
    };
  };
}
