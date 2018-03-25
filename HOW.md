# Manjaro Installation Notes

Asus ROG GL552VX

## Unable to shutdown/reboot

Seems to be related to Lockup issue in NVIDIA_Optimus even though I hadn't installed that.
Solutions: add `acpi_osi=! acpi_osi="Windows 2009"` to boot sequence (this is specific for my laptop)
Links: 
https://wiki.archlinux.org/index.php/NVIDIA_Optimus
https://github.com/Bumblebee-Project/Bumblebee/issues/764#issuecomment-234494238

## Open File Descriptor Limit

edit `/etc/security/limits.conf`

```
@panjiesw	soft	nofile	500000
@panjiesw	hard	nofile	900000
```

edit `/etc/systemd/user.conf` and `/etc/systemd/system.conf`
add `DefaultLimitNOFILE=900000`

## Customization

### Themes

adapta-maia-theme
adapta-black-maia-theme

### LightDM GTK Greeter position

add active-monitor=0 in [greeter]
customize with LightDM GTK+ Greeter Setting


