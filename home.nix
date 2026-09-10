{ config, pkgs, ... }:

let
  dotfiles = /etc/nixos/dotfiles;
in
{
  home.username = "sv";
  home.homeDirectory = "/home/sv";
  home.stateVersion = "26.05";

#   programs.bash = {
#     enable = true;
#     shellAliases = {
#       btw = "echo I use nixos btw";
#
#       nrs = "sudo nixos-rebuild switch";
#       nc  = "sudo nano /etc/nixos/configuration.nix";
#       nh  = "sudo nano /etc/nixos/home.nix";
#     };
#     bashrcExtra = ''
#       eval "$(starship init bash)";
#     '';
#   };

    home.file.".bashrc".source = dotfiles + "/bash/.bashrc";                                  # 2026-09-10 | bashrc
    home.file.".bash_profile".source = dotfiles + "/bash/.bash_profile";                      # 2026-09-10 | bash_profile

    #home.file.".clangformat".source = dotfiles + "/clang/.clangformat";                      # 2026-09-10 | clangformat

    home.file.".config/fastfetch".source = dotfiles + "/fastfetch/.config/fastfetch";         # 2026-09-10 | fastfetch

    home.file.".config/ghostty".source = dotfiles + "/ghostty/.config/ghostty";               # 2026-09-10 | ghostty

    #home.file.".gitconfig".source = dotfiles + "/git/.gitconfig";                            # 2026-09-10 | git

    home.file.".config/hypr".source = dotfiles + "/hypr/.config/hypr";                        # 2026-09-10 | hyprland

    home.file.".config/mimeapps.list".source = dotfiles + "/mimeapps/.config/mimeapps.list";  # 2026-09-10 | mimemapps

    home.file.".config/rofi".source = dotfiles + "/rofi/.config/rofi";                        # 2026-09-10 | rofi config
    home.file.".local/share/rofi".source = dotfiles + "/rofi/.local/share/rofi";              # 2026-09-10 | rofi thmes

    home.file.".config/starship.toml".source = dotfiles + "/starship/.config/starship.toml";  # 2026-09-10 | starship

    home.file.".tmux.conf".source = dotfiles + "/tmux/.tmux.conf";            # 2026-09-10 | tmux

    home.file.".config/waybar".source = dotfiles + "/waybar/.config/waybar";                  # 2026-09-10 | waybar

  home.packages = with pkgs; [
    
  ];
}
