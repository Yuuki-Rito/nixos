{ config, pkgs, ... }:
  let
    # wpsFontsOverlay = import ./overlays/wps-fonts-overlay.nix;
   
    oldPkgs = import (builtins.fetchGit {
      name = "my-old-revision";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/nixos-25.11";
      rev = "8f77e1654b14692e01112fe487df04fa8da9d593";
    }) {};
    
    myClashVerge = oldPkgs.clash-verge-rev;

    oldPkgs = import (builtins.fetchGit {
      # Descriptive name to make the store path easier to identify
      name = "my-old-revision";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/nixpkgs-25.11";
      rev = "c8e344196154514112c938f2814e809b1ca82da1";
     }) {};

     myTypora = oldPkgs.typora;

    
    
  in
{
# Install firefox.
  programs.firefox.enable = true;

  nixpkgs.overlays = [
    wpsFontsOverlay
  ];

  environment.systemPackages = with pkgs; [
    calibre
    fceux
    google-chrome
    mariadb
    mcomix
    qbittorrent-enhanced
    smplayer
    steam
    vscode
    # libtiff
    # clash-verge-rev
    myClashVerge
 ];


}
