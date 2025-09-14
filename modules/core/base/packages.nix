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
    pkgs.android-tools

    # Monitoring
    pkgs.htop
  ];
}
