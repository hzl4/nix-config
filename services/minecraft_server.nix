# Minecraft Server 

{pkgs, ...}: {
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
    openFirewall = true;

    package = pkgs.papermcServers.papermc-1_21_1;
 
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
    };
 
    jvmOpts = "-Xms4092M -Xmx4092M -XX:+UseG1GC";
  };
}
