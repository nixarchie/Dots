<div align="center">
    <h1>【 Dots — Multi-Distro Bootstrap 】</h1>
    <h3></h3>
</div>


<div align="center">

![](https://img.shields.io/github/last-commit/nixarchie/Dots?style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/nixarchie/Dots?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/nixarchie/Dots?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

</div>

<div align="center">
    <h2>• overview •</h2>
    <h3></h3>
</div>

<details>
  <summary>Notable features</summary>

- **Overview**: This repository automates setting up your terminal workflow and dotfiles across multiple Linux distributions.
- **Distro Support**: It works on Arch, Debian/Ubuntu, Fedora, NixOS(No idea how it will behave), and even supports Brew and Flatpak.
- **Transparent installation**: Every command is shown before it's run.
- **Automatic setup**: with the `--auto` flag everything will be automatically installed and setup with proper symlinks using python.

</details>
<details>
  <summary>Installation</summary>

- Just run

   ```bash
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/nixarchie/Dots/main/get)"
   ```

- Or clone this repo and run `./install.sh`

</details>
<details>
  <summary>Repo overview</summary>
  
    Dots/
    ├── install.sh                 Main entry point, sources modular scripts
    ├── config                       Contains files pointing to $HOME/.config
    │   ├── fish                     Fish config files
    │   ├── foot                     Foot config files
    │   ├── fuzzel                   Fuzzel config files
    │   └── kitty                    Kitty config files
    ├── home                         Contains files pointing to $HOME
    │   ├── shellconf                Alis and function files to be listed here
    │   │   ├── function.fish        Functions for Fish
    │   │   ├── function.zsh         Functions for Z Shell(zsh)
    │   │   ├── z_alias.fish         Alias for fish
    │   │   └── z_alias.zsh          Alias for Z Shell
    │   ├── .bashrc                  Bash config
    │   └── .zshrc                   Zsh config
    ├── pkgs
    │   ├── arch.txt                 Arch-specific packages
    │   ├── common.txt               Packages installed on all distros
    │   ├── debian.txt               Debian/Ubuntu-specific packages
    │   ├── fedora.txt               Fedora-specific packages
    │   └── nix.txt                  Nix package manager(Works in NixOS & w/o)
    └── scripts
        ├── bash                     Contains bash scripts
        └── python                   Contains python scripts

- Everything is written in `bash` and `python`.

- Note: Only some top-level files are shown; each config folder contains multiple dotfiles.

</details>

**The user is advised to read the entire README.**

<div align="center">
    <h2>• usage •</h2>
    <h3></h3>
</div>

Run `install.sh` with `--auto` to automatically install packages and link configs.
Or use `--skip-update` with `--auto` to automatically install packages and link configs without updating the package repo(s) and your entire system.

<h4>Please insure bash and the latest python3 version is installed and available.</h4>

Alternately, In a POSIX-Compilant Shell:

```
source install.sh
```

`Bash` is recommended by the developer as it is what he used, but `sh` can also be used.
Nothing else is recommended and may not behave correctly, Z Shell(zsh) has been tested and gave errors.

**Optional:** Customize the pkgs/*.txt files to include the packages you want.
**WARNING:** Do not remove python3 form the pkgs/*.txt files.

<div align="center">
    <h2>• notes •</h2>
    <h3></h3>
</div>

- The scripts should be sourced in the following order for proper setup:

  - update_system.sh ( **WARNING:** the setup may not function properly without it)

  - install_pkgs.sh

  - symlink.sh

  - setup_shell.sh

  - install_flatpak.sh ( Can be ignored)

- For multi-user setups (like Nix), packages may need to be installed per-user.

- Scripts are to be run one at a time through install.sh.

- **The user is expected to backup important files beforehand**.

- The files present inside `home/shellconf` should be edited according to the user's liking, containing `alias`, `functions` and other things to the users liking as they as automatically sourced at every new instance.

- The hyprland dots are incomplete and not fully functunal and are thus removed, if you wish to use the approx. same setup as me, use this <a href="https://ii.clsty.link/en/">setup</a> by <a href="https://github.com/end-4">end-4</a>

- The scripts are currently focused on Arch, as it is what the creator (me) used to create them.

- Before running this script, please backup or remove the following directories/files if they already exist:
  - ~/.bashrc
  - ~/.zshrc
  - ~/shellconf
  - ~/.config/fish
  - ~/.config/kitty
  - ~/.config/fuzzel
  - ~/.config/zshrc.d
  - ~/.config/foot


<div align="center">
    <h3> Enjoy your setup! 🚀 </h3>
    <h4></h4>
</div>

<div align="center">

<h2>• inspirations/copying •</h2>

- This project was heavily inspired by <a href="https://github.com/end-4">end-4</a>’s legendary dotfile structure and their approach to transparent, idempotent setup scripts.

- Copying: Personally I have absolutely no problem with others redistributing/recreating my work. There's no "stealing" (maybe unless you loudly do weird stuff).

</div>

<div align=center>

<h2>• contrubiting •</h2>
If you have any ideas/improvements feel free to open an issue/pr. Otherwise you can contact me on <a href="https://www.reddit.com/user/TGamer_1/">reddit</a>.(I may respond a bit late)
<h3></h3>

</div>

<h2></h2>

<div>

<h4>As the project is in devlopement, this README is not always updated. Please do refer to the `Notes` dir for latest changes and plans.</h4>

</div>

**P.S. The scripts were written on Arch Linux and haven’t yet been tested on other distros.**
