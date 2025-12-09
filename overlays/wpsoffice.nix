# ./overlays/wps-zh-cn.nix
# 接收 Flake 传递进来的参数，包括 wpsMuiSource (您的 Git 仓库)

{ final, prev, wpsMuiSource, lib, stdenv, callPackage, ... }:

let
  # 1. 确保源代码是一个可用的包（这里只是一个简单的解压）
  wpsMuiPackage = stdenv.mkDerivation {
    pname = "wps-office-mui-zh-cn-pkg";
    version = "unstable";
    
    # 使用 Flake 引入的 Git 仓库作为源
    src = wpsMuiSource; 
    
    # 语言包的内容通常可以直接安装到目标位置
    installPhase = ''
      # 语言包的结构：/opt/kingsoft/wps-office/office6/mui/zh_CN
      mkdir -p $out/opt/kingsoft/wps-office/office6/mui/
      cp -r $src/office6/mui/zh_CN $out/opt/kingsoft/wps-office/office6/mui/
    '';
  };
in
{
  # 2. 覆盖 wps-office
  wps-office = prev.wps-office.overrideAttrs (oldAttrs: {
    # 继承原有的构建脚本
    installPhase = oldAttrs.installPhase + ''
      echo "Copying Chinese MUI files into WPS installation..."
      
      # 注意：wpsMuiPackage 路径下就是 /opt/kingsoft/...结构
      cp -r ${wpsMuiPackage}/opt/kingsoft/wps-office/office6/mui/zh_CN \
          $out/opt/kingsoft/wps-office/office6/mui/
          
      echo "Finished copying MUI files."
    '';
  });
}