self: super: {
  smplayer = super.smplayer.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      mkdir -p $out/share/smplayer/themes/Gnome
      cp ${./Gnome/Gnome.rcc} $out/share/smplayer/themes/Gnome/
      cp ${./Gnome/README.txt} $out/share/smplayer/themes/Gnome/
    '';
  });
}