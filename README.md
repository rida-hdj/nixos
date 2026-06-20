# nixos

Personal NixOS configuration using flakes, home-manager, and an unstable channel.

## Structure

| Path | Description |
|------|-------------|
| `flake.nix` | Flake entry point |
| `configuration.nix` | Main system configuration |
| `hardware-configuration.nix` | Auto-generated hardware config |
| `home.nix` | Home-manager user config |
| `modules/` | Modular NixOS config (boot, desktop, networking, etc.) |
| `modules/boot.nix` | Bootloader and kernel parameters |
| `modules/desktop.nix` | Desktop environment |
| `modules/networking.nix` | Network configuration and firewall |
| `modules/nh.nix` | nh (nix helper) configuration |
| `modules/security.nix` | Security hardening and polkit |
| `modules/services.nix` | System services (pipewire, printing, etc.) |
| `modules/users.nix` | User groups and system `packages` |
| `modules/virtualisation.nix` | Docker, ... |
| `home-server/` | Server configuration |
| `home-server/jellyfin.nix` | Jellyfin media server |

## Highlights

- **DE/WM**: [niri](https://github.com/YaLTeR/niri) compositor + Ly display manager
- **Boot**: GRUB with Catppuccin Mocha theme, Zen kernel
- **Shell**: Fish
- **Services**: Tailscale, SSH, Docker, Pipewire, Flatpak, Steam
- **Stack**: Flakes + Home Manager, `nixos-unstable` channel

## Resources

- [NixOS package search](https://search.nixos.org/packages)
- [NixOS wiki](https://wiki.nixos.org/wiki/NixOS_Wiki)
