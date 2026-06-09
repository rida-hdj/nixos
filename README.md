# nixos

Personal NixOS configuration using flakes, home-manager, and an unstable channel.

## Structure

| Path | Description |
|------|-------------|
| `configuration.nix` | Main system configuration |
| `flake.nix` | Flake entry point |
| `home.nix` | Home-manager user config |
| `hardware-configuration.nix` | Auto-generated hardware config |
| `modules/` | Custom Nix modules |
| `home-server/` | Server configuration (WIP) |

## Highlights

- **DE/WM**: [niri](https://github.com/YaLTeR/niri) compositor + Ly display manager
- **Boot**: GRUB with Catppuccin Mocha theme, Zen kernel
- **Shell**: Fish
- **Services**: Tailscale, SSH, Docker, Pipewire, Flatpak, Steam
- **Stack**: Flakes + Home Manager, `nixos-unstable` channel

## Resources

- [NixOS package search](https://search.nixos.org/packages)
- [NixOS wiki](https://wiki.nixos.org/wiki/NixOS_Wiki)
