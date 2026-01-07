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
- **Distro Support**: It works on Arch, Debian/Ubuntu, Fedora, Nix(experimental / lightly tested), and even supports Brew and Flatpak.
- **Transparent installation**: Every command is shown before it's run.
- Read it first if you’re paranoid (you should be).

</details>
<details>
  <summary>Installation</summary>

- Just run

   ```bash
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/nixarchie/Dots/main/get)"
   ```

- Or clone this repo and run `./install`

- Review the `get` & `install` script before running if you care about what touches your system.

</details>
<details>
  <summary>Repo overview</summary>
  
    Dots/
    ├── install                      Main entry point, sources modular scripts
    ├── get                          Online setup script
    ├── config                       Contains files pointing to $HOME/.config
    ├── home                         Contains files pointing to $HOME
    │   ├── shellconf                Alias and function files live here
    │   ├── .bashrc                  Bash config
    │   └── .zshrc                   Zsh config
    ├── pkgs
    │   ├── arch.txt                 Arch-specific packages
    │   ├── common.txt               Packages installed on all distros
    │   ├── debian.txt               Debian/Ubuntu-specific packages
    │   ├── fedora.txt               Fedora-specific packages
    │   └── nix.txt                  Nix package manager(Works in NixOS & w/o)
    └── scripts
        ├── bash                     Contains bash scripts
        ├── lib                      Contains backend shell scripts.
        └── python                   Contains python scripts

- Everything is written in `bash` and `python`.

- Note: Only some top-level files are shown; each config folder contains multiple dotfiles.

</details>

<div>
<h2 align="center">• important notes •</h2>

- This project is under active development
- Scripts were written and tested on Arch Linux
- Back up existing dotfiles before running
- Run scripts only via `install` and in order

</div>

<div align="center">
    <h2>• usage •</h2>
    <h3></h3>
</div>

This is a template repo that can be forked for private use.

Files that are needed in `~` are to be placed in the `home` dir.

Config files that need to be placed in `~/.config` are to be placed in the `config` dir.

Files needed in `~/.local` are to be placed in the `local` dir.

#### Everything is symlinked, do not delete the repo after setup.


<h4>Please ensure bash and the latest python3 version is installed and available.</h4>

**Optional:** Customize the `pkgs/*.txt` files to include the packages you want.

**WARNING:** Do not remove `python3` from the `pkgs/*.txt` files.

<div align="center">
    <h2>• notes •</h2>
    <h3></h3>
</div>

<details>
<summary> The scripts should be sourced in the following order for proper setup:</summary>

  - update_system.sh ( **WARNING:** the setup may not function properly without it)

  - install_pkgs.sh

  - symlink.sh

  - setup_shell.sh

  - install_flatpak.sh ( Can be ignored)
</details>

<h3></h3>

- For multi-user setups (like Nix), packages may need to be installed per-user.

- The files in `home/shellconf` are automatically sourced on every new shell session and should be edited to the user’s liking.

- The hyprland dots are incomplete and not fully functional and are thus removed, if you wish to use a similar setup to mine, use this <a href="https://ii.clsty.link/en/">setup</a> by <a href="https://github.com/end-4">end-4</a>

<details>
<summary> Before running the install script, please back up or remove the following directories/files if they already exist:</summary>

  - ~/.bashrc

  - ~/.zshrc

  - ~/shellconf

  - ~/.config/fish

  - ~/.config/kitty

  - ~/.config/fuzzel

  - ~/.config/zshrc.d

  - ~/.config/foot
</details>

<div align="center">
    <h3> Enjoy your setup! 🚀 </h3>
    <h4></h4>
</div>

<div align="center">

<h2>• inspirations/copying •</h2>

- This project was heavily inspired by <a href="https://github.com/end-4">end-4</a>'s legendary dotfile structure and their approach to transparent, idempotent setup scripts.

- Copying: Personally I have absolutely no problem with others redistributing/recreating my work. There's no "stealing" (maybe unless you loudly do weird stuff).

</div>

<div align=center>

<h2>• contributing •</h2>
If you have any ideas/improvements feel free to open an issue/pr. Otherwise you can contact me on <a href="https://www.reddit.com/user/TGamer_1/">reddit</a>.(I may respond a bit late)
<h3></h3>

</div>

<h2></h2>

<div align="center">

#### As the project is in development, this README is not always updated. Please do refer to the `Notes` dir for latest changes and plans.

</div>

