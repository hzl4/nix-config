{ inputs, outputs, config, pkgs, ... }:

{
  imports =
    [ 
      inputs.home-manager.nixosModules.home-manager

      ./hardware-configuration.nix

      ./../../modules/nixos/base.nix

      ./../../services/minecraft_server.nix
      # Add other services here
    ];
  
  networking.hostName = "ms1-hzl4";
}
