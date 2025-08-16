{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    btop
    eza
    tmux
  ];
}
