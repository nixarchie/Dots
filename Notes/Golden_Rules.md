<div align="center">
    <h1>【 Nixie’s Hardcore Golden Rules for Distrohoppers 】</h1>
    <h3></h3>
</div>

Before you dive into the rules, a little about the author:

<div align="center">
    <h2>• My Distro-Hopping Journey •</h2>
    <h3></h3>
</div>

I’ve been through the trenches:  

$$
\text{Debian} \longrightarrow \text{FreeBSD} \longrightarrow (\text{NixOS} \leftrightarrow \text{FreeBSD})_i \longrightarrow \text{Arch} \longrightarrow \text{FreeBSD} \longrightarrow \text{Void}
$$

- Multiple full wipes (don’t try this at home 😅)  
- Experimented with XFCE, Qtile, Niri, Hyprland, Kde, Gnome, and more exotic WMs  
- Survived GDM drama, Wayland nightmares, and GRUB/NVRAM chaos  

I’ve lived the mistakes, learned the hacks, and still have the scars to prove it. If you follow these rules, you’ll skip most of the pain I went through and get straight to the fun part—customizing, tweaking, and owning your OS like a legend.


<div align="center">
    <h2>• The Golden Rules •</h2>
    <h3></h3>
</div>


The brutal truths from the frontlines of OS warfare. Learn fast or cry later.

<div>
    <h3>• Backup = Life Insurance </h3>
</div>

- You think you’re invincible? Nope.  
- **Always back up before touching anything**, even if it’s “just a fresh install.”  
- `rsync`, `tar`, Git—use them like your life depends on it. Because it kinda does.

<div>
    <h3>• Partition or Ragequit</h3>
</div>

- Big drive? Don’t wipe it like a savage.  
- Partitioning is your friend.

<div>
    <h3>• Experiment Without Casualties</h3>
</div>

- Got a wild WM/DE idea? Do it in a VM or secondary partition.  
- Primary OS = sacred. Don’t treat it like a sandbox for chaos.

<div>
    <h3>• Keep a Battle Log</h3>
</div>

- Every tweak, hack, and catastrophic fail goes into **notes or Git**.  
- Future-you will look back and whisper: “Thank god I wrote this down.”

<div>
    <h3>• Respect the Bootloader</h3>
</div>

- GRUB, rEFInd, EFI NVRAM… these are delicate, mystical beasts.  
- One wrong move and you’re staring at tty1 crying.  
- Always have a live USB ready for resurrections.

<div>
    <h3>• Logs Don’t Lie</h3>
</div>

- `dmesg`, `/var/log`, `journalctl`—read them.  
- GDM, Wayland, X11—drama queens. They love to mess with you. Logs $=$ truth serum.

<div>
    <h3>• Don’t Chase Shiny Objects Blindly</h3>
</div>

- XFCE, Qtile, Niri, Wayland experiments… tempting, but they’ll eat your soul.  
- Keep a **stable base OS** that actually boots so you can survive the chaos.

<div>
    <h3>• Wipes Are Lessons</h3>
</div>

- Every wiped OS = a hard lesson.  
- “There are no accidents” — Master Oogway wasn’t kidding.  
- Rage now, learn forever.

<div>
    <h3>• Version Control EVERYTHING</h3>
</div>

- Dotfiles, scripts, configs—Git it or lose it.  
- Makes hopping between Arch, FreeBSD, Void… and beyond, almost painless.

<div>
    <h3>• Have Fun, Don’t Lose Your Mind</h3>
</div>

- Distro-hopping is a *thrill ride*, not self-torture.  
- If an OS is taking more rage than joy, step back and rethink strategy.  
