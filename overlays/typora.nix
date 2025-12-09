{ config, pkgs, lib, ... }:

let
  oldPkgs = import (builtins.fetchGit {
    name = "my-old-revision";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "28ace32529a63842e4f8103e4f9b24960cf6c23a";
  }) {};
  
  # final: 最终的包集，prev: 当前（旧的）包集
  clashOverlay = final: prev: {
    # 覆盖或添加包：将我们锁定的版本赋值给 clash-verge-rev
    clash-verge-rev = oldPkgs.clash-verge-rev;
    
    # 覆盖依赖于这个旧版本的其他包
    # exampleApp = prev.exampleApp.override {
    #   clash-verge-rev = final.clash-verge-rev;
    # };
  };

in
{
  # 将 Overlay 添加到系统配置中
  nixpkgs.overlays = [
    clashOverlay
  ];

  environment.systemPackages = with pkgs; [
    clash-verge-rev
  ];
  
  
}