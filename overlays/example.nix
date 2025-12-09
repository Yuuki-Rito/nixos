# default.nix 文件
{ stdenv, fetchurl, dpkg, autoPatchelfHook, ... }:

stdenv.mkDerivation rec {
  pname = "some-app";
  version = "1.0.0";

  src = fetchurl {
    # 假设 .deb 包的 URL 和 SHA256 
    url = "https://example.com/some-app_${version}_amd64.deb"; 
    sha256 = "00000000000000000000000000000000000000000000"; # 替换为正确的校验值
  };

  # 告诉 Nix 这是二进制包，需要解压
  nativeBuildInputs = [ dpkg autoPatchelfHook ]; 

  # 解压 .deb
  unpackPhase = ''
    dpkg -x $src .
  '';

  # 安装到 Nix Store
  installPhase = ''
    mkdir -p $out
    cp -r * $out/
  '';

  # 确保所有必需的运行时库都被链接
  autoPatchelfIgnoreMissing = true; # 可能会有警告，但能运行

  # 还需要手动添加所有运行时依赖，这是最难的部分
  # buildInputs = [ pkgs.glibc pkgs.zlib ... ]; 
}