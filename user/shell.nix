{ config, pkgs, ... }:
let
  aliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    hms = "home-manager switch --flake ~/.dotfiles";
    hmsf = "rm ~/.mozilla/firefox/izzy/search.json.mozlz4 && home-manager switch --flake ~/.dotfiles";

    q = "exit";

    gst = "git status";
    gaa = "git add --all";
    gcmsg = "git commit -m";
    gpush = "git push";
    gpull = "git pull";

    ls = "eza --color=always --icons=always";
    ll = "eza --color=always --icons=always -l";
    la = "eza --color=always --icons=always -a";
    lla = "eza --color=always --icons=always -la";

    cat = "bat --color=always";
  };
in
{
  programs.zsh = {
    enable = true;
    shellAliases = aliases;
  };

  programs.bat = {
    enable = true;
    config.theme = "Nord";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
