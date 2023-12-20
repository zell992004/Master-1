{ pkgs, ... }: {
  networking = {
    hostName = "amacbook";
    networkmanager.enable = true;
  };
    boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot.initrd.kernelModules = [ "amdgpu" ]; #TODO:check if valid
  services.xserver.videoDrivers.enable = ["amdgpu"]

}