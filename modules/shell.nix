{ config, pkgs, ... }:

{
# Install firefox.
  programs.fish.enable = true;



  environment.systemPackages = with pkgs; [
  # clash-verge-rev
    fastfetch
    git
    nix-output-monitor
    fishPlugins.nvm
    vim
    wget
 ];


}
