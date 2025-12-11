{ config, pkgs,wpsMuiSource, ... }:
  let
    # clash-verge-rev 2.3.1
    oldPkgsC = import (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/8f77e1654b14692e01112fe487df04fa8da9d593.tar.gz";
      sha256 = "0jipix4b2fiy1da5hgmzhvrr5bh9zzdd9fs1a853qhjcljn32wyp";
    }) {
      system = "x86_64-linux"; 
    };
    
    myClashVerge = oldPkgsC.clash-verge-rev;

    # nix-hash --type sha256 --to-base32 <(curl -L https://github.com/NixOS/nixpkgs/archive/8f77e1654b14692e01112fe487df04fa8da9d593.tar.gz)
    # nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs/archive/8f77e1654b14692e01112fe487df04fa8da9d593.tar.gz
    
  in
{
# Install firefox.
  programs.firefox.enable = true;

  nixpkgs.overlays = [
    # 配置 overlays 以集成 WPS 中文语言包 
    # (import ../../overlays/wpsoffice { inherit wpsMuiSource; })
    (import ../../overlays/typora)
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
    wpsoffice
    myClashVerge
    typora
 ];


}
