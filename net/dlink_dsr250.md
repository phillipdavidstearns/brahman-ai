## SSH configuration of the DSR-250

* Enabled SSH management from any IP address (not the most secure)
* Attempting to connect to the DSR-250 over ssh yielded:

```
Unable to negotiate with 10.79.10.30 port 22: no matching key exchange method found. Their offer: diffie-hellman-group-exchange-sha1,diffie-hellman-group1-sha1
```

[https://unix.stackexchange.com/questions/340844/how-to-enable-diffie-hellman-group1-sha1-key-exchange-on-debian-8-0](https://unix.stackexchange.com/questions/340844/how-to-enable-diffie-hellman-group1-sha1-key-exchange-on-debian-8-0)

>The OpenSSH website has a page dedicated to legacy issues such as this one. It suggests the following approach, on the client:

```
ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 123.123.123.123
```

>or more permanently, adding

```
Host 123.123.123.123
    KexAlgorithms +diffie-hellman-group1-sha1
```

>to `~/.ssh/config`.

* Changed `~/.ssh/config`, added:

```
Host 10.79.10.30
	User admin
	KexAlgorithms +diffie-hellman-group1-sha1
	KexAlgorithms +diffie-hellman-group-exchange-sha1
```

* Attempting to ssh in yielded the following:

```
no matching cipher found. Their offer: aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,arcfour,aes192-cbc,aes256-cbc,rijndael-cbc@lysator.liu.se
```

* From [https://www.openssh.com/legacy.html](https://www.openssh.com/legacy.html):
* Ran `ssh -Q cipher`
* Added cipher to `~/.ssh/config`: `Ciphers aes256-cbc`
* Attempting to login yielded:

```
BusyBox v1.17.4 (2018-05-03 11:31:38 IST) built-in shell (ash)
Enter 'help' for a list of built-in commands.

SSH login from user (admin) from IP (10.79.10.106) is not allowed.
Connection to 10.79.10.30 closed.
```