# Minecraft Server 

{pkgs, inputs, ...}: {
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    
    package = pkgs.papermcServers.papermc-1_21_1;
    dataDir = "/nix/var/mc-servers";
 
    servers = {
      hide-and-soc = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_1;
 
        serverProperties = {
          server-port = 25565;
          gamemode = "survival";
          difficulty = "normal";
          simulation-distance = 10;
          level-seed = "hideandsoc";
          motd = "Welcome to Hide and Soc";
          white-list = true;
        };

        whitelist = {
          hzl4 = "a7bbac4b-d6f2-425e-a984-82f092b13da3";
          Poyni = "3dfb2091-cdea-4ffb-bc49-7117454a57ff";
        };

        symlinks = {
          # Fetching from the internet
          "mods" = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            # Optimisations
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/9xfJi96s/lithium-fabric-0.14.3-snapshot%2Bmc1.21.1-build.92.jar";
                sha512 = "";
              };
              FerriteCore = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uXXizFIs/versions/bwKMSBhn/ferritecore-7.0.2-hotfix-fabric.jar";
                sha512 = "";
              };
              Krypton = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar";
                sha512 = "";
              };
              C2ME = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/VSNURh3q/versions/H5YtgA2t/c2me-fabric-mc1.21.1-0.3.0%2Balpha.0.310.jar";
                sha512 = "";
              };
              ScalableLux = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/Ps1zyz6x/versions/Oh80nTJ5/ScalableLux-0.1.0%2Bfabric.26c6e72-all.jar";
                sha512 = "";
              };
              Noisium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/KuNKN7d2/versions/4sGQgiu2/noisium-fabric-2.3.0%2Bmc1.21-1.21.1.jar";
                sha512 = "";
              };

            # Terrain Generators
              Tectonic = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/lWDHr9jE/versions/mSYrCaov/tectonic-fabric-1.21.1-2.4.1a.jar"; # 1.21.1
                sha512 = "";
              };
              Terralith = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/lQreFvOm/Terralith_1.21.x_v2.5.7.jar"; # 1.21.x
                sha512 = "";
              };

          });
        };
      };
    };
  };
}
