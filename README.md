# linux-setup

Curl-installable setup files for personal Linux/macOS machines.

This repo is the source of truth for live scripts and generated config. Obsidian stays documentation-only and should link here instead of embedding full script bodies.

## Install

Install the updater CLI:

```bash
curl -fsSL https://raw.githubusercontent.com/LPFchan/linux-setup/main/install.sh | bash
```

Install managed modules:

```bash
linux-setup install resume ai-menu
```

Update installed modules later:

```bash
linux-setup update
```

## Commands

```bash
linux-setup list
linux-setup install resume ai-menu
linux-setup update
linux-setup diff resume
linux-setup doctor
```

## Drift Policy

Managed files carry a source header and are tracked by SHA-256 after install. Updates replace a file automatically only when it still matches the last installed hash.

If a local file has been edited, `linux-setup` writes the new version beside it as `<path>.new` unless `--force` is used.

## Modules

| module | target | source |
|---|---|---|
| `linux-setup` | `~/.local/bin/linux-setup` | `bin/linux-setup` |
| `resume` | `~/.local/bin/resume` | `files/resume` |
| `ai-menu` | `~/.bashrc.d/ai-start-menu` | `files/ai-start-menu` |

## Design

- GitHub is the canonical code host.
- `install.sh` only bootstraps the updater CLI.
- `manifest.tsv` declares module, target path, mode, and source path.
- Obsidian documents behavior and links to canonical files here.
- Secrets do not belong in this repo.
