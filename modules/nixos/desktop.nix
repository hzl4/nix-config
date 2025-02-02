{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gnome.nix
  ]
  
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable pure desktop packages
  programs.steam.enable = true;
}
