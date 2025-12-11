{ ... }:

final: prev: 
  import ./wps-zh-cn.nix { 
    inherit final prev; 
    lib = prev.lib; 
    stdenv = prev.stdenv;
  }
