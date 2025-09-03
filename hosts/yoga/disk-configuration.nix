{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
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
                mountOptions = ["fmask=0077" "dmask=0077"];
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
              end = "-0";
              content = {
                type = "btrfs";
                extraArgs = ["-f"];
                subvolumes = {
                  "@root" = {
                    mountpoint = "/";
                    mountOptions = ["compress=zstd:2"];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = ["compress=zstd:2"];
                  };
                  "@home/.snapshots" = {
                    mountpoint = "/home/.snapshots";
                    mountOptions = ["compress=zstd:2"];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = ["compress=zstd:2" "noatime"];
                  };
                  "@log" = {
                    mountpoint = "/var/log";
                    mountOptions = ["compress=zstd:2" "noatime"];
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
