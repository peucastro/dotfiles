{user, ...}: {
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableExtensionPack = true;
  };

  users.extraGroups.vboxusers.members = [user.login];
}
