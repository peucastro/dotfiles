{
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {};
      associations.removed = {};
    };
    configFile."mimeapps.list".force = true;
  };
}
