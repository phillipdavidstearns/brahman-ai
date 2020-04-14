# `packet2audio` on the Portal @ Brahman.ai

Launching an X session terminal and running packet2audio directly to the Pi display.

### run locally on the machine (and not detach):

`sudo xinit -maximize -k8 -j -fa monaco -fs 32 -fg white -bg black -e /bin/sh -c '/usr/local/bin/packet2audio -i wlan0 -p'`

### run remotely and detach:

`
$ ssh portal01 "sudo nohup xinit -maximize -k8 -j -fa monaco -fs 32 -fg white -bg black -e /bin/sh -c '/usr/local/bin/packet2audio -i wlan0 -p' &"
`

### systemd service unit file:

`portal@.service`

```
[Unit]
Description=packet2audio for %I
After=network.target rc.local.service

[Service]
Type=simple
ExecStartPre=/bin/systemctl stop lightdm
ExecStart=/usr/bin/xinit -maximize -k8 -j -fa monaco -fs 32 -fg white -bg black -e /bin/sh -c '/usr/local/bin/packet2audio -i %I -p'
Restart=on-success
RestartPreventExitStatus=SIGTERM SIGKILL
RestartSec=5

[Install]
WantedBy=multi-user.target
```

