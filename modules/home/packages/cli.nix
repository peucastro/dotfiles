{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Better core utils
    duf
    eza
    fd
    man-pages
    ncdu
    ripgrep
    tldr

    # Tools
    bitwise
    broot
    nixfmt

    # Monitoring
    htop
    fastfetch
    nitch
    onefetch
    wavemon

    # Screensaver
    cbonsai
    cmatrix
    pipes
    tty-clock

    # Multimedia
    ani-cli
    mpv

    # Utilities
    ffmpeg
    file
    openssl
    playerctl
    unzip
    wget
    wl-clipboard
    xdg-utils
  ];
}
