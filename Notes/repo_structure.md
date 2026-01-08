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
  
      󰂺   = README
         = Markdown Doc
         = github repo config
         = config dir
      󱂵   = home dir
         = Dir
         = shell script
      󱁻   = config
      󱆃   = shell config file
         = nix 
         = txt file
         = python script
  
  </details>

<pre>

    Dots/
    ├── c<a href="#github">.github</a>
    │   └── 󰂺 README.md
    ├── c<a href="#notes">Notes</a>
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

- **fish**:
    - **auto-Hypr.fish**: Launches Hyprland if sourced from tty.
    - **config.fish**: Fish config.
    - **fish_variables**: Stores universal Fish variables.
- **foot**:
    - **foot.ini**: Foot terminal config.
- **fuzzel**:
    - **fuzzel.ini**: Fuzzel config.
    - **fuzzel_theme.ini**: Fuzzel Dracula theme.
- **kitty**:
    - **kitty.conf**: Kitty terminal config.
- **zshrc.d**:
    - **auto-Hypr.sh**: Same functionality as `auto-Hypr.fish`, but for zsh.
    - **dots-hyprland.zsh**: Uses generated colors. (Using illogical-impulse dotfiles)

</div>

<div>
<h2 align="center" id="home">• home •</h2>

**Status:** Active / Stable

Represents files that are meant to live directly in `$HOME`
and are symlinked verbatim.

- **shellconf**:
    - **function.fish**: Contains `Fish` functions.
    - **function.zsh**: Contains `Z shell` functions.
    - **z_alias.fish**: Contains `Fish` alias.
    - **z_alias.zsh**: Contains `Z shell` alias
- **.bashrc**: `Bash` config.
- **.zshrc**: `Z shell` config.

</div>

<div>
<h2 align="center" id="nix">• nix •</h2>

**Status:** WiP

Represents Nix flake files for reproducible tooling and package management,
independent of the host distro.

- **flake.nix**: Main nix flake for multi-distro support.

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

(To be done)

</div>

<div>
<h2 align="center" id="root">• Root Files •</h2>

**Status:** Active / Stable

Top-level entrypoints and integration glue.
If unsure, start here.

(To be done)

</div>
