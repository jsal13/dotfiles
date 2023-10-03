# Misc Notes from Ubuntu Server Exploration

## Terminal Setup

### Font Size

```bash
# Changes Font size.  Terminus, 10x20 is good.
sudo vi /etc/default/console-setup
sudo update-initramfs -u

# Restart to see effects.
reboot
```
### Screen Brightness
```bash
# Note the max brightness is in the same dir, and 1500 is the value chosen for current brightness.
echo 1500 | sudo tee /sys/class/backlight/intel_backlight/brightness
```



## Commands

`cat -v` will show hidden characters like line ends.

