self: super:
let
  debPath = "./typora/typora_0.11.18_amd64.deb";
in

{
  typora = super.stdenv.mkDerivation {
    pname = "typora";
    version = "0.11.18";
    src = debPath;
    nativeBuildInputs = with super; [ binutils tar xz coreutils ];

    buildPhase = ''
      mkdir -p $out
      tmpdir=$(mktemp -d)
      cp "${debPath}" "$tmpdir/typora.deb"
      cd "$tmpdir"
      ar x typora.deb
      if [ -f data.tar.xz ]; then
        tar -xJf data.tar.xz -C $out
      elif [ -f data.tar.gz ]; then
        tar -xzf data.tar.gz -C $out
      elif [ -f data.tar ]; then
        tar -xf data.tar -C $out
      else
        echo "no data.tar.* in deb" >&2
        exit 1
      fi
    '';

    installPhase = ''
      # files already extracted into $out
      true
    '';

    meta = with super.lib; {
      description = "Typora (installed from local .deb)";
      license = licenses.unfree;
      platforms = platforms.linux;
    };
  };
}
