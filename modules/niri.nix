{ config, pkgs, ... }:

{

# niri设置
programs.niri.enable = true;

environment.systemPackages = with pkgs; [
   fuzzel

  ];
}
