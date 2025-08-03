git clone https://github.com/peucastro/dotfiles.git
cd dotfiles
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko hosts/laptop/disk-configuration.nix
sudo nixos-generate-config --root /mnt --no-filesystems
cp /mnt/etc/nixos/hardware-configuration.nix hosts/laptop/
sudo nixos-install --flake .#laptop

