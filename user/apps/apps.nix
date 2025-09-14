{ pkgs, config, inputs, ... }:
{
  imports = [
    ./firefox.nix
    ./helix.nix
    ./alacritty.nix
    ./ghostty.nix
    ./kitty.nix
    ./librewolf.nix
    ./spotify-player.nix
  ];

  programs.vesktop.enable = true;
  services.flameshot.enable = true;
}
