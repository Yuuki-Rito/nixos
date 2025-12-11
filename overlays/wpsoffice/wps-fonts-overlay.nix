# wps-fonts-overlay.nix
final: prev:

let
  # 1. 从社区提供的GitHub仓库下载字体ZIP包
  ttf-wps-fonts-src = prev.fetchzip {
    url = "https://github.com/dv-anomaly/ttf-wps-fonts/archive/refs/heads/master.zip"; 
    sha256 = "00kajcp4szkl70xa38j37qlpls7iqisx37av34mvj624g8r2ps67"; # 请替换为正确的校验值
    stripRoot = true;
  };

in
{
  # 创建一个新的字体包
  ttf-wps-fonts = prev.stdenv.mkDerivation {
    pname = "ttf-wps-fonts";
    version = "latest";
    
    # 将下载的ZIP文件作为源
    src = ttf-wps-fonts-src;

    # 3. 安装阶段：将所有字体文件复制到正确的位置
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp *.ttf $out/share/fonts/truetype/
    '';
  };
}