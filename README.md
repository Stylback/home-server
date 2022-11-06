<p align="center"><img src="https://github.com/Stylback/home-server/blob/main/media/dashboard.png?raw=true" alt="Dashboard screenshot"/></p>

## About

This project is all about my home server, here I document my implementations step-by-step so that I may more easily reproduce them at a later date. 

I could've not started my journey towards self-hosting were it not for the open source community, as such my documentation is and will always be open for others to read and learn from. If you're looking to use this documentation in one of your own projects, private or commercial, please see the [license and usage](#license-and-usage) section for more information.

Do you have a question? Create an [issue](https://github.com/Stylback/home-server/issues) with the `question` tag and I will answer it to the best of my ability.

Got feedback or suggestions? I would love to hear it, please create an [issue](https://github.com/Stylback/home-server/issues) with the `suggestion` tag and we can take it from there.

## Table of contents

<details><summary>Click to expand</summary>
<p>

--------------------

*__Please note:__ Hyperlinks for subsections will not work if that section is collapsed.*

- [About](#about)
- [Table of contents](#table-of-contents)
- [Hardware choices](#hardware-choices)
  - [CPU / Motherboard](#cpu--motherboard)
  - [Power supply (PSU)](#power-supply-psu)
    - [Approximating power consumption](#approximating-power-consumption)
  - [Case and fan](#case-and-fan)
  - [RAM](#ram)
  - [Storage](#storage)
  - [Final build costs](#final-build-costs)
- [Assembly and initial setup](#assembly-and-initial-setup)
  - [Assembly](#assembly)
  - [Testing RAM stability](#testing-ram-stability)
  - [BIOS tweaks](#bios-tweaks)
  - [Installing the OS](#installing-the-os)
    - [Benchmarking](#benchmarking)
    - [Timezone setup](#timezone-setup)
    - [Removing Ubuntu Pro messages](#removing-ubuntu-pro-messages)
- [SSH](#ssh)
  - [Prerequisite and local access](#prerequisite-and-local-access)
  - [Create a Hostname alias](#create-a-hostname-alias)
  - [Generate and use SSH-keys](#generate-and-use-ssh-keys)
  - [Hardening](#hardening)
- [Perimeter security with Fail2Ban](#perimeter-security-with-fail2ban)
  - [Inital setup](#inital-setup)
  - [Useful Fail2Ban commands](#useful-fail2ban-commands)
  - [Gotify](#gotify)
- [Docker](#docker)
  - [Initial setup](#initial-setup)
  - [Managing containers with ctop](#managing-containers-with-ctop)
- [NGINX Proxy Manager](#nginx-proxy-manager)
  - [Aquire a domain](#aquire-a-domain)
  - [Docker](#docker-1)
  - [Stream port for remote SSH](#stream-port-for-remote-ssh)
  - [Fail2Ban](#fail2ban)
- [ddns-updater](#ddns-updater)
  - [Docker](#docker-2)
  - [NGINX proxy Manager](#nginx-proxy-manager-1)
- [Notifications with Gotify](#notifications-with-gotify)
  - [Docker](#docker-3)
  - [Fail2Ban](#fail2ban-1)
  - [Homarr](#homarr)
  - [Finishing up](#finishing-up)
- [Automate updates with Watchtower](#automate-updates-with-watchtower)
  - [Docker](#docker-4)
  - [Gotify](#gotify-1)
- [Dashboard with Homarr](#dashboard-with-homarr)
  - [Docker](#docker-5)
  - [NGINX proxy Manager](#nginx-proxy-manager-2)
  - [Fail2Ban](#fail2ban-2)
- [Multimedia streaming with Jellyfin](#multimedia-streaming-with-jellyfin)
  - [Consistent directories](#consistent-directories)
  - [Docker](#docker-6)
  - [NGINX proxy manager](#nginx-proxy-manager-3)
  - [Media transfer and streaming](#media-transfer-and-streaming)
  - [Hardware acceleration](#hardware-acceleration)
  - [Customization](#customization)
  - [Fail2Ban](#fail2ban-3)
  - [Homarr](#homarr-1)
- [Torrenting with qflood](#torrenting-with-qflood)
  - [Wireguard](#wireguard)
  - [Docker](#docker-7)
  - [qBittorrent settings](#qbittorrent-settings)
  - [Flood settings](#flood-settings)
  - [Fail2Ban](#fail2ban-4)
  - [Homarr](#homarr-2)
- [Indexers with Prowlarr](#indexers-with-prowlarr)
  - [Docker](#docker-8)
  - [NGINX Proxy Manager](#nginx-proxy-manager-4)
  - [Fail2Ban](#fail2ban-5)
  - [Homarr](#homarr-3)
- [Movies with Radarr](#movies-with-radarr)
  - [Docker](#docker-9)
  - [NGINX proxy Manager](#nginx-proxy-manager-5)
  - [Fail2Ban](#fail2ban-6)
  - [Homarr](#homarr-4)
- [Series with Sonarr](#series-with-sonarr)
  - [Docker](#docker-10)
  - [NGINX Proxy Manager](#nginx-proxy-manager-6)
  - [Fail2ban](#fail2ban-7)
  - [Homarr](#homarr-5)
- [Subtitles with Bazarr](#subtitles-with-bazarr)
  - [Docker](#docker-11)
  - [NGINX proxy Manager](#nginx-proxy-manager-7)
- [Request shows and movies with Jellyseerr](#request-shows-and-movies-with-jellyseerr)
  - [Docker](#docker-12)
  - [NGINX Proxy Manager](#nginx-proxy-manager-8)
  - [Homarr](#homarr-6)
  - [Gotify](#gotify-2)
  - [Fail2Ban](#fail2ban-8)
- [Music with Lidarr](#music-with-lidarr)
  - [Docker](#docker-13)
  - [NGINX proxy Manager](#nginx-proxy-manager-9)
  - [Fail2Ban](#fail2ban-9)
  - [Homarr](#homarr-7)
- [Issues and solutions](#issues-and-solutions)
  - [Motherboard](#motherboard)
  - [ddns-updater](#ddns-updater-1)
  - [Containerized Fail2Ban](#containerized-fail2ban)
- [License and usage](#license-and-usage)
- [To-Do](#to-do)

--------------------

</p>
</details>

## Hardware choices

This section is about the hardware I use, why I chose a particular piece of hardware and what trade-offs are to be expected compared to similar choices.

<details><summary>Click to expand</summary>
<p>

--------------------

### CPU / Motherboard

I've settled for an [intel Pentium J5040](https://ark.intel.com/content/www/us/en/ark/products/197304/intel-pentium-silver-j5040-processor-4m-cache-up-to-3-20-ghz.html) as it has some particularly useful features for my use case:

- 18 execution units for parallel processing
- Integrated Graphics for display output
- Intel Quick Sync for extensive video encoding/decoding support
- 10W TDP (_Thermal Design Power, a shorthand way of estimating power consumption_)

However; J-series CPU:s are only available as "on-board" or "embedded" CPU:s, which is to say they are soldered directly onto a motherboard. I've opted for an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp) due to its rich feature-set, but you might consider the cheaper [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) if you're OK with being limited to 8GB of RAM (_or risk bricking your motherboard, see_ [_here_](#issues-and-solutions) _for my experience_).

### Power supply (PSU)

Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep power consumption down. A power supply is at its most efficient at __50% of maximum rated load__, that means a PSU rated at 500W max load will be at its most efficient when it provides 250W of power.

What __is__ the efficiency at 50% load? That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A `80+ White` will be 80-85% efficient at 50% load while a `80+ Titanium` will be 94-96% efficient.

After some back of the napkin calculations (_see "Approximating power consumption" below_) I've estimated my system to draw between 10 to 23W. As such my ideal PSU would be a power-brick style 50-100W PICO-PSU. I've had no luck finding such a model with the right mix of power-cables and have instead opted for a traditional ATX PSU. At 300W, the [SYSTEM POWER B9 from be quiet!](https://www.bequiet.com/en/powersupply/1285) offers a better low-load efficiency compared to the more common 450/500W models with the added benefit of providing some headroom for upgrades.

<details><summary>Approximating power consumption, click to expand</summary>
<p>

--------------------

#### Approximating power consumption

| Component | Power draw (_idle_) [W] | Power draw (_active_) [W] |
| :--- | ---: | ---: |
| Crucial MX500 1TB | 0.10<sup>1</sup> | 0.54<sup>1</sup> |
| Crucial MX500 250GB | 0.08<sup>1</sup> | 0.54<sup>1</sup> |
| G.SKILL Ripjaws SO-DIMM 16GB | 6.00<sup>2</sup> | 6.00<sup>2</sup> |
| ASRock J5040-ITX | 0.70<sup>3</sup> | 10.00<sup>3</sup> |
| NF-A12X25 ULN | 0.6<sup>4</sup> | 0.6<sup>4</sup> |
| Total (_100% efficiency_): | 7.48 | 17.68 |
| __Total (_70% efficiency_^<sup>5</sup>):__ | __10.7__ | __25.3__ |

If we assume an average 2 hours of full system utilization per day, with the rest being equivalent to an idle power state, we can approximate the daily power consumption to: $\frac{25.3 \times 2 + 10.7 \times 22}{1000} \approx 0.286 \textrm{ kWh/Day}$

Or a yearly power consumption of: $0.286*365 \approx 104 \textrm{ kWh/Year}$

<sup>1. [AnandTech MX500 review](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8). Power draw for the 250GB model is inferred from the MX500 500GB results.</sup>

<sup>2. [TomsHardware i7-5960x review](https://www.tomshardware.com/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html). This number seems to agree with Crucials [own assessment](https://www.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use).</sup>

<sup>3. Inferred from Dr. Helmut Neukirchen's [power consumption test](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/) of the J4105, as it has the same TDP as the J5040. I also subtracted 3 W from the authors measurements which is the estimated power consumption of a 8GB stick of DDR4 RAM.</sup>

<sup>4. Noctua NF-A12X25 ULN [specification](https://noctua.at/en/products/fan/nf-a12x25-uln/specification).</sup>

<sup>5. [HardwareInfo low-load PSU test](https://web.archive.org/web/20130811112042/http://uk.hardware.info/productinfo/188792/be-quiet!-pure-power-l8-300w#tab:testresults). Inferred from the 22.5 W test of the _be quiet! Pure Power L8 300 W_.</sup>

--------------------

</p>
</details>

### Case and fan

The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes; discreet and affordable with some room for expandability. I wasn't fully satisfied with the noise level of the included rear-mounted 120mm fan, as such I replaced it with a [Noctua NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln).

### RAM

The J5040 __officially__ supports up to 8GB of RAM as stated on intel's and ASRock's websites. Despite this [some](https://libreddit.dcs0.hu/r/ASRock/comments/k8hpww/how_can_a_motherboard_support_more_ram_than_the/) reddit users report being able to use 16 or even 32GB with varying results. With this in mind I decided on a [G.SKILL Ripjaws SO-DIMM 16GB](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS) kit.

### Storage

Spinning hard-disk drives (HDD) are popular in home servers and NAS due to their high storage capacity and low price. However, they have reduced speeds and increased power draw compared to solid-state drives (SSD). Their moving parts also add noise and a significant [point of failure](https://en.wikipedia.org/wiki/Head_crash).

I opted for two [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (_250GB bootdrive + 2TB storage drive_) as they provide a good balance between price and performance, in addition they support _Integrated Power Loss Immunity_ which aims to prevent data loss in the case of a power outage.

### Final build costs

| Component type | Model name | Price ([SEK](https://www.xe.com/currencyconverter/convert/?Amount=1000&From=SEK&To=USD)) |
| :--- | :--- | ---: |
| CPU / Motherboard | [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp)| 1790 |
| Power supply | [be quiet! SYSTEM POWER B9 (_300W_)](https://www.bequiet.com/en/powersupply/1285) | 440 |
| Case | [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html)| 380 |
| Fan | [NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln) | 290 |
| RAM | [G.SKILL Ripjaws SO-DIMM 16GB, 2400MHz Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS)| 560 |
| Storage | [Crucial MX500 (_250GB + 2TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 2180 |
| Cable| [Power cable 5m](https://www.amazon.se/gp/product/B07Y1VHRPT/) | 110 |
| Cable| [Cat 5e cable 5m](https://www.amazon.se/gp/product/B00I7XX1BC/) | 60 |
| Misc | [Cable ties](https://www.amazon.se/gp/product/B09GFMN616/) | 100 |
| __Total:__ |  | __5910__ |

--------------------

</p>
</details>

## Assembly and initial setup

This section is about my experience putting the hardware together and verifying that everything works as it should.

<details><summary>Click to expand</summary>
<p>

--------------------

### Assembly

| Image | Note |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/home-server/blob/main/media/inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access and has plenty of room for cable managment, as long as you don't have a GPU. |
| ![power-extender cable](https://github.com/Stylback/home-server/blob/main/media/psu_cable.jpg?raw=true) | One gripe with the case is the power-extender, it's aligned in such a way that the power-cable has to be forcefully twisted to slot into my PSU. I tried to screw the socket out and flip it 180° but it was not possible due to the shape of the cutout. |
| ![rear view](https://github.com/Stylback/home-server/blob/main/media/back.jpg?raw=true) | Rear-view and IO. Picture taken before switching the fan out for a NF-A12X25 ULN. |
| ![assembled case](https://github.com/Stylback/home-server/blob/main/media/outside.jpg?raw=true) | Assembled system. |

### Testing RAM stability

Before installing the operating system I wanted to ensure that my RAM modules would not cause any system instability. MemTest86 is an industry staple in this regard, it has a multitude of tests designed to coax RAM instability under extreme conditions.

I made a bootable USB following their [instructions](https://www.memtest86.com/tech_creating-linux-mac.html) and ran the standard configuration (_13 tests, 4 passes_).

| Image | Note |
|:---|:---|
| ![Ram modules detected by MemTest86](https://github.com/Stylback/home-server/blob/main/media/memtest86_ram.bmp?raw=true) | Both sticks of RAM was detected by MemTest86. |
| ![Test completion screen](https://github.com/Stylback/home-server/blob/main/media/memtest86_pass.jpg?raw=true) | The sticks passed with 0 errors, completing the tests in 4 hours and 37 minutes. |

### BIOS tweaks

The ASRock J5040-ITX comes with an extensive list of BIOS settings, so far I've made the following changes:

| Setting | Default | Set to | Reason |
| ------------- | ------------- |------------- |------------- |
| SATA Aggressive Link Power Management | Disable | Enable | Reduces power consumption while SATA devices are idle. |
| Onboard HD Audio | Enable | Disable | Audio will be handled client-side. |
| Deep S5 | Disable | Auto | Reduces power consumption while the system is turned off. |
| Restore on AC/Power | Loss Power Off | Loss Power On | Restarts the system after a power failure. |

### Installing the OS

After confirming RAM stability I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. It was a pain-free process thanks to [extensive](https://ubuntu.com/server/docs) documentation.

I assigned the 250GB drive as boot drive, consuming about half of its available storage. The rest was partitioned and mounted to `/home` for any application or service that needs to store data there. As the 2TB drive is going to be used as the primary storage unit it was partioned and mounted at `/srv`.

#### Benchmarking

After creating a user and logging in for the first time, I updated the system with:

```sh
sudo apt update && sudo apt upgrade
```

Afterwards I ran [YABS](https://github.com/masonr/yet-another-bench-script), which is a benchmarking script:

```sh
curl -sL yabs.sh | bash
```

My results:

```sh
Basic System Information:
-------------
Processor  : Intel(R) Pentium(R) Silver J5040 CPU @ 2.00GHz
CPU cores  : 4 @ 2300.000 MHz
AES-NI     : ✔ Enabled
VM-x/AMD-V : ✔ Enabled
RAM        : 15.3 GiB
Swap       : 4.0 GiB
Disk       : 2.0 TiB
Distro     : Ubuntu 22.04.1 LTS
Kernel     : 5.15.0-48-generic

fio Disk Speed Tests (Mixed R/W 50/50):
-------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 89.41 MB/s   (22.3k) | 122.40 MB/s   (1.9k)
Write      | 89.65 MB/s   (22.4k) | 123.04 MB/s   (1.9k)
Total      | 179.06 MB/s  (44.7k) | 245.45 MB/s   (3.8k)
           |                      |                     
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 167.05 MB/s    (326) | 169.66 MB/s    (165)
Write      | 175.92 MB/s    (343) | 180.96 MB/s    (176)
Total      | 342.98 MB/s    (669) | 350.63 MB/s    (341)

iperf3 Network Speed Tests (IPv4):
-------------
Provider        | Location (Link)           | Send Speed      | Recv Speed     
                |                           |                 |                
Clouvider       | London, UK (10G)          | 5.13 Mbits/sec  | busy           
Online.net      | Paris, FR (10G)           | 124 Mbits/sec   | busy           
Hybula          | The Netherlands (40G)     | 124 Mbits/sec   | 124 Mbits/sec  
Uztelecom       | Tashkent, UZ (10G)        | 121 Mbits/sec   | 122 Mbits/sec  
Clouvider       | NYC, NY, US (10G)         | 120 Mbits/sec   | 122 Mbits/sec  
Clouvider       | Dallas, TX, US (10G)      | 116 Mbits/sec   | 120 Mbits/sec  
Clouvider       | Los Angeles, CA, US (10G) | 117 Mbits/sec   | 119 Mbits/sec  

Geekbench 5 Benchmark Test:
-------------
Test            | Value                         
                |                               
Single Core     | 547                           
Multi Core      | 1858
```

Performance was as expected, the J5040 isn't going to play the latest AAA title but it will be plenty for my use case. 

#### Timezone setup

We will configure our timezone to ensure correct date and time formats, run:

```sh
sudo nano /etc/timezone
```

Replace the value with your timezone like so:

```
TZ='Europe/Stockholm'
```

Save and exit. Now run the following, replacing `Europe/Stockholm` with your own timezone:

```sh
sudo ln -sf /usr/share/Europe/Stockholm /etc/localtime
```

Then run:

```sh
sudo dpkg-reconfigure -f noninteractive tzdata
```

Finally, check that the timezone is correct with:

```sh
timedatectl
```

#### Removing Ubuntu Pro messages

Canonical sometimes promote their [Ubuntu Pro](https://ubuntu.com/pro) service when you run `apt upgrade`. If you don't want these messages to appear, first remove the message templates:

```sh
sudo rm /var/lib/ubuntu-advantage/messages/*.tmpl
```

Then go to the messages.py file:

```sh
sudo nano /usr/lib/python3/dist-packages/uaclient/messages.py
```

Find and change `SS_LEARN_MORE` and `TRY_UBUNTU_PRO_BETA`:

```
SS_LEARN_MORE = "" 
TRY_UBUNTU_PRO_BETA = ""
```

Save and exit, reboot the server to properly apply the changes.

--------------------

</p>
</details>

## SSH

This section is about basic SSH, such as local network access and some best practices. I will expand on this in an upcoming section where we will configure SSH outside of our home network.

<details><summary>Click to expand</summary>
<p>

--------------------

### Prerequisite and local access

SSH is a protocol that allows remote login and command line execution, something that will be very convenient when we continue to set up the server. We will be using [OpenSSH](https://www.openssh.com/) as our SSH deamon, it usually comes shipped by default on both server and desktop Linux distributions. If you lack the deamon you can install it using the following two commands:

For your client:

```sh
sudo apt install openssh-client
```

For your server:

```sh
sudo apt install openssh-server
```

With OpenSSH installed on both the client and server, the next step is to connect to the server. Assuming you're on the same local network, run `ip a` on your server and take note of the local IP-address.

Now on the client, run:

```sh
ssh username@server-ip
```

Replace `username` and `server-ip` as appropriate. The terminal will prompt for a password and connect.

### Create a Hostname alias

Remembering `username@server-ip` is a hassle, so instead we will create an alias which will allow us to access the server by just running `ssh alias`. To get started, run this on the client:

```sh
sudo nano ~/.ssh/config
```

Paste the following, replacing `alias`, `server-ip` and `username` as appropriate:

```sh
Host alias
  Hostname server-ip
  Port 22
  User username
```

__NOTE__: The whitespace before `Hostname`, `Port` and `User` are __required__!

Save and exit, you should now be able to connect to your server by running `ssh alias`.

### Generate and use SSH-keys

On the client, run the following, replacing `comment` with some information to help you remember what the key is for:

```sh
ssh-keygen -t ed25519 -C "comment"
```

You will be prompted for a name, you can choose a name or accept the default `id_ed2559` by pressing enter. You will also be prompted for a passphrase, enter a passphrase or press enter to skip. A keypair will be created, one public key named `keyname.pub` and one private key named `keyname`. You can verify that they are there by running:

```sh
ls ~/.ssh -la
```

Now lets copy the __public__ key to our server. On the client, run: 

```sh
ssh-copy-id -i ~/.ssh/keyname.pub alias
```

Replacing `keyname` and `alias` with whatever you chose earlier. If you chose a passphrase you will be prompted for it before continuing.

Verify that the key works by connecting to the server with `ssh alias`. If the keys have been exchanged correctly you should __not__ be prompted for a password.

> __NOTE:__ Always keep your private key secure, __never__ share it with anyone! If you have reason to believe that your private key has been compromised, generate a new keypair and delete the old one from the servers `authorized_keys` file.

### Hardening

Now that we can connect to the server using our SSH-key, we will make some security enhancement. On your client, connect to the server and run:

```sh
sudo nano /etc/ssh/sshd_config
```

Look for the line with `PermitRootLogin`, uncomment and change it to `PermitRootLogin no`. Then search for `PasswordAuthentication`, uncomment and change it to `PasswordAuthentication no`.

Finally, find the line with `Port 22`, uncomment and change it to [another](https://serverfault.com/questions/509294/what-are-valid-ports-to-use-for-ssh) port of your choice. Save and exit. Remember to change the port number for your alias to reflect your choice.

> __WARNING:__ Do __NOT__ close the terminal window, if something was entered incorrectly in the configuration file you might lose SSH access to the server. Until we know everything works, ensure that you have atleast one other terminal instance running that is connected to the server.

Restart the SSH service by running:

```sh
sudo systemctl restart ssh
```

Verify that everything works by first trying to connect to the server with `ssh alias`, then try to access it using `ssh root@server-ip`.

If everything worked correctly, the server should now be accessible only by your SSH-key and noone should be able to log in as root. As we changed the port number from the default we gain some resistance against automated attacks, but a persistent actor could still find the correct port after some trial and error.

--------------------

</p>
</details>

## Perimeter security with Fail2Ban

[Fail2Ban](https://github.com/fail2ban/fail2ban) is a service that can watch log files and take action, such as banning IP-addresses that have multiple failed log-in attempts.

<details><summary>Click to expand</summary>
<p>

--------------------

### Inital setup

We want to detect and ban malicious behaviour towards our internet-exposed services, such as attempts to brute-force a password or DoS/DDoS attacks. For each service we will define a jail and filter, we will then have Fail2Ban watch the logs of that service and ban IPs that match said filter.

In contrast to our other services we will not be using Fail2Ban in a Docker container (_curious why? see_ [_here_](#issues-and-solutions) _for my experience_), we will instead install it directly on the OS. To get started, run:

```sh
sudo apt update && sudo apt install fail2ban
```

Start Fail2Ban with:

```sh
sudo fail2ban-client start
```

Make Fail2Ban run on start with:

```sh
sudo systemctl enable fail2ban
```

### Useful Fail2Ban commands

Unban yourself with:

```sh
sudo fail2ban-client unban [your ip]
```

Unban _everyone_ with:

```sh
sudo fail2ban-client unban --all
```

Check jail status:

```sh
sudo fail2ban-client status [jail name]
```

See if a filter will catch something in a logfile (_great for testing/debugging_):

```
fail2ban-regex [path to logfile] [path to filter] --print-all-matched
```

### Gotify

We will have Gotify notify us whenever an IP was banned and give us some more information about their attempts prior to said ban. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Fail2Ban and take note of the token.

Next we will create the `action.d` file that will trigger the message, run:

```sh
sudo nano /etc/fail2ban/action.d/gotify.conf
```

Paste the following, using your own URL and token:

```
[Definition]
actionban = curl "https://gotify.domain.tld/message?token=your_token_here" -F title="[Fail2Ban] <name>" -F message="Banned IP: <ip> Details: `grep '<ip>' <logpath>`" -F "priority=5"
```

Save and exit. Now add the `gotify` action to your jails like so:

```sh
sudo nano /etc/fail2ban/jail.d/sonarr.local
```

```
[sonarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = sonarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/sonarr/config/logs/sonarr.txt
action = iptables-allports[name=sonarr, chain=DOCKER-USER]
	 gotify
```

>NOTE: The indentation for actions are important, they should both share the same indentation depth.

Finish up by restarting Fail2Ban:

```sh
sudo systemctl restart fail2ban
```

</p>
</details>

## Docker

In this section we get started with [Docker](https://www.docker.com/) containers.

<details><summary>Click to expand</summary>
<p>

--------------------

### Initial setup

 Docker lets us set up containers to hold our services, making it easy to handle access and permissions. There are multiple ways to use Docker, we will be using the `compose` method which entails three steps:

1. Create a `docker-compose.yml` file
2. In the file, add any necessary parameters to make the service work (_these can often be pasted directly from the service's documentation_)
3. Launch the service with `sudo docker compose up -d`

To install the necessary Docker components I followed their [official documentation](https://docs.docker.com/engine/install/) which can be summarized below as:

Get the prerequisite with:

```sh
sudo apt update && sudo apt install ca-certificates curl gnupg lsb-release
```

Add Dockers official GPG with:

```sh
sudo mkdir -p /etc/apt/keyrings
```

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Now we can safely add the repository with:

```sh
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```

Install the Docker components by running: 

```sh
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Verify that everything is working by running:

```sh
sudo docker run hello-world
```

Finally, run the following to enable Docker to run on boot:

```sh
sudo systemctl enable docker
```

### Managing containers with ctop

For easy overview and management of our docker containers we can install [ctop](https://github.com/bcicen/ctop). To do it, run the commands below:

```sh
sudo apt install ca-certificates curl gnupg lsb-release
```

```sh
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list
```

```sh
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
```

> __GPG/Key Error?__ The key is most likely out of date, visit the [maintainer](https://packages.azlux.fr/) to find the current key.

```sh
sudo apt update && sudo apt install docker-ctop
```

Launch it with:

```sh
sudo ctop
```

--------------------

</p>
</details>

## NGINX Proxy Manager

[NGINX Proxy Manager](https://nginxproxymanager.com/) combines the true and tested reverse proxy [NGINX](https://www.nginx.com/) with an easy-to-use GUI and [Let's Encrypt](https://letsencrypt.org/) integration. 

<details><summary>Click to expand</summary>
<p>

### Aquire a domain

Up until this point we have only been able to access our server while on the same local network, to access it remotely we will utilize a custom domain. This method will make it easy to manage multiple services as we can use subdomains (_blog.domain.tld, server.domain.tld etc._).

To get a custom domain you will need to purchase it from a domain registrar. There are many domain registrars but I've gone with [Njalla](https://njal.la/) due to their great track record, privacy policy and [DMCA responses](https://njal.la/blog/dhlsucks/). Their pricing is somewhat higher than their competitors, so you might consider [namecheap](https://www.namecheap.com/) if you're looking for a more affordable option.

### Docker

To get started, lets create a Docker network. I named mine `boulder` but you can choose whatever name you like:

```sh
sudo docker network create boulder
```

Then, create a directory:

```sh
sudo mkdir /srv/nginx
```

Now create a `docker-compose.yml` file:

```sh
sudo nano /srv/nginx/docker-compose.yml
```

Paste the following:

```yml
version: "3"
services:
  nginx:
    image: jc21/nginx-proxy-manager:latest
    container_name: nginx
    ports:
      #<host-port>:<container-port>
      - 80:80 # Public HTTP Port
      - 443:443 # Public HTTPS Port
      - 81:81 # Admin Web Port
      - 8022:8022 # Custom SSH streaming port
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm     
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
    restart: always

networks:
  default:
    name: boulder
```

Save and exit. You should now be able to start NGINX proxy manager by running:

```sh
cd /srv/nginx && sudo docker compose up -d
```

It will take couple of seconds to set up. It might not return terminal control to you afterwards, in that case exit the process with `ctrl-z`. Check that everything is working by typing `[local-IP]:81` in your browser. Log in with the default email and password:

```
Email:    admin@example.com
Password: changeme
```

On your first log-in you will be prompted to change the username and password.

Now let's make a remotely accessible log-in page for our NGINX Proxy Manager. First you need to enable port forwarding on your router for port 80 and 443 by following the manual provided with your router, it usually involves visiting `[router-IP]` in your browser and logging in with admin credentials.

When you've configured port-forwarding you can go to the Proxy Hosts tab and add a new Proxy Host with something like this:

```
Domain names:           nginx.domain.tld
Scheme:                 http
Forward Hostname / IP:  [local-ip]
Forward Port:           81
Cache Assets:           No
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible
```

Press save and visit `nginx.domain.tld`, you should be greeted with a log-in page.

Now that we know that it works we will secure it with a SSL-certificate. Navigate to the `SSL Certificates` tab and add a new Let's Encrypt certificate with `Domain Names: nginx.domain.tld`. Test that the server is reachable by clicking on `Test Server Reachability`, agree to the privacy policy and save.

Now go back to your Proxy Host for `nginx.domain.tld` and click `Edit`, go to to SSL and add your certificate from the drop-down list. For added security, enable __Force SSL__ and __HSTS__. Finally, visit `nginx.domain.tld` and check that everything is working as expected.

For added security you can make an access list entry. Navigate to `Access Lists` and `Add Access List`, then configure access to fit your needs. For exposed services without a log-in page you might consider adding basic HTTP Authentication, which will prompt a visitor for credentials before even loading the page. For services that you only want to be accessible on your local network, consider adding you local network to the whitelist while denying all other connections.

When you've made an access list entry, navigate to a proxy host and change access from `Publicly Accessible` to `[access list entry]`.

### Stream port for remote SSH

First we need to decide on a port we will expose, look through the [list](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) and add a port-forwarding rule for that port in your router. Next, go to NPM and navigate to `Streams`, add a new stream with the following settings:

```
Incoming port:          [your new port]
Forward Hostname / IP:  [local-ip]
Forward Port:           [your local SSH port]
TCP Forwarding:         Yes
UDP Forwarding:         No
```
Save and exit. Now we need to add our new port in our `docker-compose.yml` for NGINX Proxy Manager. Run:

```sh
sudo nano /srv/npm/docker-compose.yml
```

Add the new port as such:

```yml
    ports:
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      - '[new port]:[new port]' # Remote SSH port
```

Save and exit. Now lets restart the container to apply the settings, you can either do this directly through `ctop` or with:

```sh
cd /srv/npm && sudo docker compose restart npm-app
```

Now we will create a new host entry in our SSH config file. On your client, run:

```sh
sudo nano ~/.ssh/config
```

Below your existing alias, add:

```
Host alias-remote
  Hostname ssh.domain.tld
  Port port
  User username
```

Save and exit. Now test that everything works by running:

```sh
ssh alias-remote
```

By deafult our remote connection will time out after a period of inactivity, to keep the connection alive we need to make an adjustment in our config file. On your server, run:

```sh
sudo nano /etc/ssh/sshd_config
```

Find, uncomment and change the values to:

```
TCPKeepAlive yes
ClientAliveInterval 600
ClientAliveCountMax 1
```

Save and exit. Restart the SSH service by running:

```sh
sudo systemctl restart ssh
```

The connection will now be kept alive for 600 seconds of inactivity, you can change this to your liking.

### Fail2Ban

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/npm.local
```

Paste:

```
[nginx]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = nginx
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/nginx/data/logs/proxy-host-1_access.log
action = iptables-allports[name=nginx, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/nginx.conf
```

Paste the following:

```
[Definition]
failregex = .*401 401 - POST.*\[Client <ADDR>\]
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/nginx/data/logs/proxy-host-1_access.log /etc/fail2ban/filter.d/nginx.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status nginx
```

</p>
</details>

## ddns-updater

We want our domain to point to our routers IP-address. This address, called a dynamic IP-address, will change over time and can cause our registrar to point the wrong way were it not updated. To solve this we will utilize [ddns-updater](https://github.com/qdm12/ddns-updater), which is a dynamic DNS service that will regularly check our public IP-address and convey any changes to Njalla.

<details><summary>Click to expand</summary>
<p>

To get started, log into Njalla (_or your registrar of choice_) and add a new DNS record to your domain. This new record should be __DYNAMIC__ and be named __*__, this will create a dynamic __wildcard__ domain. Njalla will provide us with the key we need to update the IP-address of the DNS record, if you're using another registrar they might have other ways of conveying IP-changes.

### Docker

We will create a directory in `/srv`:

```sh
sudo mkdir -p /srv/ddns-updater/data
```

We will then create a configuration file:

```sh
sudo nano /srv/ddns-updater/data/config.json
```

Now configure it according to the official ddns-updater [documentation](https://github.com/qdm12/ddns-updater/blob/master/docs/njalla.md), replacing domain, host and key with your own:

```json
{
  "settings": [
    {
      "provider": "njalla",
      "domain": "domain.tld",
      "host": "*",
      "key": "key",
      "ip_version": "ipv4",
      "provider_ip": true
    }
  ]
}
```

Save and exit. Now lets create a `docker-compose.yml` file:

```sh
sudo nano /srv/ddns-updater/docker-compose.yml
```

Paste the following:

```yml
version: "3.7"
services:
  ddns-updater:
    image: qmcgaw/ddns-updater
    container_name: ddns-updater
    ports:
      - 8000:8000
    volumes:
      - ./data:/updater/data
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
      - PERIOD=5m
      - UPDATE_COOLDOWN_PERIOD=5m
      - PUBLICIP_FETCHERS=all
      - PUBLICIP_HTTP_PROVIDERS=all
      - PUBLICIPV4_HTTP_PROVIDERS=all
      - PUBLICIPV6_HTTP_PROVIDERS=all
      - PUBLICIP_DNS_PROVIDERS=all
      - PUBLICIP_DNS_TIMEOUT=3s
      - HTTP_TIMEOUT=10s
      - LISTENING_PORT=8000
      - ROOT_URL=/
      - BACKUP_PERIOD=720h
      - BACKUP_DIRECTORY=/updater/data
      - LOG_LEVEL=info
      - LOG_CALLER=hidden
    restart: always

networks:
  default:
    name: boulder
```

Save and exit. Now it's time to configure permissions:

```sh
cd /srv/ddns-updater
```

```sh
sudo chown -R 1000 data && sudo chmod 700 data && sudo chmod 400 data/config.json
```

You should now be able to start ddns-updater by running:

```sh
cd /srv/ddns-updater && sudo docker compose up -d
```

### NGINX proxy Manager

Check that everything is working by visting `[local-IP]:8000` in your browser, you should see a `Success` message under `Update status`.

<details><summary>Didn't work?</summary>
<p>

--------------------

First, ensure that you are in `/srv/ddns-updater` and try again.

If that didn't fix it you might be looking at a permission error, double-check the directory/file permissions with `ls -la`.

If the problem still persist your best bet is to look at the logs. Run `sudo ctop` and take a look at the `ddns-updater` container.

--------------------

</p>
</details>

--------------------

</p>
</details>

</p>
</details>

## Notifications with Gotify

In this section I will implement [Gotify](https://gotify.net/), which is a self-hosted notification server.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

Start by making the directory structure:

```sh
sudo mkdir -p /srv/gotify/data
```

Then create a `docker-compose.yml` file:

```sh
sudo nano /srv/gotify/docker-compose.yml
```

Paste the following:

```yml
version: "3"
services:
  gotify:
    container_name: gotify
    image: gotify/server
    ports:
      - 1245:80
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
      - GOTIFY_DEFAULTUSER_NAME=admin
      - GOTIFY_DEFAULTUSER_PASS=admin
    volumes:
      - ./data:/app/data
    entrypoint: sh -c "/app/gotify-app 2>&1 | tee /app/data/gotify.log"
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit. Now run:

```sh
cd /srv/gotify && sudo docker compose up -d
```

Go to Web UI at `[local ip]:1245` and log in with the default credentials `admin, admin`, then go to `USERS → CREATE USER` and make your actual user. Finish up by deleting the default one.

Now go to NGINX Proxy Manager and make a Proxy Host Entry with SSL and websocket support, make sure that you can access Gotify on this adress before continuing.

### Fail2Ban

By default Gotify lets Docker handle its logs, to make it write to a file we need to add an entrypoint to the `docker-compose.yml` file like so:

```yml
version: "3"
services:
  gotify:
    container_name: gotify
    image: gotify/server
    entrypoint: sh -c "/app/gotify-app 2>&1 | tee /app/data/gotify.log"
    ...
```

Save, exit and restart the container. Gotify will now write logs to a `gotify.log` file in our `/data` folder. Next, make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/gotify.local
```

Paste:

```
[gotify]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = gotify
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/gotify/data/gotify.log
action = iptables-allports[name=gotify, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/gotify.conf
```

Paste the following:

```
[Definition]
failregex = ^.*\| 401 \|.*\| <ADDR> \|
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/gotify/data/gotify.log /etc/fail2ban/filter.d/gotify.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status gotify
```

### Homarr


### Finishing up

By default all notifications will use Gotify's own icon. To add a little flair, upload your own icons by clicking on the little upload icon to the left of the `Name` field.

![Gotify screenshot](https://github.com/Stylback/home-server/blob/main/media/gotify_screenshot.png?raw=true)

Gotify have an excellent android app which makes it significantly easier to keep track of notifications. You can find more information [here](https://github.com/gotify/android).

Finally, don't forget to add Gotify to Homarr and protect it with a Fail2Ban filter.

--------------------

</p>
</details>

## Automate updates with Watchtower

We will use [Watchtower](https://containrrr.dev/watchtower/) to automatically find and apply updates to our docker images. 

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

To get started, make a directory:

```sh
sudo mkdir /srv/watchtower
```

Now make a `docker-compose.yml` file:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Paste the following:

```yml
version: "3"
services:
  watchtower:
    container_name: watchtower
    image: containrrr/watchtower
    environment:
      - TZ=Europe/Stockholm
      - WATCHTOWER_INCLUDE_RESTARTING=true
      - WATCHTOWER_CLEANUP=true
      - WATCHTOWER_SCHEDULE=0 0 2 * * * # run daily at 2 am
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: always
    command: [container names]
```

Save and exit, now start Watchtower with:

```sh
cd /srv/watchtower && sudo docker compose up -d
```

If everything works as expected, Watchtower will check for new docker images every night at 02:00. If it finds any, it will download the image, stop the service, apply the new image, start tthe service and finally remove the old image.

### Gotify

We will have Gotify notify us whenever Watchtower updated a Docker image. Just like with Jellyseer it has native integration, as such we can just follow the [official](https://containrrr.dev/watchtower/notifications/) documentation.

To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Watchtower and take note of the token. Next, let us edit Watchtowers `docker-compose.yml` file:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the following lines to the `environment` list:

```yml
- WATCHTOWER_NOTIFICATIONS=gotify
- WATCHTOWER_NOTIFICATION_GOTIFY_URL=[your Gotify URL]
- WATCHTOWER_NOTIFICATION_GOTIFY_TOKEN=[your token]
- WATCHTOWER_NOTIFICATIONS_LEVEL=info
- WATCHTOWER_NO_STARTUP_MESSAGE=true
```

While you're at it, add Gotify to the `command` list. Save, exit and restart the container to apply the new settings.

--------------------

</p>
</details>

## Dashboard with Homarr

[Homarr](https://homarr.vercel.app/docs/about) is an easy to use dashboard that integrates well with *arr apps.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

First, lets create a `docker-compose.yml` and a directory to house it:

```sh
sudo mkdir /srv/homarr 
```

```sh
sudo nano /srv/homarr/docker-compose.yml 
```

Paste the following:

```yml
version: "3"
services:
  homarr:
    container_name: homarr
    image: ghcr.io/ajnart/homarr:latest
    ports:
      - 7575:7575
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./configs:/app/data/configs
      - ./icons:/app/public/icons
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit. You can now start it by running:

```sh
cd /srv/homarr && sudo docker compose up -d 
```

### NGINX proxy Manager

Now go to your NGINX Proxy Manager and add another Proxy Host with something like this:

```
Domain names:           homarr.domain.tld
Scheme:                 http
Forward Hostname / IP:  [local-ip]
Forward Port:           7575
Cache Assets:           No
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible
```

Save and check that Homarr is accessible at `homarr.domain.tld`, add a SSL-certificate for increased security.


### Fail2Ban



--------------------

</p>
</details>

## Multimedia streaming with Jellyfin

[Jellyfin](https://jellyfin.org/) is a free, open source and self-hosted multimedia streaming server.

<details><summary>Click to expand</summary>
<p>

--------------------

### Consistent directories

Before we set up Jellyfin we will make a clear and consistent directory-structure following TRaSH Guides [Hardlinks and Instant Moves](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/). We can create the whole structure with this one command:

```sh
sudo mkdir -p /srv/data/{torrents/{movies,music,tv},media/{movies,music,tv}}
```

Now configure directory permissions with:

```sh
sudo chown -R $USER:$USER /srv/data && sudo chmod -R a=,a+rX,u+w,g+w /srv/data
```

### Docker

We will be using [Hotios Jellyfin image](https://hotio.dev/containers/jellyfin/). Start by creating a directory:

```sh
sudo mkdir -p /srv/jellyfin/{config,cache}
```

Then make a docker compose file:

```sh
sudo nano /srv/jellyfin/docker-compose.yml
```

Paste the following:

```yml
version: "3.7"
services:
  jellyfin:
    container_name: jellyfin
    image: cr.hotio.dev/hotio/jellyfin
    ports:
      - 8096:8096
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - ./cache:/cache
      - /srv/data/media:/media
    devices:
      - /dev/dri:/dev/dri
    restart: unless-stopped
    
networks:
  default:
    name: boulder
```

Save and exit. You can now start it with:

```sh
cd /srv/jellyfin && sudo docker compose up -d
```

Wait a bit while everything is being prepared. When done, go to `[local IP]:8096` and follow the start-up guide. 

### NGINX proxy manager

When you've confirmed it's accessible it's time to create a NGINX proxy host:

```
Domain names:           jellyfin.domain.tld
Scheme:                 http
Forward Hostname / IP:  [local-ip]
Forward Port:           8096
Cache Assets:           No
Block Common Expolits:  Yes
Websocket Support:      Yes #required to make SyncPlay work
Access List:            Publicly Accessible
```

While you're at it, don't forget to request a SSL-certificate for `jellyfin.domain.tld`. Finally, visit it and make sure you can connect.

### Media transfer and streaming

Jellyfin is up and running but we still need to test media streaming. Load up a USB with some media-files and stick it into your server, check its label with:

```sh
lsblk
```

It should be something akin to `sdb1`, take note! Now make a directory and mount the USB to it:

```sh
sudo mkdir /media/external
```

```sh
sudo mount /dev/[label] /media/external
```

<details><summary>Is your USB LUKS encrypted?</summary>
<p>

--------------------

Then you need to unlock it before mounting:

```sh
sudo cryptsetup luksOpen /dev/[label] [volume name]
```

Choose a volume name for the USB and mount it:

```sh
sudo mount /dev/mapper/[volume name] /media/external
```

Remember, when you've unmounted the USB you also need to lock it:

```sh
sudo cryptsetup luksClose [volume name]
```

--------------------

</p>
</details>

Now we can copy the media-files from the USB to our media directory:

```sh
sudo rsync -ah --progress /media/external/[your media] /srv/data/media/[relevant folder]
```

Once your media-files are copied they will be automatically added to your Jellyfin library. This process might take a couple of minutes, if you want to force a new check you can do so in the settings. Once they are detected, try to stream them. When everything works as expected, remember to unmount the USB before unplugging it:

```sh
sudo umount /media/external
```

### Hardware acceleration

Our J0540 have extensive hardware support for different encoders thanks to Intel QuickSync. This will enable us to stream large media files at a lower bitrate, saving bandwidth at the cost of processing power. This process can either be done with software (_high CPU usage_) or hardware (_low CPU usage_). To enable the full range of hardware accelerated transcoding we will first need to enable the `guc` and `huc` firmware, as they are disabled by default for Intel processors of 10th generation and earlier. Start by making a `modprobe` config file:

```sh
sudo nano /etc/modprobe.d/i915.conf
```

To enable both `guc` and `huc`, paste the following:

```sh
options i915 enable_guc=3
```

Rebuild grub boot entry, this will only apply to the current kernel:

```sh
sudo update-initramfs -u
```

Check that it's enabled:

```sh
sudo -i
```

```sh
cat /sys/kernel/debug/dri/0/i915_capabilities
```

There should be an entry with `i915.enable_guc=3`.

Reboot the server. Now go to Jellyfin `Settings → Dashboard → Playback → Transcoding`. The following encode settings are supported on the J5040:

![Jellyfin encoding settings for the J5040](https://github.com/Stylback/home-server/blob/main/media/jellyfin_encoding.png?raw=true)

Finally, enable `Throttle Transcodes` at the bottom of the page and save.

### Customization

Jellyfin supports [custom CSS](https://jellyfin.org/docs/general/clients/css-customization.html), you can either create your own or import one from the community. I will be using the _Kaleidochromic_ preset from the [Ultrachromic](https://github.com/CTalvio/Ultrachromic) project combined with a tweak to hide `More Like This`:

```css
@import url('https://cdn.jsdelivr.net/gh/CTalvio/Ultrachromic/presets/kaleidochromic_preset.css');

/* Hide More Like This */
#similarCollapsible { display: none; }
```

The Custom CSS setting can be found at `Dashboard → General → Custom CSS`. I had to restart the Jellyfin container for the settings to take effect.

### Fail2Ban

There is an excellent but slightly outdated guide in Jellyfin's own [documentation](https://jellyfin.org/docs/general/networking/fail2ban.html). Below is a modified version that works:

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/jellyfin.local
```

Paste:

```
[jellyfin]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = jellyfin
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/jellyfin/config/log/*.log
action = iptables-allports[name=jellyfin, chain=DOCKER-USER]
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/jellyfin.conf
```

Paste:

```
[Definition]
failregex = ^.*Authentication request for .* has been denied \(IP: "<ADDR>"\)\.
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match a log with your filter:

```
fail2ban-regex /srv/jellyfin/config/log/log_20221022.log /etc/fail2ban/filter.d/jellyfin.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status jellyfin
```

### Homarr



--------------------

</p>
</details>

## Torrenting with qflood

[qflood](https://hotio.dev/containers/qflood/) is a Docker image from Hotio that combines [qBittorrent](https://github.com/qbittorrent/qbittorrent) and [Flood](https://github.com/jesec/flood) with easy Wireguard VPN integration.

<details><summary>Click to expand</summary>
<p>

--------------------

> NOTE: The BitTorrent protocol is a communcation protocol for peer-to-peer file sharing, it's an easy and accessible way for people to share their own or licensed works online. Before you contemplate downloading or sharing copyrighted content via the BitTorrent protocol, please check that those actions are not considered criminal by your local laws and regulations. I am not liabel in any way for your inability to use the BitTorrent protocol in accordance with said law.

### Wireguard

You will need a VPN provider for this section, I will be using [Mullvad](https://mullvad.net/en/) but there are [other](https://www.privacyguides.org/vpn/) options you might consider. Before setting up qflood we will install and configure Wireguard:

```sh
sudo apt update && sudo apt install openresolv wireguard
```

Go to your VPN-provider's website and get their Wireguard configuration. Now run:

```sh
sudo nano /etc/wireguard/wg0.conf
```

Paste the contents of your provider's Wireguard configuration and check that it's working by running:

```sh
wg-quick up wg0 && sudo wg show
```

Confirm that you have a connection, then disconnect with:

```sh
wg-quick down wg0
```

### Docker

Now we can install qflood, start by creating a directory:

```sh
sudo mkdir /srv/qflood
```

Then create a `docker-compose.yml` file:

```sh
sudo nano /srv/qflood/docker-compose.yml
```

Paste the following:

```yml
version: "3.7"
services:
  qflood:
    container_name: qflood
    image: cr.hotio.dev/hotio/qflood
    ports:
      - 8080:8080 #qbittorrent
      - 3000:3000 #flood
      - 8118:8118
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
      - VPN_ENABLED=true
      - VPN_LAN_NETWORK=[local IP]/24
      - VPN_CONF=wg0
      - VPN_ADDITIONAL_PORTS
      - VPN_IP_CHECK_DELAY=5
      - PRIVOXY_ENABLED=false
      - FLOOD_AUTH=false
    volumes:
      - /etc/wireguard:/config/wireguard
      - ./config:/config
      - /srv/data/torrents:/data/torrents
    cap_add:
      - NET_ADMIN
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv6.conf.all.disable_ipv6=0
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit. Now run:

```sh
cd /srv/qflood && sudo docker compose up -d
```

<details><summary>Did you get an IPv6_table error?</summary>
<p>

--------------------

It might be that there are no IPv6 tables on your server. To fix this we need to run:

```sh
sudo modprobe ip6table_filter
```

Followed by a container restart. This will however only fix the issue until the next reboot, to make it persistent you need to run:

```sh
echo "ip6table_filter" | sudo tee -a /etc/modules
```

Save and reboot, check the container status with `ctop` to see if it's working.

--------------------

</p>
</details>

Now visit qBittorrent's web UI at `[local IP]:8080` and log in with the default credentials:

```
Username: admin
Password: adminadmin
```

### qBittorrent settings

Next up is port forwarding. In Mullvad, go to your account and "Port Forwarding". Identify your server and add a port for it. In qBittorrent's Web UI, go to `Tools → Options → Connection → Listening Port` and change the default port to your forwarded port. Then launch `ctop`, select `qflood` and choose `exec shell`. Run the following two commands:

```sh
iptables -I INPUT -p tcp --dport [forwarded port] -j ACCEPT
```

```sh
curl https://ipv4.am.i.mullvad.net/port/[forwarded port]
```

It should return:

```sh
{"ip":"[Mullvad's IP]","port":[forwarded port],"reachable":true}/
```

Now that we know that port forwarding is working, let's do some `Options` tinkering in qBittorrent. These are some of the changes I made:

| Setting | Default | Set to | Reason |
| ------------- | ------------- |------------- |------------- |
| Default Torrent Management Mode | Manual | Automatic | Torrents are automatically transfered to the right directory depending on their category. |
| Peer connection protocol |  TCP and µTP | TCP | µTP is good for data congestion control but can throttle speeds. |
| Enable anonymous mode | Disable | Enable | Aims to prevent real IP-leakage while using a proxy or VPN. |
| Enable Local Peer Discovery | Enable | Disable | We have no other client on our LAN. |
| Seeding limits | Disable | When ratio reaches 1 or when time reaches 1440 minutes, Pause torrent | Introducing a limit means we can easily configure what happens after we are done with a torrent. A one-to-one ratio means we distribute as much as we downloaded. A lack of peers might however mean that we never reach our ratio, therefore we also have a 24 hour limit. |
| Global rate limits | Disable | 10000 KiB/s | About 80 Mbit/s. |
| Alternative Rate Limits | Disable | 1500 KiB/s | About 12 Mbit/s, a good limit to prevent daytime broadband shortage. |
| Schedule the use of alternative rate limits | Disable | 07:00 to 01:00, Every day | Will give us a our limited rate between 07:00 - 01:00 and our global rate between 01:00 - 07:00. |
| Username/Password | admin / adminadmin |  | Default credentials are a security hazard. |

Finally, let us change the default web UI to something darker. I prefer [Dracula](https://draculatheme.com/qbittorrent):

```sh
cd /srv/qflood/config && git clone https://github.com/dracula/qbittorrent.git
```

Now go to `Tools → Options → Web UI → Use alternative Web UI`, enable it and paste `/config/qbittorrent/webui`. Save, the new UI should load by itself.

### Flood settings

A recent version of qBittorrent broke Flood support, I will revisit this section when the issue has been resolved.

### Fail2Ban

First disable qbittorrents own ban-action by going to `Options → Web UI → Ban client after consecutive failures` and set it to `0`. Next, make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/qbittorrent.local
```

Paste:

```
[qbittorrent]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = qbittorrent
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/qflood/config/data/logs/qbittorrent.log
action = iptables-allports[name=qbittorrent, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/qbittorrent.conf
```

Paste the following:

```
[Definition]
failregex = \(W\).*WebAPI login failure. Reason: invalid credentials.*::ffff:<ADDR>
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/qflood/config/data/logs/qbittorrent.log /etc/fail2ban/filter.d/qbittorrent.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status qbittorrent
```

### Homarr

--------------------

</p>
</details>

## Indexers with Prowlarr

[Prowlarr](https://github.com/Prowlarr/Prowlarr/) is an indexer manager that integrates with other *arr-apps. 

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

We will be using [hotio's](https://hotio.dev/containers/prowlarr/) Docker image, get started by making the directory structure:

```sh
sudo mkdir -p /srv/prowlarr/config
```

Make a `docker-compose.yml` file:

```sh
sudo nano /srv/prowlarr/docker-compose.yml
```

Paste the following:

```yml                              
version: "3.7"
services:
  prowlarr:
    container_name: prowlarr
    image: cr.hotio.dev/hotio/prowlarr
    ports:
      - 9696:9696
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/prowlarr && sudo docker compose up -d
```

Visit Prowlarr's web ui at `[local ip]:9696` and configure it. Add indexers, there are a [huge](https://wiki.servarr.com/prowlarr/supported-indexers) list to choose from. 

### NGINX Proxy Manager

Finish up by creating a Proxy Host entry in NGINX and adding the app to Homarr.

### Fail2Ban

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/prowlarr.local
```

Paste:

```
[prowlarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = prowlarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/prowlarr/config/logs/prowlarr.txt
action = iptables-allports[name=prowlarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/prowlarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/prowlarr/config/logs/prowlarr.txt /etc/fail2ban/filter.d/prowlarr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status prowlarr
```

### Homarr

--------------------

</p>
</details>

## Movies with Radarr

[Radarr](https://radarr.video/) is a a movie collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

We will be using [hotio's](https://hotio.dev/containers/radarr/) Docker image, start by making the directory structure:

```sh
sudo mkdir -p /srv/radarr/config
```

Make a `docker-compose.yml` file:

```sh
sudo nano /srv/radarr/docker-compose.yml
```

Paste the following:

```yml
version: "3.7"
services:
  radarr:
    container_name: radarr
    image: cr.hotio.dev/hotio/radarr
    ports:
      - 7878:7878
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - /srv/data:/data
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/radarr && sudo docker compose up -d
```

Now visit Radarr's web-ui at `[local ip]:7878` and configure it to your liking. 

### NGINX proxy Manager

Finish up by creating a Proxy Host entry in NGINX, adding the app to Homarr and integrating the app in Prowlarr.

### Fail2Ban

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/radarr.local
```

Paste:

```
[radarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = radarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/radarr/config/logs/radarr.txt
action = iptables-allports[name=radarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/radarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/radarr/config/logs/radarr.txt /etc/fail2ban/filter.d/radarr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status radarr
```

### Homarr

--------------------

</p>
</details>

## Series with Sonarr

[Sonarr](https://sonarr.tv/) is a a series collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

We will be using [hotio's](https://hotio.dev/containers/sonarr/) Docker image, start by making the directory structure:

```sh
sudo mkdir -p /srv/sonarr/config
```

Make a `docker-compose.yml` file:

```sh
sudo nano /srv/sonarr/docker-compose.yml
```

Paste the following:

```yml
version: "3.7"
services:
  sonarr:
    container_name: sonarr
    image: cr.hotio.dev/hotio/sonarr
    ports:
      - 8989:8989
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - /srv/data:/data
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/sonarr && sudo docker compose up -d
```

Now visit Sonarr's web-ui at `[local ip]:8989` and configure it. 

### NGINX Proxy Manager

Finish up by creating a Proxy Host entry in NGINX, adding the app to Homarr and integrating the app in Prowlarr.

### Fail2ban

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/sonarr.local
```

Paste:

```
[sonarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = sonarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/sonarr/config/logs/sonarr.txt
action = iptables-allports[name=sonarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/sonarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/sonarr/config/logs/sonarr.txt /etc/fail2ban/filter.d/sonarr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status sonarr
```

### Homarr

--------------------

</p>
</details>

## Subtitles with Bazarr

[Bazarr](https://www.bazarr.media/) is a subtitle downloader and manager, it integrates natively with Radarr and Sonnar.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

We will be using [hotio's](https://hotio.dev/containers/bazarr/) Docker image, get started by making the directory structure:

```sh
sudo mkdir -p /srv/bazarr/config
```

Now make a `docker-compose.yml` file:

```sh
sudo nano /srv/bazarr/docker-compose.yml
```

Paste the following:

```yml                              
version: "3.7"
services:
  bazarr:
    container_name: bazarr
    image: cr.hotio.dev/hotio/bazarr
    ports:
      - 6767:6767
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - /srv/data:/data
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/bazarr && sudo docker compose up -d
```

Now visit Bazarr's web-ui at `[local ip]:6767`. Start by making a language profile and add subtitle providers, then connect to Radarr and Sonarr. 

### NGINX proxy Manager

When you know everything works as intended, finish up by creating a Proxy Host entry in NGINX and adding the app to Homarr. For security, remember to add an authentication method.

--------------------

</p>
</details>

## Request shows and movies with Jellyseerr

[Jellyseerr](https://hub.docker.com/r/fallenbagel/jellyseerr) is a request manager for Jellyfin. It allows us and our users to discover and request shows and movies.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

Start by making the directory structure:

```sh
sudo mkdir -p /srv/jellyseerr/config
```

Make a `docker-compose.yml` file:

```sh
sudo nano /srv/jellyseerr/docker-compose.yml
```

Paste the following:

```yml                              
version: "3"
services:
    jellyseerr:
       container_name: jellyseerr
       image: fallenbagel/jellyseerr:latest
       ports:
            - 5055:5055
       environment:
            - PUID=1000
            - PGID=1000
            - UMASK=002
            - TZ=Europe/Stockholm
       volumes:
            - ./config:/app/config
            - /srv/data:/data
       restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/jellyseerr && sudo docker compose up -d
```

Now visit Jellyseerr's web-ui at `[local ip]:5055`. Log in using your Jellyfin account and follow the start-up guide.

### NGINX Proxy Manager

Finish up by creating a Proxy Host entry in NGINX

### Homarr

adding the app to Homarr.

### Gotify

We will have Gotify send us a notification whenever a user makes a media request or if there is an issue in the request process. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Jellyseerr and take note of the token.

Jellyseerr have native Gotify integration, as such we can simply enable it in the settings. Go to `Settings → Notifications → Gotify`, enable the agent and enter your URL and application token. Next, choose what kind of notifications you want and save.

### Fail2Ban

First you need to enable proxy support in Jellyseerr. Navigate to `Settings → Enable Proxy Support`, enable it and restart Jellyseerr. Now make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/jellyseerr.local
```

Paste:

```
[jellyseerr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = jellyseerr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/jellyseerr/config/logs/overseerr.log
action = iptables-allports[name=jellyseerr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/jellyseerr.conf
```

We will use a modified version of the official [Overseerr](https://docs.overseerr.dev/extending-overseerr/fail2ban) Fail2Ban-filter, paste the following:

```
[Definition]
failregex = .*\[info\]\[Auth\]\: Failed login attempt.*"ip":"<ADDR>"
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/jellyseerr/config/logs/overseerr.log /etc/fail2ban/filter.d/jellyseerr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status jellyseerr
```

--------------------

</p>
</details>

## Music with Lidarr

[Lidarr](https://lidarr.audio/) is a music collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker

We will be using [hotio's](https://hotio.dev/containers/lidarr/) docker image, start by making the directory structure:

```sh
sudo mkdir -p /srv/lidarr/config
```

Make a docker-compose.yml file:

```sh
sudo nano /srv/lidarr/docker-compose.yml
```

Paste the following:

```yml
version: "3.7"
services:
  sonarr:
    container_name: sonarr
    image: cr.hotio.dev/hotio/lidarr
    ports:
      - 8686:8686
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - /srv/data:/data
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/lidarr && sudo docker compose up -d
```

Now visit lidarr's web-ui at `[local ip]:8686` and configure it. 

### NGINX proxy Manager

Finish up by creating a Proxy Host entry in NGINX, adding the app to Homarr and integrating the app in prowlarr.

### Fail2Ban

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/lidarr.local
```

Paste:

```
[lidarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = lidarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/lidarr/config/logs/Lidarr.txt
action = iptables-allports[name=lidarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/lidarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2Ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/lidarr/config/logs/Lidarr.txt /etc/fail2ban/filter.d/lidarr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status lidarr
```

### Homarr

--------------------

</p>
</details>

## Issues and solutions

Sometimes things doesn't go as planned and you have to rethink an implementation, here are some of the lessons I've learned.

<details><summary>Click to expand</summary>
<p>

--------------------

### Motherboard

> __TL;DR:__ Initially made the build with a Biostar J4105NHU, a BIOS-update broke RAM-support and trying to revert back to the previously known working version bricked it.

I initially used a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013), the motherboard shipped with BIOS-version __J41BW929.BSS__ and worked flawlessly with a pair of 8GB RAM-modules.

A couple of days go by and I shut the system down to do some cable-management, after which it refused to boot. I figured I messed something up and put everything back as it was, no luck.

I removed one of the RAM-modules and tried again, nothing.

Finally I popped the CMOS battery out, waited a bit and re-placed it. This seemed to have done the job as I was greeted with a login prompt. I shut it down and re-placed the other RAM-module, nothing happens.

I pop the CMOS again, boot with a single module and see the BIOS-version was updated to __J41BWB22.BSS__. Determined to regain the ability to use both modules I tried to flash the __J41BW929.BSS__ version using Biostars provided flashing tool. The tool reported a successfull flash but the process had in fact _bricked_ the motherboard.

Lesson learned, think thrice before manually flashing your BIOS. I have since replaced the board with an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp). I also had to replace my RAM-modules with SO-DIMM ones due to board incompatibility.

### ddns-updater

> __TL;DR:__ Multiple keys for Njalla was not supported for ddns-updater so I've switched to a wildcard domain with a single key.

My initial idea was to manually add subdomains in Njallas dashboard and then use the provided key to update its DNS-record with ddns-updater. It turned out that ddns-updater does not support multiple keys for Njalla, after an hour or two of research I decided to try a wildcard domain instead which would use the same key for all my subdomains. It was successful and has actually made subdomains easier to manage as I can just add them via NGINX Proxy Manager.

This only works as I have all my services on the same local network, if I for example also had a VPS off-site I would not be able to update both my its and my local servers DNS-record with this method.

### Containerized Fail2Ban

> __TL;DR:__ Containarized Fail2Ban didn't work so I've switched to running it directly on the OS.

I initially tried to run Fail2Ban in a docker container to streamline deployment. I managed to get the filter and jail working but not banning. Fail2Ban would correctly detect authentication fails and "ban" the associated IP address. However this "ban" would in reality not result in denied connections and the client could continue with authentication attempts. There seemed to be no clear way to propagate the banned addresses up the IP-tables chain and block connections.

I have now resorted to running it on the server itself and it's able to stop connections from banned IP addresses to _most_ of my services, some services such as Homarr does not log authentication attempts and as such Fail2Ban has nothing tangible to go on.

--------------------

</p>
</details>

## License and usage

- Any resource I link, cite or otherwise refer to are subject to their respective licenses.
- Any image used is my own and are subject to All Rights Reserved.
- Everything else in this project is licensed under the terms of the [MIT license](https://mit-license.org/).

## To-Do

This section contains my To-Do list.

<details><summary>Click to expand</summary>
<p>

--------------------

| Item | Details | Status |
| ------------- | ------------- | ------------- |
| [Static Web Server](https://sws.joseluisq.net/) | A static webpage server, will also implement [Image hotlink protection](https://www.smarthomebeginner.com/image-hotlink-protection-nginx/) and [Umami](https://github.com/umami-software/umami). | Working on html/css-website to serve. |
| Data backup solution | Regular backups with [Restic](https://restic.net/) or [Borgmatic](https://torsion.org/borgmatic/). | Will try to snag an extra SSD during a sale to use as a dedicated backup drive. |
| DoS/DDoS protection | Implement DoS/DDoS protection for NGINX | Researching. |
| Security audit | Check HTTP Security headers, do some port knocking. | Not yet started. |
| Implement qflood | qflood support was broken on a recent qBittorrent version, have yet to implement it. | Waiting on qBittorrent to push a fix. |
| Implement [Password pusher](https://github.com/pglombardo/PasswordPusher) | Easy way to share passwords securily. | Not yet started. |
| New hardware photos | Take new photos for the hardware section to include the fan upgrade. | Waiting on next hardware upgrade. |
| [Planar ally](https://github.com/Kruptein/PlanarAlly) | Webtool for TTRPG:s, might be fun for game nights. | Not yet started, low priority. |

--------------------

</p>
</details>

**[Back to top](#)**