{ config, pkgs, ... }:

{
# Install firefox.
  programs.firefox.enable = true;




  environment.systemPackages = with pkgs; [
    vim
    wget
    git
 ];


}
