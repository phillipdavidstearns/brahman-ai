## Installing Wireguard on OSX

* Install homebrew from https://brew.sh

## Generatng Keys

from [https://www.wireguard.com/quickstart/#key-generation](https://www.wireguard.com/quickstart/#key-generation)

* change to your home directory: `cd ~`
* set the permission mask to allow only owner to access files created: `umask 077`
* create a directory for the wireguard keys: `mkdir .wireguard`
cd .wireguard
wg genkey | tee privatekey | wg pubkey > publickey
then send me your pubkey file
Alice StewartToday at 8:18 PM
sweet
Attachment file type: unknown
publickey
45 bytes
\x60a7Today at 8:25 PM
OK I have you as a client in my server. Your VPN address will be 10.42.0.200
let's get your config setup and the tools to connect.
Alice StewartToday at 8:26 PM
Sweeeet
\x60a7Today at 8:33 PM
run the following commands:
sudo mkdir /etc/wireguard/
sudo nano /etc/wireguard/wg0.conf

paste in the following:
[Interface]
#Address = 10.42.0.103/24
# change this to the private key in your ~/.wireguard/ directory 
PrivateKey =                                                        

[Peer]
#Name = Phi's Remote (server)
Endpoint = 23.95.213.211:31337
PublicKey = hIWJ74vYfcqSgsASqIooNRdohQBpKG9SXHkl0tmM1R0=
AllowedIPs = 10.42.0.0/24
PersistentKeepalive = 20

control+x
press y
press enter
Attachment file type: code
wg-start.sh
2.51 KB
Attachment file type: code
wg-stop.sh
570 bytes
Alice StewartToday at 8:39 PM
run the following commands:
sudo mkdir /etc/wireguard/
sudo nano /etc/wireguard/wg0.conf

paste in the following:
[Interface]
#Address = 10.42.0.103/24
# change this to the private key in your ~/.wireguard/ directory 
PrivateKey =                                                        

[Peer]
#Name = Phi's Remote (server)
Endpoint = 23.95.213.211:31337
PublicKey = hIWJ74vYfcqSgsASqIooNRdohQBpKG9SXHkl0tmM1R0=
AllowedIPs = 10.42.0.0/24
PersistentKeepalive = 20

control+x
press y
press enter
in home dir?
\x60a7Today at 8:40 PM
no this is in root /
mkdir /etc/wireguard
creates a wireguard directoy in the /etc/ directory
Alice StewartToday at 8:41 PM
Ah ok cool
\x60a7Today at 8:41 PM
home directory stuff is indicated using ~/
Alice StewartToday at 8:41 PM
ooo
\x60a7Today at 8:42 PM
ls ~/.wireguard for instance will show you the pub and priv keys you just generated
Alice StewartToday at 8:42 PM
Ah yeah I see!
\x60a7Today at 8:42 PM
I also don't know how much console experience you have. Are you pretty comfortable, wobbly, adept?
Alice StewartToday at 8:44 PM
Neeein but I can read up on it
\x60a7Today at 8:44 PM
I have a walkthrough for making a website using only the cli
maybe that'll help ya?
but anyways... let's move those files and link them...
Alice StewartToday at 8:45 PM
Oh wow incredible
For sure send that walkthru.. but yeah lets keep getting set up
\x60a7Today at 8:46 PM
mkdir ~/wg-helpers
copy the wg-start.sh and wg-stop.sh scripts into that directory. it'll be in your home directoy (you can use the GUI)
Alice StewartToday at 8:47 PM
Where do I find the scripts?
\x60a7Today at 8:48 PM
I attached them above
Alice StewartToday at 8:48 PM
oh ya
got it
\x60a7Today at 8:49 PM
These are only kinda pro... you'll need to modify the wg-start.sh script a little
or just use them as I prescribe
proscribe
so once they're in ~/wg-helpers, create a symbolic link to them. can you send me the output of cd;pwd
or echo $HOME
Alice StewartToday at 8:52 PM
/Users/alicestewart
\x60a7Today at 8:52 PM
OK
sudo chmod +x ~/wg-helpers/wg-start.sh
sudo ln -s /Users/alicestewart/wg-helpers/wg-start.sh /usr/local/bin/wg-start
sudo chmod +x ~/wg-helpers/wg-stop.sh
sudo ln -s /Users/alicestewart/wg-helpers/wg-stop.sh /usr/local/bin/wg-stop
chmod makes the script executable (if it isn't already)
ln -s creates a symbolic link in the system executable directory to the script itself
next we have to modify wg-start.sh
Alice StewartToday at 8:55 PM
nice
done those above
\x60a7Today at 8:56 PM
nano ~/wg-helpers/wg-start.sh
change IP_ADDR="" to IP_ADDR="10.42.0.200"
Alice StewartToday at 8:57 PM
ya
\x60a7Today at 8:57 PM
PATH_TO_CONF="" to PATH_TO_CONF="/etc/wireguard/wg0.conf"
now for the magic!
run sudo wg-start.sh
you should get output like this:
[+] Starting wireguard iface using wireguard-go.
INFO: (utun1) 2020/03/23 20:49:54 Starting wireguard-go version 0.0.20200121
[+] Started wireguard iface on utun1.
[+] utun1 successfully configured using /etc/wireguard/wg0.conf
[+] Added route 10.42.0.103 > 10.42.0.103 to utun1.
add net 10.42.0.0: gateway utun1
[+] Added route to subnet 10.42.0.0/24 to utun1.
interface: utun1
  public key: N+v5DRoaT0rUO85eHnCrVx0tjyGZuTR7Sv9g4yGOYQU=
  private key: (hidden)
  listening port: 60243

peer: hIWJ74vYfcqSgsASqIooNRdohQBpKG9SXHkl0tmM1R0=
  endpoint: 23.95.213.211:31337
  allowed ips: 10.42.0.0/24
  transfer: 0 B received, 148 B sent
  persistent keepalive: every 20 seconds
Alice StewartToday at 8:59 PM
sudo: wg-start.sh: command not found
am being dumbi
\x60a7Today at 9:00 PM
if you use ``` and ``` anything in between with become console monotype
did you get any errors running any of the previous commands?
Alice StewartToday at 9:01 PM
Hmm no I don't think I did no
\x60a7Today at 9:01 PM
can you save your terminal session with command+s
and upload here?
Alice StewartToday at 9:02 PM
maybe I retry the chmod stuff
\x60a7Today at 9:02 PM
yeah but I want to see what you entered just uncase
also could you post the output of echo $PATH
Alice StewartToday at 9:03 PM
Ok coool
Attachment file type: unknown
alice-Terminal_Saved_Output
49.15 KB
my password to my computer is 'alice'
lol .
wtf the output is
/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Users/alicestewart/torch/install/bin
WHY AM I THERE
\x60a7Today at 9:04 PM
this is the list of paths where the terminal looks for executables
just wanted to confirm /usr/local/bin
Alice StewartToday at 9:04 PM
ah ok
\x60a7Today at 9:06 PM
oh my bad
sudo wg-start
no sh
Alice StewartToday at 9:06 PM
aaaa nice
\x60a7Today at 9:06 PM
sudo wg-start
Alice StewartToday at 9:07 PM
Ooooo
\x60a7Today at 9:07 PM
did it work?
Alice StewartToday at 9:07 PM
 [+] Starting wireguard iface using wireguard-go.
INFO: (utun2) 2020/03/24 01:07:01 Starting wireguard-go version 0.0.20200121
[+] Started wireguard iface on utun2.
Line unrecognized: `PrivateKey='
Configuration parsing error
[!] Failed to configure utun2 using /etc/wireguard/wg0.conf
[+] Added route 10.42.0.200 > 10.42.0.200 to utun2.
add net 10.42.0.0: gateway utun2
[+] Added route to subnet 10.42.0.0/24 to utun2.
interface: utun2
  listening port: 55780
yepper
\x60a7Today at 9:07 PM
no it didn't
Alice StewartToday at 9:07 PM
o
oh yea
\x60a7Today at 9:07 PM
>Line unrecognized: PrivateKey='`
Alice StewartToday at 9:07 PM
I thought cause it was listening
\x60a7Today at 9:08 PM
hmmmmm
my script isn't perfect.
Alice StewartToday at 9:08 PM
mmmm its the `? needs to be '?
\x60a7Today at 9:08 PM
it should fail if previous steps fail >.<
am an artist not a dev
Alice StewartToday at 9:08 PM
That's OK
wow I mean youre doing very well as a dev
\x60a7Today at 9:08 PM
so run sudo wg-stop
Alice StewartToday at 9:08 PM
ok
\x60a7Today at 9:10 PM
you need to add the text contained in ~/.wireguard/privatekey to the space after PrivateKey =  in /etc/wireguard/wg0.conf
run cat  ~/.wireguard/privatekey and copy the output.
sudo nano /etc/wireguard/wg0.conf
find PrivateKey = and paste the privatekey in there
control+x, y, enter
Alice StewartToday at 9:14 PM
OK
\x60a7Today at 9:14 PM
done?
try sudo wg-start again
copy the output
Alice StewartToday at 9:15 PM
is the output the privatekey?
sorry the output of cat ~/.wirekey/privatekey
\x60a7Today at 9:16 PM
yeah it should look like bvriubr949jkarkr87f33flrfq3+=
or something random
Alice StewartToday at 9:17 PM
hmm i cant get into wireguard so i think its also that chmod thing i didnt do right before
oh nvm sorry
[+] Starting wireguard iface using wireguard-go.
INFO: (utun2) 2020/03/24 01:19:02 Starting wireguard-go version 0.0.20200121
[+] Started wireguard iface on utun2.
[+] utun2 successfully configured using /etc/wireguard/wg0.conf
[+] Added route 10.42.0.200 > 10.42.0.200 to utun2.
add net 10.42.0.0: gateway utun2
[+] Added route to subnet 10.42.0.0/24 to utun2.
interface: utun2
  public key: TXuaQ8SdBeiNiKClvhUX2/PdbgB8S2KuQFAxVBZ9B00=
  private key: (hidden)
  listening port: 59475

peer: hIWJ74vYfcqSgsASqIooNRdohQBpKG9SXHkl0tmM1R0=
  endpoint: 23.95.213.211:31337
  allowed ips: 10.42.0.0/24
  transfer: 0 B received, 148 B sent
  persistent keepalive: every 20 seconds

woopie
:open_mouth:
\x60a7Today at 9:19 PM
OMG!!! it worked!
ping 10.42.0.1
Alice StewartToday at 9:19 PM
!!!! :slight_smile:
it ends the script tho directly after
omg
\x60a7Today at 9:20 PM
yeah it's done what it needs to
Alice StewartToday at 9:20 PM
im pinging but timeout
\x60a7Today at 9:20 PM
you can run sudo wg
Alice StewartToday at 9:20 PM
Request timeout for icmp_seq 4
etc
omg!
64 bytes from 10.42.0.1: icmp_seq=21 ttl=64 time=117.565 ms
something is hapening
\x60a7Today at 9:20 PM
nice
it's a server in buffalo, NY
Alice StewartToday at 9:20 PM
that's so cool
\x60a7Today at 9:21 PM
if we need to change servers, I have others but this is fine.
I'll set up a raspberry pi zero w with wireguard and give you the ability to ssh into it at 10.42.0.201
but tomorrow :wink:
Alice StewartToday at 9:22 PM
Woweeeee
so I can have a pi... but like.. on mars... sniff sinff
shall we name this endeavour?
\x60a7Today at 9:22 PM
in the meantime, send your ssh public keyfile ~/.ssh/id_rsa.pub or whatnot
coming2mars?
Alice StewartToday at 9:22 PM
haha YES
\x60a7Today at 9:22 PM
Ucoming2Mars?
Alice StewartToday at 9:23 PM
ehehhehe
packing4mars
\x60a7Today at 9:23 PM
have you setup your ssh stuff already?
Alice StewartToday at 9:23 PM
idk what that means hang on
\x60a7Today at 9:24 PM
so run this:
ssh-keygen

press enter until your key is generated
then attach the file at ~/.ssh/id_rsa.pub here. you'll use it to log into the Pi once I have it ready to talk to
Alice StewartToday at 9:25 PM
cool okay
Attachment file type: unknown
id_rsa.pub
400 bytes
weeeee
exciting
\x60a7Today at 9:28 PM
nice. that's all for today. so stoked to work with you on this!
Alice StewartToday at 9:28 PM
:slight_smile: me too
So so great
\x60a7Today at 9:28 PM
let's get you into the pi and I'll see if we can hook up an LED
Alice StewartToday at 9:28 PM
Weeeee
And a button
handshake!
\x60a7Today at 9:29 PM
yes yes
tomorrow?
Alice StewartToday at 9:29 PM
yes
\x60a7Today at 9:29 PM
when you're not using the vpn, close out using sudo wg-stop
Alice StewartToday at 9:29 PM
oo ok
done
wait not yet
\x60a7Today at 9:30 PM
if you ever want to check the vpn connection status, sudo wg will show you the connection stats
if it's blank, there's no connection
Alice StewartToday at 9:30 PM
btw this file called '2' appeared in my wg-helpers folder
ooh nice
\x60a7Today at 9:30 PM
yeah... my buggy script >.<
Alice StewartToday at 9:30 PM
pah!
its endearing
\x60a7Today at 9:31 PM
I was trying to suppress printing of output and errors
but I got the redirect command worng LOL
Alice StewartToday at 9:31 PM
you did a rly good job dw
thanks phil
\x60a7Today at 9:31 PM
we miss you here!
Alice StewartToday at 9:31 PM
So cool
I miss you all so much
ngl the last few days have been horrible
for everyone! but it gets better
here to chat btw if you wanna vent anything