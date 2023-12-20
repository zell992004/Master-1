{ pkgs, ... }: {
  networking = {
    hostName = "G14";
    networkmanager.enable = true;
  };
    boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot.initrd.kernelModules = [ "nvidia" ]; 
  services.xserver.videoDrivers.enable = [ "amdgpu" ];
}