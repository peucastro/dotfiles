{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.retroarch.withCores (cores: [
      cores.bsnes
      cores.beetle-psx
      cores.beetle-saturn
      cores.blastem
      cores.gambatte
      cores.genesis-plus-gx
      cores.mgba
      cores.nestopia
      cores.mupen64plus
      cores.mesen
    ]))
  ];
}
