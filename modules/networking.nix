{
  lib,
  ...
}:

{

  networking.hostName = "nixos";

  #Enable network manager
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  #Enable tailscale
  services.tailscale.enable = true;

  #Enable firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      53317
      25565
      30000
      80
      443
      22
    ];
    allowedUDPPorts = [
      53317
      25565
      30000
    ];
  };

  #Enable SSH
  services.openssh = {
    enable = true;
  };

  security.pam.services.sshd.showMotd = lib.mkForce false;

}
