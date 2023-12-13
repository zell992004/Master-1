{ inputs
, nixpkgs
, self
, ...
}:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = nixpkgs.lib;
in
{
  G14 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
      [ (import ./bootloader.nix) ]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./xserver.nix) ]
      ++ [ (import ./steam.nix) ] 
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./../home/package/python.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      ++ [ (import ./cloudflare-warp.nix) ]
      ++ [ (import ./virtualization.nix) ]
      ++ [ (import ./../../hosts/G14/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/G14/default.nix) ]
    ;
  };
    amacbook = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
      [ (import ./bootloader.nix) ]
      ++ [ (import ./hardware.nix) ]
      ++ [ (import ./xserver.nix) ]
      ++ [ (import ./steam.nix) ] 
      ++ [ (import ./pipewire.nix) ]
      ++ [ (import ./program.nix) ]
      ++ [ (import ./../home/package/python.nix) ]
      ++ [ (import ./security.nix) ]
      ++ [ (import ./services.nix) ]
      ++ [ (import ./system.nix) ]
      ++ [ (import ./user.nix) ]
      ++ [ (import ./wayland.nix) ]
      ++ [ (import ./cloudflare-warp.nix) ]
      ++ [ (import ./virtualization.nix) ]
      ++ [ (import ./../../hosts/amacbook/hardware-configuration.nix) ]
      ++ [ (import ./../../hosts/amacbook/default.nix) ]
    ;
    };
}
