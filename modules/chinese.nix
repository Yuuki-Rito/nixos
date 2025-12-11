{ config, pkgs, lib, ... }: {


  # 输入法配置（Fcitx5）
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
    fcitx5-gtk
    fcitx5-pinyin-zhwiki 
    fcitx5-pinyin-moegirl
    kdePackages.fcitx5-chinese-addons # fcitx5-chinese-addons
    kdePackages.fcitx5-configtool  # fcitx5-configtool
    
   ];
   fcitx5.waylandFrontend = true;
  };

  # 中文字体优化
  fonts = {
  packages = with pkgs; [
    cascadia-code
    fira-code
    noto-fonts
    noto-fonts-cjk-sans    # 思源黑体 (无衬线)
    noto-fonts-cjk-serif   # 思源宋体 (衬线)
    noto-fonts-emoji-blob-bin
    ];
  # fontconfig = {
  #   defaultFonts = {
  #     sansSerif = [ "Noto Sans CJK SC" ];
  #     serif = [ "Noto Serif CJK SC" ];
  #     monospace = [ "Noto Sans Mono CJK SC" ];
  #    };
  #  };
 };
}
