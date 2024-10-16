{ pkgs, ... }: {
  programs.bash.enable = true;

  users = {
    defaultUserShell = pkgs.bash;

    users.abhalala = {
      isNormalUser = true;
      email = [ "abhalala@asu.edu" "a@bhalala.org" "ansh_bhalala@icloud.com" ];
      description = "Ansh Bhalala";
      extraGroups = [ "networkmanager" "video" "wheel" "input" "libvirtd" ];
      packages = with pkgs; [ ];
    };
  };
}
