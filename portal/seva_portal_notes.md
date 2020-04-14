# portal

## On the pi
1. Stop the autologin screen display manager: `$ sudo systemctl stop lightdm`
1. Start a detached X session with no access control: `$ sudo nohup X -ac`
1. Specify which display to use: `$ export DISPLAY=:0`
1. Set resolution and position of the screens to be side-by-side: `$ xrandr --output HDMI-1 --mode 1280x720 --output HDMI-2 --mode 1280x720 --right-of HDMI-1`
1. turn off display power management system: `$ xset -dpms`
1. turn off screen blanking: `$ xset s noblank`
1. turn off screen saver" `$ xset s off`

oneliners:

```
$ sudo systemctl stop lightdm & sudo nohup X -ac & export DISPLAY=:0 & xrandr --output HDMI-1 --mode 1280x720 --output HDMI-2 --mode 1280x720 --right-of HDMI-1
$ xset -dpms & xset s noblank & xset s off
```

### Set openFrameworks env variables
1. `$ cd src/seva/portal`
1. `$ source ~/.portalrc`
1. `$ make RunRelease`


## Run Locally

1. `$ csshx $(for i in $(seq -w 1 18); do echo portal$i; done)`
1. `$ for i in $(seq -w 1 18); do rsync -ad src/* portal$i:src/seva/portal/src ; done`
1. `$ for i in $(seq -w 1 18); do echo 0,0,128 >/dev/udp/10.79.103.1$i/7979; sleep 1; done`
1. `$ for i in $(seq -w 1 18); do ssh -n portal$i sudo reboot; done`

-- 

1. `$ sudo usermod -a -G tty,sudo,video,plugdev,input,render seva`
1. rsync -a --delete

```
        $HOME/src
        $HOME/opt
        $HOME/.ssh/config
        $HOME/.ssh/id_rsa
        $HOME/.ssh/id_rsa.pub
        $HOME/.ssh/authorized_keys
        $HOME/.ssh/known_hosts
		$HOME/.bashrc
```

-- 

```
systemd-run --property PAMName=login \
            --property User=seva \
            --property StandardInput=tty \
            --property TTYPath=/dev/tty8 \
            sh -c 'chvt 8 && startx /usr/bin/x-terminal-emulator -- :1'
```


-- 

`$ xwininfo -root`

## Portal Pi MAC <--> IP assignments
```
portal01    DC:A6:32:01:16:F0    10.79.103.101
portal02    DC:A6:32:75:E4:4E    10.79.103.102
portal03    DC:A6:32:76:3A:6E    10.79.103.103
portal04    DC:A6:32:75:D6:E4    10.79.103.104
portal05    DC:A6:32:75:D6:F3    10.79.103.105
portal06    DC:A6:32:75:E1:D3    10.79.103.106
portal07    DC:A6:32:01:18:6A    10.79.103.107
portal08    DC:A6:32:01:0F:38    10.79.103.108
portal09    DC:A6:32:01:19:35    10.79.103.109
portal10    DC:A6:32:76:39:ED    10.79.103.110
portal11    DC:A6:32:75:FF:D0    10.79.103.111
portal12    DC:A6:32:76:2D:DA    10.79.103.112
portal13    DC:A6:32:75:E3:38    10.79.103.113
portal14    DC:A6:32:75:E2:0D    10.79.103.114
portal15    DC:A6:32:76:05:0D    10.79.103.115
portal16    DC:A6:32:01:00:0B    10.79.103.116
portal17    DC:A6:32:01:0F:23    10.79.103.117
portal18    DC:A6:32:75:E4:43    10.79.103.118
```
