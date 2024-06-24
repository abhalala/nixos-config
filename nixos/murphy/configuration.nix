{ inputs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./bundle.nix
  ];

  networking.hostName = "murphy";

  time.timeZone = "America/Phoenix";

  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
