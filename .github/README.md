![Desktop](/.github/assets/Desktop.png "BSPWM")
![Desktop](/.github/assets/Sublime.png "BSPWM")

### Hi!
<a href="https://github.com/baskerville/bspwm"><img alt="BSPWM Logo" height="150" align = "left" src="https://github.com/baskerville/bspwm/blob/1560df35be303807052c235634eb8d59415c37ff/artworks/bspwm_logo.svg"></a>

<b>  My Simple Dotfiles!  </b>

Welcome to my BSPWM configuration files! 
You may be here to look for my BSPWM configuration files... or looking for something else? ಠωಠ <br>
Feel free to use anything from here but don't forget to give me **credits** :3

BSPWM is a tiling window manager that represents windows as the leaves of a full binary tree.
It only responds to X events, and the messages it receives on a dedicated socket. 
Although it takes time and effort to configure it, but I'm very satisfied with the result.

<h2></h2><br>

**Here are some details about my setup:**

| Programs     | Using       |
| ------------ | ----------- |
| `OS`         | Arch Linux  |
| `Kernel`     | Linux Zen   |
| `Shell`      | Bash        |
| `WM`         | BSPWM       |
| `Gtk theme`  | Graphite    |
| `Icon theme` | Tela circle |

<h2></h2><br>

<table align="right">
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

<details>
<summary><strong>S E T U P</strong></summary>

   > This setup only provided for **Arch Linux** (and all Arch-based distributions)

   > Some of these applications are available in the **Arch Linux User Repository** [(AUR)](https://aur.archlinux.org), to install them you need a [Pacman wrapper](https://wiki.archlinux.org/title/AUR_helpers#Pacman_wrappers). I use [Yay](https://github.com/Jguer/yay)

  1. ### Install git and yay

      + #### Git

         ```sh
         sudo pacman -S git --needed
         ```

      + #### Yay

         ```sh
         git clone https://aur.archlinux.org/yay.git
         cd yay/
         makepkg -si PKGBUILD
         ```

  2. ### Install dependencies

      + #### Dependencies

        > I install these dependencies after a simple Arch Linux installation.
        
         ```sh
         yay -Sy xorg xorg-server xorg-xinit xorg-xbacklight xorg-xsetroot xorg-setxkbmap \
         xf86-video-intel pipewire pipewire-alsa pipewire-jack pipewire-pulse \
         pipewire-media-session htop neofetch rofi polybar ranger tree alacritty python \
         python-pip tk betterlockscreen noto-fonts noto-fonts-extra noto-fonts-emoji \
         noto-fonts-cjk lxappearance-gtk3 pcmanfm google-chrome polkit bspwm sxhkd --needed
         ```
         > Chage xf86-video-intel to another [Driver](https://wiki.archlinux.org/title/Xorg#Driver_installation)

   3. ### Install needed fonts

      You will need to install a few fonts (mainly icon fonts) in order for text and icons to be rendered properly.

      Necessary fonts:
      + **BitStream**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/BitstreamVeraSansMono.zip)
      + **DejaVu**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip)
      + **Hack**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip)
      + **JetBrains**  - [here](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip)
      + **Feather** - This font is included in my dotfiles > .fonts, needed for the icons in rofi.

      For more **Nerd Fonts** visit the [web site](https://www.nerdfonts.com/).

      Once you download them and unpack them, place them into `~/.fonts` or `~/.local/share/fonts`
      and run this command for your system to detect the newly installed fonts.

      Or use my fonts by moving them to the `~/` directory.

      ```sh
      fc-cache -fv
      ```
   
   4. ### Install my BSPWM configuration files

      > Clone this repository

      ```sh
      git clone https://github.com/PyLess/dotfiles-bspwm.git
      cd dotfiles-bspwm
      ```

      > Copy configs and fonts files

      ```sh
      cp -r .config/* ~/.config/
      cp -r .fonts/* ~/
      cp .xinitrc ~/

      # If you use a laptop copy this file to be able to click on tap
      sudo cp 02-touchpad-ttc.conf /etc/X11/xorg.conf.d
      ```

   5. ### Configure stuff

      The relevant files are inside your `~/.config/bspwm` directory.

      + #### User preferences and default applications

         In `bspwmrc` there is a *Default Applications* section where user preferences and default applications are defined.
         You should change those to your liking.

   6. ### Lastly, reboot your system and log in into **`BSPWM`** with xinit tapping `startx`.

</details>
<br>

<details>
<summary><strong>A P P S</strong></summary>

|     Application    |   Description    |
| ------------------ | ---------------- |
| `Alacritty`        | Terminal         |
| `Sublime Text`     | Code editor      |
| `Sublime Merge`    | Git client       |
| `Google chrome`    | Browser          |
| `Dynalist`         | Simple lists     |
| `Obsidian`         | Markdown         |
| `Pcmanfm`          | File manager     |
| `Polybar`          | Status bar       |
| `Rofi`             | App launcher     |
| `Picom`            | Compositor       |
| `Htop`             | Process viewer   |
| `Neofetch`         | Information tool |
| `Scrot`            | Screenshot       |
| `Betterlockscreen` | Lock screen      |

> Download and install [Sublime Text](https://www.sublimetext.com/docs/linux_repositories.html#pacman)/[Sublime Merge](https://www.sublimemerge.com/docs/linux_repositories#pacman)
> Download [Dynalist](https://dynalist.io/download)/[Obsidian](https://obsidian.md/download) and extract the file to the /opt folder   

</details>
<br>

<details>
<summary><strong>K E Y B I N D I N G S</strong></summary>

|        Keybindings        |                 Function                 |
| --------------------------| ---------------------------------------- |
| `Super + Enter`           | Launch (Alacritty)                       |
| `Super + X`               | Launch (Sublime Text)                    |
| `Super + Shift + X`       | Launch (Sublime Merge)                   |
| `Super + D`               | Launch (Dynalist)                        |
| `Super + C`               | Launch (Google chrome)                   |
| `Super + V`               | Launch (Google chrome incognito)         |
| `Super + F`               | Launch (Pcmanfm)                         |
| `Super + Z`               | Launch (Rofi)                            |
| `Super + Alt + {A,S,D}`   | Menus/Applets {windows,powermenu,network}|
| `Super + {Shift + }W`     | Close/Kill Window                        |
| `Super + {1-5}`           | Switches to Workspace 1 to 5             |
| `Super + Shift + {1-9,0}` | Move Apps/Windows to Workspace 1 to 5    |
| `Super + Ctrl + {Z,X,A,S}`| Flags {marked,locked,sticky,private}     |
| `Super + P`               | Screenshot                               |

> To launch Dynalist/Obsidian you need to have the same version in the sxhkdrc configuration and keep the folder in the /opt directory

</details>
<br>

<details>
<summary><strong>A C K N O W L E D G E M E N T S</strong></summary>
  - **Special thanks to**

      + [`rxyhn`](https://github.com/rxyhn)
      + [`vinceliuice`](https://github.com/vinceliuice)
      + [`adi1090x`](https://github.com/adi1090x/rofi)
      + [`axyl-os`](https://github.com/axyl-os/axyl-bspwm)

</details>
<br>

<h2></h2><br>

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/dev/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center"><a href="https://github.com/PyLess/dotfiles-bspwm/blob/main/.github/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=flat-square&label=License&message=GPL-3.0&logoColor=eceff4&logo=github&colorA=061115&colorB=67AFC1"/></a></p>