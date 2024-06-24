{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };

    videoDrivers = [ "amdgpu" ];
    deviceSection = ''
      Option "TearFree" "True"
    '';
  };
}
