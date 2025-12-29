{ config, pkgs, ... }:

{

  # niri设置
  programs.niri.enable = true;

 
  environment.systemPackages = with pkgs; [
    capitaine-cursors
    fuzzel
    fsearch
    swayidle
    numlockx
    udiskie
    vicinae
    xwayland-satellite
  ];
}
