# dotfiles 

Desktop environment configuration files for my Archlinux

## list

- **i3-gaps**

- **polybar**

- **compton**

- **vscode**

- **alacritty**

- **ranger**

- **cmus**

## i3-gaps

- Install : https://github.com/Airblader/i3/wiki/Installation

- Configuration 

  - path : `~/.config/i3/config`

  - key mapping : `bindsym $mod+{KEY} {ACTION}`

  - gaps width : `gaps inner {NUM}`

  - auto-start : `exec --no-start-id {PROCESS}`

### my settings

- custom key mapping

  - start a terminal

    ```
    bindsym $mod+Return exec alacritty
    ```

  - kill focused window

    ```
    bindsym $mod+q kill
    ```

  - start rofi

    ```
    bindsym $mod+g exec rofi -show combi
    bindsym $mod+d exec rofi -show drun
    bindsym $mod+Shift+d exec rofi -show ssh -no-parse-known-hosts
    ```

  - custom binding

    ```
    bindsym $mod+t exec google-chrome-beta
    bindsym $mod+c exec code
    bindsym $mod+x exec cmusa
    bindsym $mod+o exec tusk
    bindsym $mod+Shift+Tab workspace prev
    bindsym $mod+Tab workspace next
    bindsym $mod+a exec rangera
    bindsym $mod+p exec qtwebflix
    bindsym $mod+m exec ~/.config/i3/toggle_bar.sh --bottom
    bindsym $mod+n exec ~/.config/i3/toggle_bar.sh --top
    bindsym $mod+Shift+n exec reboot
    bindsym $mod+Shift+m exec shutdown now
    bindsym $mod+z exec blueberry
    bindsym $mod+Shift+p exec ~/.config/i3/config_dual_monitor.sh
    ```

  - laptop function button binding

    ```
    bindsym XF86MonBrightnessUp exec xbacklight -inc 15
    bindsym XF86MonBrightnessDown exec xbacklight -dec 15
    bindsym XF86AudioRaiseVolume exec amixer set Master 8+
    bindsym XF86AudioLowerVolume exec amixer set Master 8-
    bindsym XF86AudioMute exec amixer set Master 0
    ```

  - mouse specifal button binding

    ```
    bindsym --whole-window button9 kill
    bindsym --whole-window button8 fullscreen toggle
    ```

  - i3-gaps setting

    ```
    for_window [class=".*"] border pixel 0
    gaps inner 4
    ```

  - auto start 

    ```
    exec --no-startup-id nm-applet # Network Manager for auto WiFi connection
    exec --no-startup-id blueberry-tray # bluetooth manager for auto Blutooth connection
    exec --no-startup-id /usr/lib/blueberry/blueberry-obex-agent.py
    exec --no-startup-id xrdb ~/.Xresources
    exec --no-startup-id watch -n 3600 feh --randomize --bg-fill ~/Pictures/wallpaper-home/* # for wallpaper
    exec --no-startup-id ~/.config/polybar/start.sh # start polybar 
    exec --no-startup-id compton --config ~/.config/compton/compton.conf # start compton
    exec --no-startup-id ~/.dropbox-dist/dropboxd # start dropbox
# exec --no-startup-id google-chrome-beta # auto start chrome, but I don't use it now
    ```
