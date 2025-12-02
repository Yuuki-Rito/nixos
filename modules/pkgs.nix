{ config, pkgs, ... }:

{
# Install firefox.
  programs.firefox.enable = true;
  programs.fish.enable = true;



  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    vscode
    nix-output-monitor
 ];


}
