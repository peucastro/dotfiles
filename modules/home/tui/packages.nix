{pkgs, ...}: {
  home.packages = [
    # Core utilities
    pkgs.duf
    pkgs.eza
    pkgs.fd
    pkgs.man-pages
    pkgs.ncdu
    pkgs.ripgrep
    pkgs.tldr

    # Utilities
    pkgs.ffmpeg
    pkgs.file
    pkgs.fzf
    pkgs.openssl
    pkgs.playerctl
    pkgs.unzip
    pkgs.wget
    pkgs.tree
    pkgs.zip

    # Backups
    pkgs.btrfs-progs
    pkgs.snapper

    # Tools
    pkgs.bitwise
    pkgs.broot
    pkgs.bottom
    pkgs.gdu

    # Monitoring
    pkgs.htop
    pkgs.fastfetch
    pkgs.nitch
    pkgs.onefetch
    pkgs.wavemon

    # Screensaver
    pkgs.cbonsai
    pkgs.cmatrix
    pkgs.pipes
    pkgs.tty-clock

    # Multimedia
    pkgs.ani-cli
    pkgs.mpv

    # Development
    pkgs.act
    pkgs.alejandra
    pkgs.android-tools
    pkgs.gemini-cli
    pkgs.jq
    pkgs.lazydocker
    pkgs.nixd

    # Security
    pkgs.bitwarden
  ];
}
