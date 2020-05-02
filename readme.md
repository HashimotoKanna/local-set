# dotfiles 

Desktop environment configuration files for my **Archlinux**

![2020-01-31-171749_3840x2160_scrot](https://user-images.githubusercontent.com/16812446/73523207-aa62e580-444d-11ea-9ed6-6e82ab536bf2.png)

![2020-01-31-020523_1920x1080_scrot](https://user-images.githubusercontent.com/16812446/73472338-39301d80-43ce-11ea-9565-82c6da03eb75.png)

![4](https://user-images.githubusercontent.com/16812446/80850130-58e91300-8c55-11ea-9483-407c17e488f3.png)

### Top-Right IP

![2](https://user-images.githubusercontent.com/16812446/80850105-3e169e80-8c55-11ea-9a54-6442d4a4e2d0.png)

This is local(private) IP.

### Bottom-Right IP

![1](https://user-images.githubusercontent.com/16812446/80850109-48389d00-8c55-11ea-87c8-875221c53825.png)

The right one are the gateway IP and network IP in order.

### Bottom-Left IP(or host)

![3](https://user-images.githubusercontent.com/16812446/80850125-4ff84180-8c55-11ea-9d65-c1ecb1730fb8.png)

This is ssh connection information in USER@HOST format.

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
```

## License


Copyright (C) 2018-2019 HAN CHAN SOL

This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
reproduced below.

                DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                       Version 2, December 2004
    Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
    Everyone is permitted to copy and distribute verbatim or modified
    copies of this license document, and changing it is allowed as long
    as the name is changed.
                DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
       TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
    0. You just DO WHAT THE FUCK YOU WANT TO.
