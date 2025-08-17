{ pkgs, config, inputs, ... }:
{
  imports = [
    ./firefox.nix
    ./helix.nix
    ./alacritty.nix
    ./ghostty.nix
    ./kitty.nix
    ./librewolf.nix
  ];
}
