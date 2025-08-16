{ pkgs, config, ... }:
{
  programs.librewolf.enable = true;
  
  programs.librewolf = {

    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";

      privacy.clearOnShutdown.history = false;
      privacy.clearOnShutdown.downloads = false;

      ExtensionSettings = let

          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi"; 
        in {
        "uBlock@raymondhill.net" = {
          default_area = "menupanel";
          install_url = moz "ublock-origin"; 
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          default_area = "menupanel";
          install_url = moz "proton-pass";
          installation_mode = "force_installed";
          private_browsing = false;
        };
      };
    };
  };
}
