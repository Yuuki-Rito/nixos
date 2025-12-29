{ config, pkgs,wpsMuiSource, ... }:
  let


    # nix-hash --type sha256 --to-base32 <(curl -L https://github.com/NixOS/nixpkgs/archive/8f77e1654b14692e01112fe487df04fa8da9d593.tar.gz)
    # nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs/archive/8f77e1654b14692e01112fe487df04fa8da9d593.tar.gz
    
  in
{
# Install firefox.
  programs.firefox.enable = true;



  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
  };


  nixpkgs.overlays = [
    # 配置 overlays 以集成 WPS 中文语言包 
    # (import ../../overlays/wpsoffice { inherit wpsMuiSource; })
#     (import ../../overlays/typora)
  ];


  environment.systemPackages = with pkgs; [
    aria2
    calibre
    fceux
    google-chrome
    # mariadb
    mcomix
    mpv
    qbittorrent-enhanced
    smplayer
    steam
    sublime4
#     typora
    unzip
    vscode
    wpsoffice
    zip

    kdePackages.bluedevil
    kdePackages.sddm-kcm
 ];

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];



}
