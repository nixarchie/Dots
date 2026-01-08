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
    ├── <a href="#github"> .github</a>
    │   └── 󰂺 README.md
    ├──  Notes
    │   ├──  Dev.md
    │   ├──  Golden_Rules.md
    │   ├──  lore.md
    │   └──  repo_structure.md
    ├──  config
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
    ├── 󱂵 home
    │   ├── 󰉏 Pictures
    │   │   └──  Wallpapers
    │   ├──  shellconf
    │   │   ├──  function.fish
    │   │   ├──  function.zsh
    │   │   ├──  z_alias.fish
    │   │   └──  z_alias.zsh
    │   ├── 󱆃 .bashrc
    │   └── 󱆃 .zshrc
    ├──  nix
    │   └──  flake.nix
    ├──  pkgs
    │   ├──  arch.txt
    │   ├──  common.txt
    │   ├──  debian.txt
    │   ├──  fedora.txt
    │   └──  nix.txt
    ├──  scripts
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

- Active / Stable  =  Currently used and supported.
- Doc  =  Documentation.
- Dead  =  Not supported.
- WiP  =  Currently work in progress.

</details>

<div>
<h2 align="center" id="github">• .github •</h2>

**Status:** Doc
- **README.md**: Contains the repo README shown in github by default.

</div>

<div>
<h2 align=center>• Notes •</h2>

**Status:** Doc
- **Dev.md**: Some development notes.
- **Golden_Rules.md**: Some Golden rules for distro hoppers.
- **lore.md**: My lore.
- **repo_structure.md**: This file. Contains the repo structure and what each dir does.

</div>

<div>
<h2 align=center>• config •</h2>

**Status:** Active / Stable

Represents files that are meant to live directly in `$HOME/.config`
and are symlinked verbatim.

- fish
    - **auto-Hypr.fish**: Launches Hyprland if sourced from tty.
    -
    -
- foot
    - **foot.ini**:
- fuzzel
    - **fuzzel.ini**:
    - **fuzzel_theme.ini**:
- kitty
    - **kitty.conf**
- zshrc.d
    - **auto-Hypr.sh**:
    -
    -

</div>

<div>
<h2 align=center>• home •</h2>

**Status:** Active / Stable

Represents files that are meant to live directly in `$HOME`
and are symlinked verbatim.

-
    -
    -
    -
    -
-
-

</div>

<div>
<h2 align=center>• nix •</h2>

**Status:** Active / Stable

Nix flake used for reproducible tooling and package management,
independent of host distro.

-

</div>

<div>
<h2 align=center>• pkgs •</h2>

**Status:** Active / Stable

Plain-text package manifests grouped by distro and role,
consumed by install scripts.

-
-
-
-
-

</div>

<div>
<h2 align=center>• scripts •</h2>

**Status:** Active / Stable
-
-
-
-

</div>

<div>
<h2 align=center>• Root Files •</h2>

**Status:** Active / Stable

Top-level entrypoints and integration glue.
If unsure, start here.

-
-
-
-

</div>
