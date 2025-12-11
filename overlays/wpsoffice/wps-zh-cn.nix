# ./overlays/wpsoffice/wps-zh-cn.nix
# 使用本地 WPS Office 中文语言包覆盖默认 WPS

{ final, prev, lib, stdenv, ... }:

let
  # 本地语言包路径
  wpsMuiLocalPath = ./wpsoffice/wps-office-mui-zh-cn;
  
  wpsMuiPackage = stdenv.mkDerivation {
    pname = "wps-office-mui-zh-cn-pkg";
    version = "unstable";
    
    src = wpsMuiLocalPath;
    
    installPhase = ''
      mkdir -p $out/opt/kingsoft/wps-office/office6/mui/
      if [ -d "$src/mui/zh_CN" ]; then
        cp -r $src/mui/zh_CN $out/opt/kingsoft/wps-office/office6/mui/
      else
        echo "Warning: zh_CN language pack not found at $src/mui/zh_CN"
      fi
    '';
  };
in
{
  # 覆盖 wps-office 包，集成中文语言包
  wps-office = prev.wps-office.overrideAttrs (oldAttrs: {
    postInstall = (oldAttrs.postInstall or "") + ''
      echo "Integrating Chinese (zh_CN) language package into WPS Office..."
      
      mkdir -p $out/opt/kingsoft/wps-office/office6/mui/
      cp -r ${wpsMuiPackage}/opt/kingsoft/wps-office/office6/mui/zh_CN \
          $out/opt/kingsoft/wps-office/office6/mui/ 2>/dev/null || true
          
      echo "Chinese language package integration completed."
    '';
  });
}