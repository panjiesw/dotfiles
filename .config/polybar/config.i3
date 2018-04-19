[colors]
background = #13191c
background-alt = #13191c
foreground = #ffffff
foreground-alt = #ffffff
primary = #16a085
secondary = #934897
alert = #9d3a5c

[bar/top]
monitor = "eDP1"
dpi = 133
include-file = ~/.config/polybar/top-bar
tray-position = right
;wm-restack = i3
;override-redirect = true
modules-left = volume uptime netspeed
modules-center = i3
modules-right = memory battery date lock

[module/hostname]
type = custom/script
;interval = 256
format = "<label> "
format-prefix = "  "
format-prefix-foreground = ${colors.primary}
format-padding = 0
format-background = ${colors.background}
exec = echo "$(uname -n)"

[module/ip]
type = custom/script
interval = 2
format = "<label> "
format-prefix = " ip: "
format-prefix-foreground = ${colors.primary}
format-background = ${colors.background}
format-padding = 1
exec = echo "$(curl --limit-rate 1k -s https://ifcfg.me)"
exec-if = ping -c 1 google.com

[module/volume]

type = internal/volume
format-volume = <ramp-volume> <label-volume>
label-volume-foreground = ${colors.primary}
format-muted-prefix = " "
format-muted-foreground = ${colors.secondary}
label-muted = Muted
label-muted-foreground= ${colors.alert}
ramp-volume-0 = " "
ramp-volume-1 = " "
ramp-volume-2 = " "
bar-volume-width = 6
bar-volume-indicator = 
bar-volume-fill = ─
bar-volume-empty = ─
bar-volume-empty-foreground = ${colors.foreground-alt}

[module/uptime]
type = custom/script
exec = uptime|awk '{print $2 " " $3 " " $4 " " $5 " " $6}'|cut -d ',' -f -2
interval = 5
format-prefix="   "
format-prefix-foreground = ${colors.primary}
format-foreground = ${colors.foreground}
format-padding = 2
format-background = ${colors.background}

[module/i3]
type = internal/i3
enable-click = true
enable-scroll = false
# strip-wsnumbers = true

# format = <label-state> <label-mode>

ws-icon-0 = 1;
ws-icon-1 = 2;
ws-icon-2 = 3;
ws-icon-3 = 4;
ws-icon-4 = 5;
# ws-icon-5 = 6;
ws-icon-default = ♟

; focused = Active workspace on focused monitor
label-focused = %icon%
label-focused-background = ${colors.background-alt}
label-focused-foreground = ${colors.primary}
label-focused-padding = 1

; unfocused = Inactive workspace on any monitor
label-unfocused = %icon%
label-unfocused-padding = 1

; visible = Active workspace on unfocused monitor
label-visible = %icon%
label-visible-background = ${self.label-focused-background}
# label-visible-foreground = ${self.label-focused-foreground}
label-visible-padding = ${self.label-focused-padding}

; urgent = Workspace with urgency hint set
label-urgent = %icon%
label-urgent-background = ${colors.alert}
label-urgent-padding = 1

[module/xwindow]

type = internal/xwindow
label = %title:0:100:...%

[module/date]
type = internal/date
interval = 30
label = "%date% %time%"
date =
date-alt = %a %d
time = %H:%M
time-alt =
format-prefix = ""
format-prefix-foreground = ${colors.primary}

[module/lock]
type = custom/text
content = 
content-foreground = ${colors.alert}
content-background = ${colors.background}
content-padding = 2
click-left = i3lock -i /mnt/Data/General/Wallpaper/op/one-punch-man-wallpaper-high-resolution-Is-Cool-Wallpapers-1.png

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.primary}
format-background = ${colors.background}
format-padding = 2
format-underline = #4bffdc
label = %gb_used%

[module/disk]
type = internal/fs

mount-0 = /
mount-1 = /home

format-mounted = <label-mounted>
format-background = ${colors.background}
format-foreground = ${colors.primary}

label-mounted = %free%

[module/netspeed]
type = internal/network
;interface = wlp2s0
interface = enp3s0f1
interval = 3.0
label-connected = " %{F#ff0000} %{F-}%upspeed% %{F#00ff00} %{F-}%downspeed%"

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 98

format-charging = <animation-charging> <label-charging>
format-charging-underline = #ffb52a
format-charging-background = ${colors.background}
format-charging-padding = 2

format-discharging = <ramp-capacity> <label-discharging>
format-discharging-underline = ${self.format-charging-underline}

format-full-prefix = 
format-full-prefix-foreground = ${colors.primary}
format-full-underline = ${self.format-charging-underline}
format-full-background = ${colors.background}
format-full-padding = 2

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-foreground = ${colors.foreground-alt}

animation-charging-0 = 
animation-charging-1 = 
animation-charging-foreground = ${colors.foreground-alt}
animation-charging-framerate = 750

[settings]
screenchange-reload = true

[global/wm]
margin-top = 0
margin-bottom = 0

