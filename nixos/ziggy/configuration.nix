{ inputs, ... }: {

  imports =
    [ ./hardware-configuration.nix ./packages.nix ../modules/bundle.nix ];

  networking.hostName = "ziggy";

  time.timeZone = "America/Phoenix";

  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "24.05";
}
