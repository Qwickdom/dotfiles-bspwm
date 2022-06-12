<a href="https://github.com/baskerville/bspwm"><img alt="BSPWM Logo" height="150" align = "left" src="https://github.com/baskerville/bspwm/blob/1560df35be303807052c235634eb8d59415c37ff/artworks/bspwm_logo.svg"></a>

<b>  My Simple Dotfiles!  </b>

Welcome to my BSPWM configuration files! 
You may be here to look for my BSPWM configuration files... or looking for something else? ಠωಠ <br>
Feel free to use anything from here but don't forget to give me **credits** :3

BSPWM is a tiling window manager that represents windows as the leaves of a full binary tree.
It only responds to X events, and the messages it receives on a dedicated socket. 
Although it takes time and effort to configure it, but I'm satisfied with the result.

<div align="center">
  
**Here are some details about my setup**

| Programs     | Using              |
| ------------ | ------------------ |
| `OS`         | [Arch Linux](https://wiki.archlinux.org/title/Arch_Linux)  |
| `Kernel`     | [Linux Zen](https://wiki.archlinux.org/title/Kernel#Officially_supported_kernels)   |
| `Shell`      | [Bash](https://wiki.archlinux.org/title/Bash)        |
| `WM`         | [BSPWM](https://wiki.archlinux.org/title/Bspwm)       |
| `Gtk theme`  | [Graphite](https://github.com/vinceliuice/Graphite-gtk-theme)    |
| `Icon theme` | [Tela circle](https://github.com/vinceliuice/Tela-circle-icon-theme) |

</div>

<details align="center">
<summary><strong>S H O T S</strong></summary><br>

![Desktop](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Desktop-ganyu.png)

| Terminal         | Sublime        |
| ---------------- | -------------- |
| ![Terminal](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Terminal.png) | ![Sublime](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Sublime.png) |

> Another theme of desktop

![Desktop](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Desktop-hsgrl.png)

<details align="center">
<summary><strong>Shots rofi</strong></summary><br>

| `Launcher`     |  `Windows`    |
| -------------- | ------------- |
| ![Rofi-lc](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/launcher.png) | ![Rofi-w](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/windows.png) |
| `Screenshot`   | `Powermenu`   |
| ![Rofi-ss](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/screenshot.png) | ![Rofi-pm](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/powermenu.png) |
| `Network`      | `MPD`         |
| ![Rofi-nw](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/network.png) | ![Rofi-m](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/mpd.png) |
| `Style-switch` | `Links`        |
| ![Rofi-sw](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/style-switch.png)| ![Rofi-lk](https://raw.githubusercontent.com/Qwickdom/dotfiles-bspwm/main/.github/assets/Rofi/links.png) |

</details></details>

<h2></h2><br>

<table align="center">
  <tr>
    <th align="center">
      <sup><sub>⚠ WARNING ⚠</sub></sup>
    </th>
  </tr>
  <tr>
    <td align="center">
      <sup>
         <sub>
            <samp>
                  THIS DOTFILES ARE CONFIGURED AT 1366x768 ON LAPTOP
               <p align="center">
                  BUT IT WILL STILL WORK PERFECTLY IN HIGH RESOLUTION
               </p>
                  DONT WORRY JUST INSTALL THESE DOTFILES AND GIVE THIS REPO A STARS
            </samp>
         </sub>
      </sup>
    </td>
  </tr>
</table>

<details align="center">
<summary><strong>S E T U P</strong></summary><br>

This setup only provided for **Arch Linux** (and all Arch-based distributions)

Some of these applications are available in the **Arch Linux User Repository** [(AUR)](https://aur.archlinux.org), to install them you need a [pacman wrapper](https://wiki.archlinux.org/title/AUR_helpers#Pacman_wrappers). <br> I use [Yay](https://github.com/Jguer/yay)

<details align="center">
<summary>Install git and yay</summary>

 #### Git

 ```sh
 sudo pacman -Sy git
 ```

 #### Yay

 ```sh
 git clone https://aur.archlinux.org/yay.git
 cd yay/
 makepkg -si PKGBUILD
 ```
</details>

<details align="center">
<summary>Dependencies</summary><br>

 I install these dependencies after a simple Arch Linux [installation](https://wiki.archlinux.org/title/Installation_guide).

 **Xorg and video driver** (chage xf86-video-intel to another [driver](https://wiki.archlinux.org/title/Xorg#Driver_installation))

 ```sh
 sudo pacman -S xorg-server xorg-xinit xorg-xbacklight xorg-xsetroot \ 
 xorg-setxkbmap xf86-video-intel
 ```

 **Audio**
 
 ```sh
 sudo pacman -S pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber \ 
 alsa-lib alsa-utils
 ```

 **Fonts extra**
 
 ```sh
 sudo pacman -S noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk
 ```

 **Essentials**
 
 ```sh
 yay -Sy alacritty ranger polybar rofi picom feh scrot betterlockscreen polkit-gnome bspwm sxhkd
 ```

 **Optionals** (necessary to me)
 
 ```sh
 sudo pacman -S chromium htop neofetch tree python python-pip tk lxappearance-gtk3 gvfs gvfs-mtp pcmanfm \ 
 mpd mpc ncmpcpp dunst
 ```
</details>

<details align="center">
<summary>Needed fonts</summary><br>

 You will need to install a few fonts (mainly icon fonts) in order for text and icons to be rendered properly.

 Necessary fonts: <br>
 **BitStream**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/BitstreamVeraSansMono.zip) <br>
 **DejaVu**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip) <br>
 **Hack**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip) <br>
 **JetBrains**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip) <br>
 **Feather** - This font is included in my dotfiles > .fonts, needed for the icons in rofi. <br>
 **MaterialDesign** - This font is included in my dotfiles > .fonts, needed for the icons in updates.

 For more **Nerd Fonts** visit the [website](https://www.nerdfonts.com/).

 Once you download them and unpack them, place them into `~/.fonts` or `~/.local/share/fonts`
 or use my fonts by moving them to the `~/` directory and run this command for your system to 
 detect the newly installed fonts.

 ```sh
 fc-cache -fv
 ```
</details>

<details align="center">
<summary>My BSPWM configuration files</summary><br>

 Clone this repository

 ```sh
 git clone https://github.com/Qwickdom/dotfiles-bspwm.git
 cd dotfiles-bspwm
 ```

 Copy configs and fonts files

 ```sh
 cp -r .config/* ~/.config/
 cp -r .fonts/ ~/
 cp -r .mpd/ ~/
 cp -r .ncmpcpp/ ~/
 cp -r .themes/ ~/
 cp -r .vim/ ~/
 cp .fehbg ~/
 cp .vimrc ~/
 cp .xinitrc ~/
 ```

 If you use a laptop copy this file to be able to click on tap

 ```sh
 sudo cp 02-touchpad-ttc.conf /etc/X11/xorg.conf.d/
 ```
</details>

<details align="center">
<summary>Configure stuff</summary><br>

 The relevant files are inside in `~/.config/bspwm` directory.

 #### Polybar

 In `config.ini` is *My Status Bar* configuration where I define my preferences.
 You should change this to your liking monitor.

 #### Rofi

 Here you'll find the menus that I usually use.
 If you want to add more, you can place theme in bin/ and themes/ respectively.

 #### Background

 This is a simple script to set my background.
 Edit the file and add your image in the directory corresponding.

 #### BSPWM config

 In `bspwmrc` I've some auto start processes, window manager configuration and rules for applications.
 You should change the monitor in case of is different.

 #### Picom

 In `picom.conf` I defined some of the composer values that are to my liking.
 Change the file if you want.

</details>

<details align="center">
<summary>Log in</summary><br>

 Lastly, reboot your system and log in into `BSPWM` with xinit tapping `startx`.

</details></details><br>

<details align="center">
<summary><strong>A P P S</strong></summary><br><div align=center>

<table><tr><th>Essentials</th><th>Optionals</th></tr>
<tr><td>

 | Apps               | Description        |
 | ------------------ | ------------------ |
 | `Alacritty`        | Terminal           |
 | `Ranger`           | File manager (vim) |
 | `Polybar`          | Status bar         |
 | `Rofi`             | App launcher       |
 | `Picom`            | Compositor         |
 | `Feh`              | Image viewer       |
 | `Betterlockscreen` | Lock screen        |
 | `Scrot`            | Screenshot utility |

</td><td>

 | Apps               | Description      |
 | ------------------ | ---------------- |
 | `Chromium`         | Browser          |
 | `Htop`             | Process viewer   |
 | `Neofetch`         | Information tool |
 | `Pcmanfm`          | File manager     |
 | `Sublime Text`     | Code editor      |
 | `Sublime Merge`    | Git client       |
 | `Dynalist`         | Simple lists     |
 | `Obsidian`         | Markdown         |

</td></tr> </table>

Download and install [Sublime Text](https://www.sublimetext.com/docs/linux_repositories.html#pacman) / [Sublime Merge](https://www.sublimemerge.com/docs/linux_repositories#pacman)

Download [Dynalist](https://dynalist.io/download) / [Obsidian](https://obsidian.md/download) and extract the file to the /opt folder

</div></details><br>

<details align="center">
<summary><strong>K E Y B I N D I N G S</strong></summary><div align=center><br>

| Keybindings                | Function                                      |
| -------------------------- | --------------------------------------------- |
| `Super + Return`           | Launch (Alacritty)                            |
| `Super + {Shift + }W`      | Close/Kill Window                             |
| `Super + {Shift + }A`      | Launch (Chromium / Chromium incognito)        |
| `Super + {Shift + }S`      | Launch (Sublime Text / Merge)                 |
| `Super + {Shift + }D`      | Launch (Dynalist / Obsidian)                  |
| `Super + X`                | Launch (Pcmanfm)                              |
| `Super + {1-5}`            | Switches to Workspace 1 to 5                  |
| `Super + Shift + {1-9,0}`  | Move Apps/Windows to Workspace 1 to 5         |
| `Super + Ctrl + {Z,X,A,S}` | Flags {marked,locked,sticky,private}          |
| `Super + {LESS,GREATER}`   | Hide windows                                  |
| `Alt + {W,A,S,D,Z,X,C,L}`  | Menus/Applets {windows,screenshot,powermenu,network,launcher,mpd,style-switch,links} |
| `Alt + {Shift + }Tab`      | Focus next / previous window floating         |
| `Alt + {U,I}`              | Increase / Decrease window gap                |

To launch Dynalist / Obsidian you need to have the same version in the `sxhkdrc` configuration file and keep the folder in the /opt directory

</div></details><br>

<details align="center">
<summary><strong>A C K N O W L E D G E M E N T S</strong></summary><br>

<h4> Special thanks for inspiring me to use Arch Linux </h4>

[`rxyhn`](https://github.com/rxyhn)
[`saimoomedits`](https://github.com/saimoomedits)
[`vinceliuice`](https://github.com/vinceliuice)
[`adi1090x`](https://github.com/adi1090x)
[`axyl-os`](https://github.com/axyl-os/axyl-bspwm)

</details><br>

<h2></h2><br>

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/dev/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center"><a href="https://github.com/Qwickdom/dotfiles-bspwm/blob/main/.github/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=flat-square&label=License&message=GPL-3.0&logoColor=eceff4&logo=github&colorA=061115&colorB=67AFC1"/></a></p>
