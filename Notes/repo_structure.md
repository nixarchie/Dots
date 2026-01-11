<div align="center">
    <h1>【 Repo Structure 】</h1>
    <h3></h3>
</div>

<p align="center">
This document describes the <b>intent</b> and <b>role</b> of each directory, not every file.
</p>


<details>
<summary>Full repo tree</summary>

  <details>
  <summary>Icon legend</summary>
  
| Icon | Meaning                |
|------|------------------------|
| 󰂺    | README                 |
|     | Markdown Doc           |
|     | GitHub repo config     |
|     | Config directory       |
| 󱂵    | Home directory         |
|     | Directory              |
|     | Shell script           |
| 󱁻    | Config file            |
| 󱆃    | Shell config file      |
|     | Nix                    |
|     | Text file              |
|     | Python script          |

  
  </details>

<pre>

    Dots/
    ├──  <a href="#github">.github</a>
    │   └── 󰂺 README.md
    ├──  <a href="#notes">Notes</a>
    │   ├──  Dev.md
    │   ├──  Golden_Rules.md
    │   ├──  lore.md
    │   └──  repo_structure.md
    ├──  <a href="#config">config</a>
    │   ├──  fish
    │   │   ├──  auto-Hypr.fish
    │   │   ├──  config.fish
    │   │   └──  fish_variables
    │   ├──  foot
    │   │   └── 󱁻 foot.ini
    │   ├──  fuzzel
    │   │   ├── 󱁻 fuzzel.ini
    │   │   └── 󱁻 fuzzel_theme.ini
    │   ├──  kitty
    │   │   ├── 󱁻 kitty.conf
    │   │   ├──  scroll_mark.py
    │   │   └──  search.py
    │   └──  zshrc.d
    │       ├──  auto-Hypr.sh
    │       ├──  dots-hyprland.zsh
    │       └──  shortcuts.zsh
    ├── 󱂵 <a href="#home">home</a>
    │   ├──  shellconf
    │   │   ├──  function.fish
    │   │   ├──  function.zsh
    │   │   ├──  z_alias.fish
    │   │   └──  z_alias.zsh
    │   ├── 󱆃 .bashrc
    │   └── 󱆃 .zshrc
    ├──  <a href="#nix">nix</a>
    │   └──  flake.nix
    ├──  <a href="#pkgs">pkgs</a>
    │   ├──  arch.txt
    │   ├──  common.txt
    │   ├──  debian.txt
    │   ├──  fedora.txt
    │   └──  nix.txt
    ├──  <a href="#scripts">scripts</a>
    │   ├──  bash
    │   │   ├──  detect_os.bash
    │   │   ├──  hl-dots.bash
    │   │   ├──  install_flatpak.bash
    │   │   ├──  install_pkgs.bash
    │   │   ├──  pkgx.bash
    │   │   ├──  setup_shell.bash
    │   │   ├──  symlink.bash
    │   │   └──  update_system.bash
    │   ├──  lib
    │   │   ├──  dist-determine.bash
    │   │   ├──  environment-variables.bash
    │   │   └──  functions.bash
    │   ├──  posix
    │   │   ├──  functions.sh
    │   │   └──  install.sh
    │   └──  python
    │       ├──  detect_os.py
    │       └──  symlink.py
    ├── 󰊢 .gitignore
    ├──  Makefile
    ├──  flake.lock
    ├──  flake.nix
    ├──  get
    ├──  install
    └──  legacy_bootstrap.bash

</pre>
</details>

<details>
    <summary>Status Types</summary>

| Status          | Meaning                         |
|-----------------|---------------------------------|
| Active / Stable | Currently used and supported    |
| Doc             | Documentation                   |
| Dead            | Not supported                   |
| WiP             | Currently work in progress      |
| Dormant         | Not in use                      |


</details>

<div>
<h2 align="center" id="github">• .github •</h2>

**Status:** Doc
- **README.md**: Contains the repo README shown in github by default.

</div>

<div>
<h2 align="center" id="notes">• Notes •</h2>

**Status:** Doc
- **Dev.md**: Some development notes.
- **Golden_Rules.md**: Some Golden rules for distro hoppers.
- **lore.md**: My lore.
- **repo_structure.md**: This file. Contains the repo structure and what each dir does.

</div>

<div>
<h2 align="center" id="config">• config •</h2>

**Status:** Active / Stable

Represents files that are meant to live directly in `$HOME/.config`
and are symlinked verbatim.


<details>
  <summary><b>fish/</b></summary>

- **auto-Hypr.fish**: Launches Hyprland if sourced from tty.
- **config.fish**: Fish config.
- **fish_variables**: Stores universal Fish variables.

</details>
<details>
  <summary><b>foot/</b></summary>

- **foot.ini**: Foot terminal config.

</details>
<details>
  <summary><b>fuzzel/</b></summary>

- **fuzzel.ini**: Fuzzel config.
- **fuzzel_theme.ini**: Fuzzel Dracula theme.

</details>
<details>
  <summary><b>kitty/</b></summary>

- **kitty.conf**: Kitty terminal config.

</details>
<details>
  <summary><b>zshrc.d/</b></summary>

- **auto-Hypr.sh**: Same functionality as `auto-Hypr.fish`, but for zsh.
- **dots-hyprland.zsh**: Uses generated colors. <sub><a href="https://ii.clsty.link/en">(Using illogical-impulse dotfiles)</a></sub>

</details>
</div>

<div>
<h2 align="center" id="home">• home •</h2>

**Status:** Active / Stable

Represents files that are meant to live directly in `$HOME`
and are symlinked verbatim.

<details>
  <summary><b>shellconf/</b></summary>

- **function.fish**: `Fish` functions.
- **function.zsh**: `Z shell` functions.
- **z_alias.fish**: `Fish` aliases.
- **z_alias.zsh**: `Z shell` aliases.

</details>
<div>

- **.bashrc**: `Bash` config.
- **.zshrc**: `Z shell` config.

</div>
</div>

<div>
<h2 align="center" id="nix">• nix •</h2>

**Status:** WiP

Represents Nix flake files for reproducible tooling and package management,
independent of the host distro.

- **flake.nix**: Main `Nix` flake for multi-distro support.

</div>

<div>
<h2 align="center" id="pkgs">• pkgs •</h2>

**Status:** Active / Stable

Represents plain-text package manifests, grouped by distro and role,
consumed by install scripts.

</div>

<div>
<h2 align="center" id="scripts">• scripts •</h2>

**Status:** Active / Stable

<details>
    <summary><b>bash/</b>: Contains Bash scripts used by installer.</summary>

- **detect_os.bash**: Detects the host operating system at runtime. (Dormant)<sup><a href="#os-detection">1</a></sup>.
- **hl-dots.bash**: An option for Arch users to install some hyprland dotfiles through official installers. (WiP)
- **install_flatpak.bash**: Installs flatpak packages. (dead)
- **install_pkgs.bash**: Installs basic packages through system package manager.
- **pkgx.bash**: Install `pkgx`, a cross-distro package manager frontend for `apt, pacman, and pkg`. (WiP)
- **setup_shell.bash**: Sources shell configs.
- **symlink.bash**: Calls `scripts/python/symlink.py` to symlink dotfiles.
- **update_system.bash**: Updates system.

</details>
<details>
    <summary><b>lib/</b>: Internal helper scripts.</summary>

- **dist-determine.bash**:Detects the host OS at runtime. (Active / Stable)<sup><a href="#os-detection">1</a></sup>.
- **environment-variables.bash**: Sets some environment variables for the install scripts.
- **functions.bash**: Has a **lot** of functions in `Bash`.

</details>
<details>
    <summary><b>posix/</b>: POSIX-compliant shell scripts.</summary>

- POSIX-compliant `sh` counterparts to `scripts/bash`, intended for systems without `bash` or using `make` for installation. (WiP)

</details>
<details>
    <summary><b>python/</b>: Python helpers</summary>

- **detect_os.py**: Detects the host OS at runtime. (Dormant)<sup><a href="#os-detection">1</a></sup>.
- **symlink.py**: Symlinks dotfiles into `$HOME` and `$HOME/.config`.

</details>
</div>

<div>
<h2 align="center" id="root">• Root Files •</h2>

**Status:** Active / Stable

Top-level entrypoints and integration glue.
If unsure, start here.

(To be done)

</div>

---

<div>
<details id="os-detection">
<summary>1. OS detection implementations</summary>

This repository currently contains multiple OS detection implementations
for different runtimes and constraints:

- **scripts/bash/detect_os.bash**  
  Feature-complete and actively maintained. Not currently in use. Was the first to be implemented.

- **scripts/lib/dist-determine.bash**  
  Currently used OS detector script.

- **scripts/python/detect_os.py**  
  Python-based detector, currently dormant.

- **POSIX `sh` detector**  
  Not available at the moment.

The duplication exists to support different runtimes (Bash, POSIX `sh`,
and Python) without introducing hard dependencies.

</details>
</div>
