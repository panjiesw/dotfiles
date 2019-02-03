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
modules-left = volume mpd
modules-center = i3
modules-right = netspeed temp memory battery date lock

[module/mpd]
type = internal/mpd
interval = 1
label =  <label-song> <icon-[random|repeat|repeatone]> <bar-progress>

host = 127.0.0.1
port = 6600

format-online = <icon-prev> <icon-seekb> <icon-stop> <toggle> <icon-seekf> <icon-next>  <label-time>  <label-song>
;format-offline =   Off
format-offline = MPD Off
label-song =  %artist% - %title%

; Awesome Font >                   
icon-play = " "
icon-pause = " "
icon-stop = " "
icon-prev = " "
icon-next = " "
icon-seekb = " "
icon-seekf = " "
icon-random = " "
icon-repeat = " "
icon-repeatone =

bar-progress-width = 20
bar-progress-indicator = |
bar-progress-fill = ─
bar-progress-empty = ─

[module/spotify]
type = custom/script
exec = ~/.config/polybar/polybarspotify.sh
interval = 1
format = <label>

[module/temp]
type = internal/temperature
;hwmon-path = /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
;hwmon-path = /sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input
hwmon-path = /sys/class/hwmon/hwmon3/temp1_input
warn-temperature = 60

format = <ramp> <label>
format-warn = <ramp> <label-warn>
format-padding = 1
format-warn-padding = 1

label-warn-foreground = ${colors.alert}
ramp-0 = " "
ramp-1 = " "
ramp-2 = " "
ramp-foreground = ${colors.primary}
ramp-warn-foreground = ${colors.alert}

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

type = internal/pulseaudio
format-volume = "<ramp-volume> <label-volume>   "
format-padding = 2
# label-volume-foreground = ${colors.primary}
format-muted-prefix = " "
format-muted-padding = 1
format-muted-foreground = ${colors.secondary}
label-muted = 婢 Muted
label-muted-foreground= ${colors.alert}
ramp-volume-0 = "  奄"
ramp-volume-1 = "  奔"
ramp-volume-2 = "  墳"
ramp-volume-foreground = ${colors.primary}
# ramp-volume-0 = " "
# ramp-volume-1 = " "
# ramp-volume-2 = " "
# bar-volume-width = 6
# bar-volume-indicator = 
# bar-volume-fill = ─
# bar-volume-empty = ─
# bar-volume-empty-foreground = ${colors.foreground-alt}

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
;strip-wsnumbers = true

;format = <label-state> <label-mode>
format-padding = 2

# ws-icon-0 = 1;
ws-icon-0 = 1;
ws-icon-1 = 2;
ws-icon-2 = 3;
ws-icon-3 = 4;
ws-icon-4 = 5;
;ws-icon-5 = 6;
;ws-icon-default = ♟

; mode
;label-mode = %mode%
;label-mode-padding = 2
;label-mode-background = ${colors.background-alt}
;label-mode-foreground = ${colors.primary}

; focused = Active workspace on focused monitor
label-focused = " %index% %icon% "
label-focused-background = ${colors.background-alt}
label-focused-foreground = ${colors.primary}
# label-focused-padding = 1

; unfocused = Inactive workspace on any monitor
label-unfocused = " %index% %icon% "
# label-unfocused-padding = 1

; visible = Active workspace on unfocused monitor
label-visible = " %index% %icon% "
label-visible-background = ${self.label-focused-background}
# label-visible-foreground = ${self.label-focused-foreground}
# label-visible-padding = 1

; urgent = Workspace with urgency hint set
label-urgent = " %index% %icon% "
label-urgent-background = ${colors.alert}
# label-urgent-padding = 1

[module/xwindow]

type = internal/xwindow
label = "  %title:0:50:...%"

[module/date]
type = internal/date
interval = 30
label = "%date% %time%"
date =
date-alt = %a %d
time = %H:%M
time-alt =
format-prefix = ""
format-prefix-foreground = ${colors.primary}
format-padding = 1

[module/lock]
type = custom/text
content = 
content-foreground = ${colors.alert}
content-background = ${colors.background}
content-padding = 1
click-left = i3lock -i /mnt/Data/General/Wallpaper/op/one-punch-man-wallpaper-high-resolution-Is-Cool-Wallpapers-1.png

[module/memory]
type = internal/memory
interval = 2
format-prefix = " "
format-prefix-foreground = ${colors.primary}
format-background = ${colors.background}
format-padding = 1
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
#interface = wlp2s0
interface = enp3s0f1
interval = 3.0
label-connected = " %{F#16a085}祝 %{F-}%upspeed% %{F#16a085} %{F-}%downspeed%"
# label-connected = " %{F#ff0000}祝 %{F-}%upspeed% %{F#00ff00} %{F-}%downspeed%"
# label-connected = "祝 %upspeed%  %downspeed%"

[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 98

format-charging = <animation-charging> <label-charging>
format-charging-underline = #ffb52a
format-charging-background = ${colors.background}
format-charging-padding = 1

format-discharging = <ramp-capacity> <label-discharging>
format-discharging-underline = ${self.format-charging-underline}

format-full-prefix = 
format-full-prefix-foreground = ${colors.primary}
format-full-underline = ${self.format-charging-underline}
format-full-background = ${colors.background}
format-full-padding = 1

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
ramp-capacity-foreground = ${colors.primary}

animation-charging-0 = ﱤ
animation-charging-1 = ﱣ
animation-charging-foreground = ${colors.primary}
animation-charging-framerate = 750

[settings]
screenchange-reload = true

[global/wm]
margin-top = 0
margin-bottom = 0

