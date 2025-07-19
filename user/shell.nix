{ config, pkgs, ... }:
let
  aliases = {
    nrs = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    hms = "home-manager switch --flake ~/.dotfiles";
    q = "exit";
  };
in
{
  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    initContent = ''ZLE_PROMPT_INDENT=0'';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
