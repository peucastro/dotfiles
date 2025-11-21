{
  user,
  host,
  pkgs,
  ...
}: {
  networking = {
    hostName = "${host}";
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-l2tp
        pkgs.networkmanager-openconnect
        pkgs.networkmanager-openvpn
        pkgs.networkmanager-strongswan
      ];
    };
    nameservers = ["1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4"];
    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 443 8000];
      allowedUDPPorts = [];
    };
  };

  users.extraGroups.networkmanager.members = [user.login];

  services.strongswan.enable = true;
  environment.etc."strongswan.conf".text = "";
}
