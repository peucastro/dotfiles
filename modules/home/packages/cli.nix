{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Core utilities
    duf
    eza
    fd
    man-pages
    ncdu
    ripgrep
    tldr

    # Utilities
    ffmpeg
    file
    fzf
    openssl
    playerctl
    unzip
    wget
    wl-clipboard
    tree
    zip

    # Tools
    bitwise
    broot
    bottom
    gdu

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

    # Development
    act
    android-tools
    lazydocker
    vim

    # Security
    bitwarden

    # Zsh plugins
    zsh-syntax-highlighting
    zsh-autosuggestions
  ];
}
