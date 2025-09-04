{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "overlay";

      timeout = 8;
      timeout-low = 5;
      timeout-critical = 0;
      control-center-width = 380;
      control-center-height = 600;
      notification-window-width = 380;
      image-visibility = "when-available";
      hide-on-clear = true;
    };
  };
}
