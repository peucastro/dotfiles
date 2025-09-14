{pkgs, ...}: {
  environment.systemPackages = [
    # Filesystem
    pkgs.btrfs-progs
    pkgs.snapper

    # Networking
    pkgs.wget
    pkgs.wavemon

    # Utilities
    pkgs.unzip
    pkgs.zip
    pkgs.ffmpeg
    pkgs.openssl
    pkgs.man-pages
    pkgs.snapper-gui
    pkgs.veracrypt
    pkgs.gparted
    pkgs.android-tools

    # Monitoring
    pkgs.htop
  ];
}
