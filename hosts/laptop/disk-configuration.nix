{ ... }:
{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              label = "efi";
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              priority = 2;
              label = "swap";
              size = "32G";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
            nixos = {
              priority = 3;
              label = "nixos";
              size = "100%";
              content = {
                type = "btrfs";
                mountpoint = "/";
                subvolumes = {
                  "@" = {
                    mountpoint = "/";
                  };
                  "@home" = {
                    mountOptions = ["compress=zstd:2"];
                    mountpoint = "/home";
                  };
                  "@nix" = {
                    mountOptions = ["compress=zstd:2" "noatime"];
                    mountpoint = "/nix";
                  };
                  "@snapshots" = {
                    mountpoint = "/.snapshots";
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
