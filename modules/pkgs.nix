{ config, pkgs, ... }:

{
# Install firefox.
  programs.firefox.enable = true;



  environment.systemPackages = with pkgs; [
    calibre
    google-chrome
    mariadb
    mcomix
    qbittorrent-enhanced
    smplayer
    steam
    vscode
    # libtiff
    # clash-verge-rev
 ];


}
