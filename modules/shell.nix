{ config, pkgs, ... }:

{
# Install firefox.
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    btop
    fastfetch
    fnm
    git
    nix-output-monitor
    fishPlugins.sdkman-for-fish
    meld
    micro
    starship
    xclip
    wget
    wl-clipboard
    zoxide
 ];

  
}