# Server journey

A collection of thoughts and notes as I build my home server. If you find anything useful, feel free to use it in your own project.

--------------------

## Table of contents

- [Hardware](#hardware)
  - [CPU / Motherboard](#cpu--motherboard)
  - [Power supply (PSU)](#power-supply-psu)
  - [Case](#case)
  - [RAM](#ram)
  - [Storage](#storage)
- [Assembly](#assembly)
  - [Verifying hardware stability](#verifying-hardware-stability)
  - [BIOS tweaks](#bios-tweaks)
  - [Installing the OS](#installing-the-os)
- [Setting up SSH](#setting-up-ssh)
  - [Part 1: Prerequisite and basic access](#part-1-prerequisite-and-basic-access)
  - [Part 2: Create a Hostname alias](#part-2-create-a-hostname-alias)
  - [Part 3: Generating and using SSH-keys](#part-3-generating-and-using-ssh-keys)
  - [Part 4: Hardening](#part-4-hardening)
- [Installing Docker](#installing-docker)
- [Setting up network security](#setting-up-network-security)
- [Implementing services](#implementing-services)
- [Issues and solutions](#issues-and-solutions)
  - [Bricked motherboard](#bricked-motherboard)
- [Reference tables](#reference-tables)
  - [Approximating power draw](#approximating-power-draw)

_More coming soon!_

-------------------

## Hardware

| Component type | Model name | Price (SEK*) |
| :--- | :--- | ---: |
| [CPU / Motherboard](#cpu--motherboard)| [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp)| 1790 |
| [Power supply](#power-supply-psu) | [be quiet! SYSTEM POWER B9 (_300W_)](https://www.bequiet.com/en/powersupply/1285) | 440 |
| [Case](#case) | [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html)| 380 |
| [RAM](#ram) | [G.SKILL Ripjaws SO-DIMM 16GB, 2400MHz Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS)| 560 |
| [Storage](#storage) | [Crucial MX500 (_250GB + 2TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 2180 |
| Misc| Extension cables, cable ties and more | 270 |
| __Total:__ |  | __5620__ |

[_*10 SEK = ~1 USD_ ](https://www.xe.com/currencyconverter/convert/?Amount=10&From=SEK&To=USD)

### CPU / Motherboard
As I don't expect to be using resource-heavy services such as multiple desktop VM:s, 4K video encoding or multi-user streaming I've settled for an [intel Pentium J5040](https://ark.intel.com/content/www/us/en/ark/products/197304/intel-pentium-silver-j5040-processor-4m-cache-up-to-3-20-ghz.html). It has some useful features for my use case, including:

- 18 execution units for parallel processing
- Integrated Graphics for media and display capability
- Intel Quick Sync for extensive video encoding/decoding support
- 10W TDP (_average power dissipation, a shorthand way to estimate power consumption_)

The J-series is only available as motherboard embedded CPU:s. I've opted for an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp) due to its rich feature-set, but you might consider the [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) as long as you're OK with being limited to 8GB of ram (_or risk bricking your motherboard,_ [_see here for more info_](#bricked-motherboard)).

### Power supply (PSU)
Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep upkeep-cost down. __A power supply is at its most efficient at 50% of maximum rated load__, that means a PSU rated at 500W max load will be at its most efficient when it provides 250W of power.

__What is the efficiency at 50% load?__ That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A 80+ White will be 80-85% efficient at 50% load while a 80+ Titanium will be 94-96% efficient.

After some [back of the napkin calculations](#approximating-power-draw) I've estimated my system to draw between 10 to 23W. As such my ideal PSU would be a power-brick style 50-100W PICO-PSU. I've had no luck finding such a model with the right mix of power-cables (_24-pin and SATA_) and have instead opted for a [be quiet! SYSTEM POWER B9](https://www.bequiet.com/en/powersupply/1285). Besides having all the cables I need, at 300W it offers a better low-load efficiency than a 450-500W model while still providing some head-room for upgrades.

### Case
I wanted something cheap and discreet with some room for expandability. The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes and also included a 120 mm rear-mounted fan.

### RAM
As stated on intel's and ASRock's websites; the J5040 _officially_ supports up to 8GB of RAM.
However, some reddit users report being able to use 16 and even 32GB with [varying results](https://libreddit.dcs0.hu/r/ASRock/comments/k8hpww/how_can_a_motherboard_support_more_ram_than_the/).

I decided to take a gamble with a [G.SKILL Ripjaws SO-DIMM 16GB, 2400 MHz Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS).

### Storage
Spinning hard-disk drives (HDD) are popular in home servers and NAS due to their high storage capacity and low price. However, they have reduced speeds and increased power draw compared to solid-state drives (SSD). Their moving parts also add noise and a [significant](https://en.wikipedia.org/wiki/Head_crash) point of failure.

I opted for two [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (_250GB bootdrive + 2TB storage drive_) as they provide a good balance between price and performance. They also support _Integrated Power Loss Immunity_ which aims to prevent data loss in case of a power outage.

--------------------

## Assembly
| Image | Note |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/server-journey/blob/main/media/inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access to the motherboard fittings and has plenty of room for cable managment without the presence of a GPU. |
| ![power-extender cable](https://github.com/Stylback/server-journey/blob/main/media/psu_cable.jpg?raw=true) | The only gripe I had with the case was the power-extender. It's aligned in such a way that the cable has to be forcefully twisted to slot into my specific PSU. I tried to screw the end out and flipping it 180°, allowing the cable to rest naturally on the case floor. It was however not possible to screw it in that way due to the shape of the cutout. |
| ![rear view](https://github.com/Stylback/server-journey/blob/main/media/back.jpg?raw=true) | Rear-view and IO. |
| ![assembled case](https://github.com/Stylback/server-journey/blob/main/media/outside.jpg?raw=true) | Assembled system. |

### Testing hardware stability

Before installing the operating system I wanted to ensure that my RAM modules would not cause any system instability. MemTest86 is an industry staple in this regard, it has a multitude of tests designed to coax RAM instability under extreme conditions.

I made a bootable USB following their [instructions](https://www.memtest86.com/tech_creating-linux-mac.html) and ran the standard configuration (_13 tests, 4 passes_).

| Image | Note |
|:---|:---|
| ![Ram modules detected by MemTest86](https://github.com/Stylback/server-journey/blob/main/media/memtest86_ram.bmp?raw=true) | Both sticks of RAM was detected by MemTest86. |
| ![Test completion screen](https://github.com/Stylback/server-journey/blob/main/media/memtest86_pass.jpg?raw=true) | The sticks passed with 0 errors and a completion time of 4 hours and 37 minutes. |

--------------------
### BIOS tweaks

The ASRock J5040-ITX comes with an extensive list of BIOS settings, I made the following changes:

- SATA Aggressive Link Power Management -> __Enabled__, reduces power consumption while SATA devices are idle.
- Onboard HD Audio -> __Disabled__, as I won't use any audio outputs.
- Deep S5 -> __Auto__, reduces power consumption on a turned off system.
- Restore on AC/Power -> __Loss Power On__, restarts the system after a power failure.

--------------------

### Installing the OS

After confirming hardware stability I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. It was a pain-free process thanks to extensive [documentation](https://ubuntu.com/server/docs). 

I assigned the 250GB drive as boot drive, consuming about half of its available storage. The rest was partitioned and mounted to `/home` for any application or service that needs to store information there. As the 2TB drive is going to be used as the primary storage unit it was partioned and mounted at `/srv`.

## Setting up SSH

SSH is a protocol that allows remote login and command-line-execution, something that will be very convenient when we continue to set up the server. Both my client and server is using Ubuntu-derivative OSs, as such the commands might differ from your own.

### Part 1: Prerequisite and basic access

To be able to SSH from a client to a server:
- There must be a traversable network connection between them and
- They both need to have a SSH service installed

OpenSSH usually comes shipped by default on desktop Linux distributions, if for some reason you do not have the client it can be installed by running `sudo apt install openssh-client`.

On the server we install it using `sudo apt install openssh-server`, this was however not necessary in my case as the Ubuntu installer provided me with the option during initial set-up.

From the server, run `ip a` to get information about your network connections and take note of current IPs. As I'm on the same local network as my server I wrote down its local IP before proceeding.

On the client, run `ssh username@server-ip`, where _username_ is the username on the server and _server-ip_ is the IP jotted down earlier. The terminal will prompt for a password and connect.

### Part 2: Create a Hostname alias

We don't want to have to remember `username@server-ip`, so instead we are creating an alias which will allow us to access the server by just running `ssh alias`.

On the client, run `cd ~/.ssh` and then `touch config` to make a SSH configuration file.
Edit the file by running `nano config`. Write the following, replacing _alias_, _server-ip_ and _username_ with relevant information:

```sh
Host alias
  Hostname server-ip
  Port 22
  User username
```

__NOTE__: The spaces before _Hostname_, _Port_ and _User_ are __required__!

Save and exit, you should now be able to connect to your server by running `ssh alias`.

### Part 3: Generating and using SSH-keys

On the client, run `ssh-keygen -t ed25519 -C "comment"`, replacing _comment_ with some information to help you remember what the key is used for.

You will be prompted for a name, you can chose a name or accept the default `id_ed2559` by pressing enter. You will also be prompted for a passphrase, enter a passphrase (_recommended!_) or press enter to skip.

This will create a keypair, one public key named `keyname.pub` and one private key just named `keyname`. You can verify this by running `cd ~/.ssh` followed by `ls -la`.

__NOTE:__ Always keep your private key secure, __never__ share it with anyone! If you have reason to believe that your private key has been compromised, generate a new keypair and delete the old one from the servers `authorized_keys` file.

Now lets copy the __public__ key to our server. On the client, run `ssh-copy-id -i ~/.ssh/keyname.pub alias`, replacing _keyname_ and _alias_ with whatever you chose earlier. If you chose a passphrase for the key you will be prompted for it now.

Verify that the key works by connecting to the server with `ssh alias`. If the keys have been exchanged correctly you should __not__ be prompted for a password.

### Part 4: Hardening

Now that we can connect to the server using our SSH-key, we will make some security enhancement to prevent brute-forcing and root access.

On your client, connect to the server and run `sudo nano /etc/ssh/sshd_config`. Search after the line with `PermitRootLogin`, uncomment and change it to `PermitRootLogin no`. Then search for `PasswordAuthentication`, uncomment and change it to `PasswordAuthentication no`. 

Finally, find the line with `Port 22`, uncomment and change it from 22 to another port of your choice (_just remember to change the port number for your alias to reflect this_). Save and exit.

__NOTE:__ Do __NOT__ close the terminal window! Until we know everything works, ensure that you have atleast one other terminal instance running that is connected to the server. If something was entered incorrectly in the configuration file you might lose access to the server!

Restart the SSH service by running `sudo systemctl restart ssh`.

Verify that everything works by first trying to connect to the server with `ssh alias`, then try to access it using `ssh root@server-ip` (_the server should deny this attempt_).

If everything worked correctly, the server should now be accessible only by your SSH-key and no user that access it by SSH can gain Root privileges. As we changed the port number from the default we gain some resistance against automated attacks, but a persistent actor could still find the correct port after some trial and error.

## Installing Docker

[Docker](https://www.docker.com/) lets us set up containers to hold our applications, making it easy to handle access and permissions. To install the necessary Docker components I followed their [official documentation](https://docs.docker.com/engine/install/) which can be summarized below as:

Get the prerequisite with:

```sh
sudo apt-get update
```
```sh
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
Add Dockers official GPG with:

```sh
sudo mkdir -p /etc/apt/keyrings
```
```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
Now we can safely set up the repository with:

```sh
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```
Now we can install the Docker components: 
```sh
sudo apt-get update
```
```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
Finally, verify that everything is working by running:

```sh
sudo docker run hello-world
```

## Setting up network security

Private domain-name for easier management.

Dynamic DNS, as static IP can bring everything down if it changes.

Reverse proxy manager with [NGINX manager](https://nginxproxymanager.com/).

Ban malicious hosts with [Fail2Ban](https://github.com/fail2ban/fail2ban).

[SWAG - Secure Web Application Gateway](https://github.com/linuxserver/docker-swag) seems to combine NGINX, Fail2Ban and more in the same image.

[CrowdSec](https://www.crowdsec.net/), crowd-sourced IP blocklist.

## Implementing services

### Flame

[Flame](https://github.com/pawelmalak/flame), a dashboard.

### Uptime Kuma

[Uptime Kuma](https://github.com/louislam/uptime-kuma)

### Nextcloud

[Nextcloud](https://nextcloud.com/)

### Jellyfin

[Jellyfin](https://jellyfin.org/) 

### ARR suite

Lidarr/Sonarr/Radarr/Prowlarr

[Wiki](https://wiki.servarr.com/docker-guide)

### Static Web Server

[Static Web Server](https://sws.joseluisq.net/)

--------------------

## Issues and solutions

### Bricked motherboard

> __TL;DR:__ Initially made the build with a Biostar J4105NHU, a BIOS-update broke RAM-support and trying to revert back to the previously known working version bricked it.

I initially used a Biostar J4105NHU, the motherboard shipped with BIOS-version __J41BW929.BSS__ and worked flawlessly with a pair of 8GB RAM-modules. 

A couple of days go by and I shut the system down to do some cable-management, after which it refused to boot.

I figured I messed something up with the cables and put everything back as it was, no luck.

I removed one of the RAM-modules and tried again, nothing.

Finally I popped the CMOS battery out, waited a bit and re-placed it. This seemed to have done the job as I was greeted with a login prompt. I shut it down and re-placed the other RAM-module, nothing happens.

I pop the CMOS again, boot with a single module and see the BIOS-version was updated to __J41BWB22.BSS__. Determined to regain the ability to use both modules I tried to flash the __J41BW929.BSS__ version using Biostars provided flashing tool. The tool reported a successfull flash but the process had in fact _bricked_ the motherboard. I was unable to "CMOS-pop" my way out of this one.

Lesson learned, think thrice before manually flashing your BIOS. I have since replaced the board with an ASRock J5040-ITX. I also had to replace my RAM-modules with SO-DIMM ones due to board incompatibility.

## Reference tables

### Approximating power draw

| Component | Power draw (_idle_) [W] | Power draw (_active_) [W] |
| :--- | ---: | ---: |
| Crucial MX500 1TB | 0.10[^1] | 0.54[^1] |
| Crucial MX500 250GB | 0.08[^1] | 0.54[^1] |
| G.SKILL Ripjaws SO-DIMM 16GB | 6.00[^2] | 6.00[^2] |
| ASRock J5040-ITX | 0.70[^3] | 10.00[^3] |
| Total (_100% efficiency_): | 6.88 | 16.08 |
| __Total (_70% efficiency_[^4]):__ | __9.82__ | __22.97__ |

If we assume an average 2 hours of full system utilization per day, with the rest being equivalent to an idle power state, we can approximate the daily power consumption to: $\frac{22.97 \times 2 + 9.82 \times 22}{1000} \approx 0.262 \textrm{ kWh/Day}$

Or a yearly power consumption of: $0.262*365 \approx 95.6 \textrm{ kWh/Year}$

For comparison, running an [average dishwasher](https://energyusecalculator.com/electricity_dishwasher.htm) once a week for 3 hours consumes about $\approx 282 \textrm{ kWh/Year}$

[^1]: [AnandTech MX500 review](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8). Power draw for the 250GB model is inferred from the MX500 500GB results.

[^2]: [TomsHardware i7-5960x review](https://www.tomshardware.com/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html). This number seems to agree with Crucials [own assessment](https://www.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use).

[^3]: Inferred from [Dr. Helmut Neukirchen power consumption test](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/) as the J4105 have the same TDP as the J5040. I also subtracted 3 W from the authors measurements which is the estimated power consumption of a 8GB stick of DDR4 RAM.

[^4]: [HardwareInfo low-load PSU test](https://web.archive.org/web/20130812130505/http://uk.hardware.info:80/reviews/4683/3/45-psus-tested-at-very-low-loads-which-one-is-the-most-efficient-225-watt-test). Inferred from the 22.5 W test of the _be quiet! Pure Power L8 300 W_.

**[Back to top](#)**