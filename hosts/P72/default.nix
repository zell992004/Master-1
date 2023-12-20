{ pkgs, ... }: {



  networking = {
    hostName = "P72";
    networkmanager.enable = true;
  };


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_lqx;
  boot.initrd.kernelModules = [ "amd" ]; 

}