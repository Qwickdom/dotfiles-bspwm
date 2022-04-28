![Desktop](/.github/assets/Desktop.png "BSPWM")
![Desktop](/.github/assets/Sublime.png "BSPWM")

### Hi!
<a href="https://github.com/baskerville/bspwm"><img alt="BSPWM Logo" height="150" align = "left" src="https://github.com/baskerville/bspwm/blob/1560df35be303807052c235634eb8d59415c37ff/artworks/bspwm_logo.svg"></a>

<b>  My Simple Dotfiles!  </b>

Welcome to my BSPWM configuration files! 
You may be here to look for my BSPWM configuration files... or looking for something else? ಠωಠ
Feel free to use anything from here but don't forget to give me **credits** :3

BSPWM is a tiling window manager that represents windows as the leaves of a full binary tree.
It only responds to X events, and the messages it receives on a dedicated socket. 
Although it takes time and effort to configure it, but I'm very satisfied with the result.

<h2></h2><br>

**Here are some details about my setup:**

| Programs   | Using             |
| ---------- | ----------------- |
| WM         | awesome           |
| OS         | arch linux        |
| Terminal   | alacritty         |
| Shell      | zsh               |
| Editor     | neovim / vscode   |
| Compositor | picom             |

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
                  THIS DOTFILES ARE CONFIGURED AT 1366x768
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

Download [Dynalist](https://dynalist.io/download)/[Obsidian](https://obsidian.md/download) and extract the file to the /opt folder   

</details>
<br>

<a id="keybinds"></a>
## Keybindings

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

To launch Dynalist/Obsidian you need to have the same version in the sxhkdrc configuration and keep the folder in the /opt directory