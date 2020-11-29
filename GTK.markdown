# GOOD TO KNOW


## Graphics output

`arandr` gui for xrandr

## change brightness
`xrandr --output eDP1 --brightness 0.5` middle
`xrandr --output eDP1 --brightness 1` max

### BACKLIGHT VERSION
```
sudo find /sys/ -type f -iname '*brightness*'

The output should give you something like this:

/sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-LVDS-1/intel_backlight/brightness

Now, all you have to do is link it to /sys/class/backlight. To do that:

sudo ln -s /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-LVDS-1/intel_backlight  /sys/class/backlight
```

OR

```
create the file xorg.conf:

edit /etc/X11/xorg.conf

And add these lines:

Section "Device"
Identifier  "Card0"
Driver      "intel"
Option      "Backlight"  "NAME OF THE FOLDER"
EndSection
```


## NETWORK GUI
`prefer netctl and ip`

`sudo pacman -S network-manager-applet`
`nm-applet`
`nmcli`
`nmtui`

## NICE FILE MANAGEMENT
`pcmanfm`
`ranger` terminal file browser

## AUDIO

### I3
#### PULSEAUDIO VERSION
```bash
bindsym XF86AudioLowerVolume exec /usr/bin/pactl set-sink-volume 0 '-5%'
bindsym XF86AudioRaiseVolume exec /usr/bin/pactl set-sink-volume 0 '+5%'
pactl set-sink-mute 0 toggle
```

#### ALSA VERSION
```bash
bindsym XF86AudioRaiseVolume exec amixer set Master 5%+ unmute
bindsym XF86AudioLowerVolume exec amixer set Master 5%- unmute
bindsym XF86AudioMute exec amixer set Master nmute
```

## Set wallpaper

`feh`
```bash
exec --no-startup-id feh --bg-scale ~/path/to/wallpaper.png
```

## MOUNT DRIVES

### Map a NAS drive
CIFS
``
SMB
``

### automount
have  a  look to udiskie

### PONEY WAY

```
mount -t cifs -o username=USERNAME,password=PASSWD //192.168.1.88/shares /mnt/share
```
### SERIOUS WAY
Should use credential file like this
store in a FILE :
```
username=value
password=value
domain=value
```

```
mount -t cifs -o credential=FILE //192.168.1.88/shares /mnt/share
```


# TO TRY

```
# network manager (always runs)
# (I have no idea why --no-startup-id might be a clever choice, it is used on various websites)
exec nm-applet
```
