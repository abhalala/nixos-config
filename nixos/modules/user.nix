{ pkgs, ... }: {
  programs.bash.enable = true;

  users = {
    defaultUserShell = pkgs.bash;

    users.abhalala = {
      isNormalUser = true;
      description = "Ansh Bhalala";
      extraGroups = [ "networkmanager" "video" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [ ];
    };
  };
}
