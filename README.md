<p align="center"><img src="https://github.com/Stylback/home-server/blob/main/media/dashboard.png?raw=true" alt="Dashboard screenshot"/></p>

## About

This project is all about my home server, here I document my implementations step-by-step so that I may more easily reproduce them at a later date. 

I could've not started my journey towards self-hosting were it not for the open source community, as such my documentation is and will always be open for others to read and learn from. If you're looking to use this documentation in one of your own projects, private or commercial, please see the [license and usage](#license-and-usage) section for more information.

Do you have a question? Create an [issue](https://github.com/Stylback/home-server/issues) with the `question` tag and I will answer it to the best of my ability.

Got feedback or suggestions? I would love to hear it, please create an [issue](https://github.com/Stylback/home-server/issues) with the `suggestion` tag and we can take it from there.

## Table of contents

*__NOTE:__ Hyperlinks for subsections will not work if that section is collapsed.*

<details><summary>Click to expand</summary>
<p>

--------------------

- [About](#about)
- [Table of contents](#table-of-contents)
- [Hardware choices](#hardware-choices)
  - [CPU / Motherboard](#cpu--motherboard)
  - [Power supply (PSU)](#power-supply-psu)
  - [Case and fan](#case-and-fan)
  - [System memory (RAM)](#system-memory-ram)
  - [Storage](#storage)
  - [Final build costs](#final-build-costs)
- [Assembly and initial setup](#assembly-and-initial-setup)
  - [Assembly](#assembly)
  - [RAM stability](#ram-stability)
  - [Tweaking the BIOS](#tweaking-the-bios)
  - [Installing Ubuntu](#installing-ubuntu)
  - [Benchmark](#benchmark)
  - [Timezone setup](#timezone-setup)
  - [Remove Ubuntu Pro messages](#remove-ubuntu-pro-messages)
- [Secure Shell (SSH)](#secure-shell-ssh)
  - [Prerequisite and local access](#prerequisite-and-local-access)
  - [Hostname aliases](#hostname-aliases)
  - [Generate and use SSH-keys](#generate-and-use-ssh-keys)
  - [Security enhancements](#security-enhancements)
  - [Remote SSH access](#remote-ssh-access)
- [Perimeter security with Fail2ban](#perimeter-security-with-fail2ban)
  - [Inital setup](#inital-setup)
  - [Useful Fail2ban commands](#useful-fail2ban-commands)
  - [Integrate with Gotify](#integrate-with-gotify)
- [Application containers with Docker](#application-containers-with-docker)
  - [Initial setup](#initial-setup)
  - [Managing containers with ctop](#managing-containers-with-ctop)
- [Automatic updates with Watchtower](#automatic-updates-with-watchtower)
  - [Docker setup](#docker-setup)
  - [Integrate with Gotify](#integrate-with-gotify-1)
- [Dynamic DNS with ddns-updater](#dynamic-dns-with-ddns-updater)
  - [Docker setup](#docker-setup-1)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager)
  - [Protect with Fail2ban](#protect-with-fail2ban)
  - [Integrate with Homarr](#integrate-with-homarr)
  - [Integrate with Watchtower](#integrate-with-watchtower)
- [Nginx Proxy Manager](#nginx-proxy-manager)
  - [Aquire a domain](#aquire-a-domain)
  - [Docker setup](#docker-setup-2)
  - [Protect with Fail2ban](#protect-with-fail2ban-1)
  - [Integrate with Homarr](#integrate-with-homarr-1)
  - [Integrate with Watchtower](#integrate-with-watchtower-1)
- [Notifications with Gotify](#notifications-with-gotify)
  - [Docker setup](#docker-setup-3)
  - [Customization](#customization)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-1)
  - [Protect with Fail2ban](#protect-with-fail2ban-2)
  - [Integrate with Homarr](#integrate-with-homarr-2)
  - [Integrate with Watchtower](#integrate-with-watchtower-2)
- [Dashboard with Homarr](#dashboard-with-homarr)
  - [Docker setup](#docker-setup-4)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-2)
  - [Protect with Fail2ban](#protect-with-fail2ban-3)
  - [Integrate with Watchtower](#integrate-with-watchtower-3)
- [Multimedia streaming with Jellyfin](#multimedia-streaming-with-jellyfin)
  - [Consistent directories](#consistent-directories)
  - [Docker setup](#docker-setup-5)
  - [Media transfer and streaming](#media-transfer-and-streaming)
  - [Hardware acceleration](#hardware-acceleration)
  - [Customization](#customization-1)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-3)
  - [Protect with Fail2ban](#protect-with-fail2ban-4)
  - [Integrate with Homarr](#integrate-with-homarr-3)
  - [Integrate with Watchtower](#integrate-with-watchtower-4)
- [Torrenting with qflood](#torrenting-with-qflood)
  - [Wireguard](#wireguard)
  - [Docker setup](#docker-setup-6)
  - [qBittorrent settings](#qbittorrent-settings)
  - [Flood settings](#flood-settings)
  - [Protect with Fail2ban](#protect-with-fail2ban-5)
  - [Integrate with Homarr](#integrate-with-homarr-4)
  - [Integrate with Watchtower](#integrate-with-watchtower-5)
- [Indexers with Prowlarr](#indexers-with-prowlarr)
  - [Docker setup](#docker-setup-7)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-4)
  - [Protect with Fail2ban](#protect-with-fail2ban-6)
  - [Integrate with Homarr](#integrate-with-homarr-5)
  - [Integrate with Watchtower](#integrate-with-watchtower-6)
- [Movies with Radarr](#movies-with-radarr)
  - [Docker setup](#docker-setup-8)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-5)
  - [Protect with Fail2ban](#protect-with-fail2ban-7)
  - [Integrate with Homarr](#integrate-with-homarr-6)
  - [Integrate with Watchtower](#integrate-with-watchtower-7)
- [TV-shows with Sonarr](#tv-shows-with-sonarr)
  - [Docker setup](#docker-setup-9)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-6)
  - [Protect with Fail2ban](#protect-with-fail2ban-8)
  - [Integrate with Homarr](#integrate-with-homarr-7)
  - [Integrate with Watchtower](#integrate-with-watchtower-8)
- [Subtitles with Bazarr](#subtitles-with-bazarr)
  - [Docker setup](#docker-setup-10)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-7)
  - [Protect with Fail2ban](#protect-with-fail2ban-9)
  - [Integrate with Homarr](#integrate-with-homarr-8)
  - [Integrate with Watchtower](#integrate-with-watchtower-9)
- [Request media with Jellyseerr](#request-media-with-jellyseerr)
  - [Docker setup](#docker-setup-11)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-8)
  - [Protect with Fail2ban](#protect-with-fail2ban-10)
  - [Integrate with Homarr](#integrate-with-homarr-9)
  - [Integrate with Watchtower](#integrate-with-watchtower-10)
  - [Integrate with Gotify](#integrate-with-gotify-2)
- [Music with Lidarr](#music-with-lidarr)
  - [Docker setup](#docker-setup-12)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-9)
  - [Protect with Fail2ban](#protect-with-fail2ban-11)
  - [Integrate with Homarr](#integrate-with-homarr-10)
  - [Integrate with Watchtower](#integrate-with-watchtower-11)
- [Vitrual tabletop with PlanarAlly](#vitrual-tabletop-with-planarally)
  - [Docker setup](#docker-setup-13)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-10)
  - [Protect with Fail2ban](#protect-with-fail2ban-12)
  - [Integrate with Homarr](#integrate-with-homarr-11)
  - [Integrate with Watchtower](#integrate-with-watchtower-12)
- [Secure password sharing with PasswordPusher](#secure-password-sharing-with-passwordpusher)
  - [Docker setup](#docker-setup-14)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-11)
  - [Authentication](#authentication)
  - [Integrate with Watchtower](#integrate-with-watchtower-13)
- [Notes with Joplin](#notes-with-joplin)
  - [Docker setup](#docker-setup-15)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-12)
  - [Configuration](#configuration)
  - [Integrate with Homarr](#integrate-with-homarr-12)
  - [Integrate with Watchtower](#integrate-with-watchtower-14)
- [RSS feeds with FreshRSS](#rss-feeds-with-freshrss)
  - [Docker setup](#docker-setup-16)
    - [Clients](#clients)
    - [Fetch full articles](#fetch-full-articles)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-13)
  - [Integrate with Homarr](#integrate-with-homarr-13)
  - [Integrate with Watchtower](#integrate-with-watchtower-15)
- [Ebooks with Calibre-Web](#ebooks-with-calibre-web)
  - [Make a Calibre database](#make-a-calibre-database)
  - [Docker setup](#docker-setup-17)
    - [Enable uploads](#enable-uploads)
  - [Add to Nginx proxy Manager](#add-to-nginx-proxy-manager-14)
  - [Enable Kobo integration](#enable-kobo-integration)
  - [Protect with Fail2ban](#protect-with-fail2ban-13)
  - [Integrate with Homarr](#integrate-with-homarr-14)
  - [Integrate with Watchtower](#integrate-with-watchtower-16)
- [Issues and solutions](#issues-and-solutions)
  - [Motherboard](#motherboard)
  - [ddns-updater](#ddns-updater)
  - [Fail2ban](#fail2ban)
  - [PasswordPusher](#passwordpusher)
  - [Nginx Proxy Manager stream](#nginx-proxy-manager-stream)
- [License and usage](#license-and-usage)

--------------------

</p>
</details>

## Hardware choices

My reasoning behind the hardware I use.

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

The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes; discreet and affordable with some room for expandability. I wasn't fully satisfied with the noise level of the included rear-mounted 120mm fan so I replaced it with a [Noctua NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln).

### System memory (RAM)

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

My experience putting the hardware together and verifying that everything works as it should.

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

### RAM stability

Before installing the operating system I wanted to ensure that my RAM modules would not cause any system instability. MemTest86 is an industry staple in this regard, it has a multitude of tests designed to coax RAM instability under extreme conditions.

I made a bootable USB following their [instructions](https://www.memtest86.com/tech_creating-linux-mac.html) and ran the standard configuration (_13 tests, 4 passes_).

| Image | Note |
|:---|:---|
| ![Ram modules detected by MemTest86](https://github.com/Stylback/home-server/blob/main/media/memtest86_ram.bmp?raw=true) | Both sticks of RAM was detected by MemTest86. |
| ![Test completion screen](https://github.com/Stylback/home-server/blob/main/media/memtest86_pass.jpg?raw=true) | The sticks passed with 0 errors, completing the tests in 4 hours and 37 minutes. |

### Tweaking the BIOS

The ASRock J5040-ITX comes with an extensive list of BIOS settings, so far I've made the following changes:

| Setting | Default | Set to | Reason |
| ------------- | ------------- |------------- |------------- |
| SATA Aggressive Link Power Management | Disable | Enable | Reduces power consumption while SATA devices are idle. |
| Onboard HD Audio | Enable | Disable | Audio will be handled client-side. |
| Deep S5 | Disable | Auto | Reduces power consumption while the system is turned off. |
| Restore on AC/Power | Loss Power Off | Loss Power On | Restarts the system after a power failure. |

### Installing Ubuntu

After confirming RAM stability I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. It was a pain-free process thanks to [extensive](https://ubuntu.com/server/docs) documentation.

I assigned the 250GB drive as boot drive, consuming about half of its available storage. The rest was partitioned and mounted to `/home` for any application or service that needs to store data there. As the 2TB drive is going to be used as the primary storage unit it was partioned and mounted at `/srv`.

### Benchmark

After creating a user and logging in for the first time, update the system with:

```sh
sudo apt update && sudo apt upgrade
```

Afterwards, run the benchmarking script [YABS](https://github.com/masonr/yet-another-bench-script):

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

### Timezone setup

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

### Remove Ubuntu Pro messages

Canonical sometimes promote their [Ubuntu Pro](https://ubuntu.com/pro) service when you run `apt upgrade`. If you don't want these messages to appear, first run:

```sh
pro config set apt_news=false
```

Then remove the message templates:

```sh
sudo rm /var/lib/ubuntu-advantage/messages/*.tmpl
```

Then go to the `messages.py` file:

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

## Secure Shell (SSH)

SSH is a protocol that allows remote login and command line execution, something that will be very convenient when we continue to set up the server.

<details><summary>Click to expand</summary>
<p>

--------------------

### Prerequisite and local access

We will be using [OpenSSH](https://www.openssh.com/) as our SSH deamon, it usually comes shipped by default on both server and desktop Linux distributions. If you lack the deamon you can install it using the following two commands:

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

### Hostname aliases

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

### Security enhancements

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

### Remote SSH access

>NOTE: At this point you might not yet have [Nginx Proxy Manager](#nginx-proxy-manager) set up. If that's the case, skip this section for now.

First we need to decide on a port we will expose, look through the [list](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) and add a port-forwarding rule for that port in your router, I chose `8022`. Next, go to Nginx Proxy Manager and navigate to `Streams`, add a new stream with the following settings:

```
Incoming port:          8022
Forward Hostname / IP:  [local-ip]
Forward Port:           [your local SSH port]
TCP Forwarding:         Yes
UDP Forwarding:         No
```

Save and exit. Now we need to add our new port in our `docker-compose.yml` for Nginx Proxy Manager. Run:

```sh
sudo nano /srv/nginx/docker-compose.yml
```

Add the new port as such:

```yml
    ports:
      - 80:80 # Public HTTP Port
      - 443:443 # Public HTTPS Port
      - 81:81 # Admin Web Port
      - 8022:8022 # Remote SSH port
```

Save and exit. Rebuild the container with:

```sh
cd /srv/nginx && sudo docker compose up -d --build
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

By default our remote connection will time out after a period of inactivity, to keep the connection alive we need to make an adjustment in our config file. On your server, run:

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

--------------------

</p>
</details>

## Perimeter security with Fail2ban

[Fail2ban](https://github.com/fail2ban/fail2ban) is a service that can watch log files and take action, such as banning IP-addresses that have multiple failed log-in attempts.

<details><summary>Click to expand</summary>
<p>

--------------------

### Inital setup

We want to detect and ban malicious behaviour towards our internet-exposed services, such as attempts to brute-force a password or DoS/DDoS attacks. For each service we will define a jail and filter, we will then have Fail2ban watch the logs of that service and ban IPs that match said filter.

In contrast to our other services we will not be using Fail2ban in a Docker container (_curious why? see_ [_here_](#issues-and-solutions) _for my experience_), we will instead install it directly on the OS. To get started, run:

```sh
sudo apt update && sudo apt install fail2ban
```

Start Fail2ban with:

```sh
sudo fail2ban-client start
```

Make Fail2ban run on start with:

```sh
sudo systemctl enable fail2ban
```

### Useful Fail2ban commands

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

### Integrate with Gotify

>NOTE: At this point you might not yet have [Gotify](#notifications-with-gotify) set up. If that's the case, skip this section for now.

We will have Gotify notify us whenever an IP was banned and give us some more information about their attempts prior to said ban. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Fail2ban and take note of the token.

Next we will create the `action.d` file that will trigger the message, run:

```sh
sudo nano /etc/fail2ban/action.d/gotify.conf
```

Paste the following, using your own URL and token:

```
[Definition]
actionban = curl "https://gotify.domain.tld/message?token=your_token_here" -F title="[Fail2ban] <name>" -F message="Banned IP: <ip> Details: `grep '<ip>' <logpath>`" -F "priority=5"
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

Finish up by restarting Fail2ban:

```sh
sudo systemctl restart fail2ban
```

--------------------

</p>
</details>

## Application containers with Docker

[Docker](https://www.docker.com/) lets us set up containers to hold our services and applications, streamlining deployment.

<details><summary>Click to expand</summary>
<p>

--------------------

### Initial setup

There are multiple ways to use Docker, we will be using the `compose` method which entails three steps:

1. Create a `docker-compose.yml` file
2. In the file, add any necessary parameters to make the service work
3. Build the Docker image with `sudo docker compose up -d`

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

For easy overview and management of our Docker containers we can install [ctop](https://github.com/bcicen/ctop). To do it, run the commands below:

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

## Automatic updates with Watchtower

[Watchtower](https://containrrr.dev/watchtower/) is a service that can automatically find and apply updates to docker images.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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
    command: watchtower

networks:
  default:
    name: boulder
```

Save and exit, now start Watchtower with:

```sh
cd /srv/watchtower && sudo docker compose up -d
```

If everything works as expected, Watchtower will check for new docker images every night at 02:00. If it finds any, it will download the image, stop the service, apply the new image, start tthe service and finally remove the old image.

### Integrate with Gotify

>NOTE: At this point you might not yet have [Gotify](#notifications-with-gotify) set up. If that's the case, skip this section for now.

We will have Gotify notify us whenever Watchtower updated a Docker image. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Watchtower and take note of the token. Next, let us edit Watchtowers `docker-compose.yml` file:

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

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Dynamic DNS with ddns-updater

[ddns-updater](https://github.com/qdm12/ddns-updater) is a dynamic DNS service that will regularly check our public IP-address and convey any changes to our registrar.

<details><summary>Click to expand</summary>
<p>

--------------------

To get started, log into Njalla (_or your registrar of choice_) and add a new DNS record to your domain. This new record should be __DYNAMIC__ and be named __*__, this will create a dynamic __wildcard__ domain. Njalla will provide us with the key we need to update the IP-address of the DNS record, if you're using another registrar they might have other ways of conveying IP-changes.

### Docker setup

Create the directory structure:

```sh
sudo mkdir -p /srv/ddns-updater/data
```

Create a configuration file:

```sh
sudo nano /srv/ddns-updater/data/config.json
```

Now configure it according to the official ddns-updater [documentation](https://github.com/qdm12/ddns-updater/blob/master/docs/njalla.md), replacing domain and key with your own:

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

Check that everything is working by visting `[local-IP]:8000` in your browser, you should see a `Success` message under `Update status`.

### Add to Nginx proxy Manager

>NOTE: At this point you might not yet have [Nginx proxy Manager](#nginx-proxy-manager) set up. If that's the case, skip this section for now.

Go to Nginx Proxy Manager and make a new Access List:

```
DETAILS
Name:                   ddns-updater
Satisfy Any:            Yes
Pass Auth to Host:      No

AUTHORIZATION
Username:               pick_a_username
Password:               pick_a_password

ACCESS
Allow:                  -
Deny:                   all
```

Next, make a new Proxy Host Entry:

```
DETAILS
Domain names:           ddns.domain.tld
Scheme:                 http
Forward Hostname / IP:  ddns-updater
Forward Port:           8000
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            ddns-updater

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `ddns.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

First identify Nginx's `proxy-host_access.log` for ddns-updater:

```sh
grep -rnw '/srv/nginx/data/logs' -e 'ddns-updater'
```

In my case it was `proxy-host-1_access.log`. Now make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/ddns.local
```

Paste:

```
[ddns]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = ddns
maxretry = 4
bantime = -1
findtime = 86400
logpath = /srv/nginx/data/logs/proxy-host-1_access.log
action = iptables-allports[name=ddns, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/ddns.conf
```

Paste the following:

```
[Definition]
failregex = .*- - 401 - GET https .*\[Client <ADDR>\]
```

Restart Fail2ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/nginx/data/logs/proxy-host-1_access.log /etc/fail2ban/filter.d/ddns.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status ddns
```

### Integrate with Homarr

>NOTE: At this point you might not yet have [Homarr](#dashboard-with-homarr) set up. If that's the case, skip this section for now.

Go to Homarr and click `Add a service`:

```
Service name:           ddns-updater
Icon URL:               https://raw.githubusercontent.com/qdm12/ddns-updater/master/readme/ddnsgopher.svg
Service URL:            http://x.x.x.x:8000
On Click URL:           https://ddns.domain.tld
Service type:           Other
Category:               Network
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] ddns-updater
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Nginx Proxy Manager

[Nginx Proxy Manager](https://nginxproxymanager.com/) combines the true and tested reverse proxy [Nginx](https://www.nginx.com/) with an easy-to-use GUI. It also makes SSL certificates easy with [Let's Encrypt](https://letsencrypt.org/) integration.

<details><summary>Click to expand</summary>
<p>

--------------------

### Aquire a domain

Up until this point we have only been able to access our server while on the same local network, to access it remotely we will utilize a custom domain.

To get a custom domain you will need to purchase it from a domain registrar. There are plenty of domain registrars but I've gone with [Njalla](https://njal.la/) due to their great track record and privacy policy. Their pricing is somewhat higher than their competitors, so you might consider [namecheap](https://www.namecheap.com/) if you're looking for an affordable alternative.

### Docker setup

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

Save and exit. You should now be able to start Nginx proxy manager by running:

```sh
cd /srv/nginx && sudo docker compose up -d
```

It will take couple of seconds to set up. It might not return terminal control to you afterwards, in that case exit the process with `ctrl-z`. Check that everything is working by typing `[local-IP]:81` in your browser. Log in with the default email and password:

```
Email:    admin@example.com
Password: changeme
```

On your first log-in you will be prompted to change the username and password.

Now let's make a remotely accessible log-in page for our Nginx Proxy Manager. First you need to enable port forwarding on your router for port `80` and `443` by following the manual provided with your router. When you've configured port-forwarding you can go to the Proxy Hosts tab and add a new Proxy Host with something like this:

```
DETAILS
Domain names:           nginx.domain.tld
Scheme:                 http
Forward Hostname / IP:  nginx
Forward Port:           81
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `nginx.domain.tld`, you should be greeted with a log-in page. Now go to `NPM → Settings → Default site →  Edit` and change it from `Congratulations Page` to `404 page`.

### Protect with Fail2ban

First identify Nginx's `proxy-host_access.log` for Nginx Proxy Manager:

```sh
grep -rnw '/srv/nginx/data/logs' -e 'nginx.'
```

In my case it was `proxy-host-2_access.log`. Now make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/nginx.local
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
logpath = /srv/nginx/data/logs/proxy-host-2_access.log
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

Restart Fail2ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/nginx/data/logs/proxy-host-2_access.log /etc/fail2ban/filter.d/nginx.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status nginx
```



### Integrate with Homarr

>NOTE: At this point you might not yet have [Homarr](#dashboard-with-homarr) set up. If that's the case, skip this section for now.

Go to Homarr and click `Add a service`:

```
Service name:           Nginx Proxy Manager
Icon URL:               https://nginxproxymanager.com/icon.png
Service URL:            http://x.x.x.x:81
On Click URL:           https://nginx.domain.tld
Service type:           Other
Category:               Network
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] nginx
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Notifications with Gotify

[Gotify](https://gotify.net/) is a self-hosted notification server, which will be used to alert us of important server events.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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

### Customization

By default all notifications will use Gotify's own icon. To add a little flair, upload your own icons by clicking on the little upload icon to the left of the `Name` field.

![Gotify screenshot](https://github.com/Stylback/home-server/blob/main/media/gotify_screenshot.png?raw=true)

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           gotify.domain.tld
Scheme:                 http
Forward Hostname / IP:  gotify
Forward Port:           80
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `gotify.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

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

Save and exit. Rebuild the container with:

```sh
cd /srv/gotify && sudo docker compose up -d --build
```

Gotify will now write logs to a `gotify.log` file in our `/data` folder. Next, make a `.local` file:

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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

>NOTE: At this point you might not yet have [Homarr](#dashboard-with-homarr) set up. If that's the case, skip this section for now.

Go to Homarr and click `Add a service`:

```
Service name:           Gotify
Icon URL:               https://raw.githubusercontent.com/Sonarr/Sonarr/develop/Logo/128.png
Service URL:            http://x.x.x.x:1245
On Click URL:           https://gotify.domain.tld
Service type:           Other
Category:               Other
API key:                xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] gotify
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Dashboard with Homarr

[Homarr](https://homarr.vercel.app/docs/about) is an easy to use dashboard that integrates well with *arr apps.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

Make the directory structure:

```sh
sudo mkdir /srv/homarr 
```

Make a `docker-compose.yml` file:

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

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Access List:

```
DETAILS
Name:                   Homarr
Satisfy Any:            Yes
Pass Auth to Host:      No

AUTHORIZATION
Username:               pick_a_username
Password:               pick_a_password

ACCESS
Allow:                  -
Deny:                   all
```

Next, make a new Proxy Host Entry:

```
DETAILS
Domain names:           dashboard.domain.tld
Scheme:                 http
Forward Hostname / IP:  homarr
Forward Port:           7575
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Homarr

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `dashboard.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

First identify Nginx's `proxy-host_access.log` for Homarr:

```sh
grep -rnw '/srv/nginx/data/logs' -e 'homarr'
```

In my case it was `proxy-host-3_access.log`. Now make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/homarr.local
```

Paste:

```
[homarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = homarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/nginx/data/logs/proxy-host-3_access.log
action = iptables-allports[name=homarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/homarr.conf
```

Paste the following:

```
[Definition]
failregex = .*- 401 401 - POST https .*\[Client <ADDR>\]
```

Restart Fail2ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/nginx/data/logs/proxy-host-3_access.log /etc/fail2ban/filter.d/homarr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status homarr
```

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] homarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Multimedia streaming with Jellyfin

[Jellyfin](https://jellyfin.org/) is a self-hosted multimedia streaming server.

<details><summary>Click to expand</summary>
<p>

--------------------

### Consistent directories

Before we set up Jellyfin we will make a clear and consistent directory-structure following TRaSH Guides [Hardlinks and Instant Moves](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/). We can create the whole structure with this one command:

```sh
sudo mkdir -p /srv/data/{torrents/{books,movies,music,tv},media/{books,movies,music,tv}}
```

Now configure directory permissions with:

```sh
sudo chown -R $USER:$USER /srv/data && sudo chmod -R a=,a+rX,u+w,g+w /srv/data
```

### Docker setup

We will be using [Hotios Jellyfin image](https://hotio.dev/containers/jellyfin/). Start by creating the directory:

```sh
sudo mkdir /srv/jellyfin
```

Then make a `docker-compose.yml` file:

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

Our J5040 have extensive hardware support for different encoders thanks to Intel QuickSync. This will enable us to stream large media files at a lower bitrate, saving bandwidth at the cost of processing power. This process can either be done with software (_high CPU usage_) or hardware (_low CPU usage_). To enable the full range of hardware accelerated transcoding we will first need to enable the `guc` and `huc` firmware, as they are disabled by default for Intel processors of 10th generation and earlier. Start by making a `modprobe` config file:

```sh
sudo nano /etc/modprobe.d/i915.conf
```

To enable both `guc` and `huc`, paste the following:

```sh
options i915 enable_guc=3
```

Rebuild grub boot entry:

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

Reboot the server. Now go to Jellyfin `Settings → Dashboard → Playback → Transcoding`. The following encode settings are supported by the J5040:

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

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           stream.domain.tld
Scheme:                 http
Forward Hostname / IP:  jellyfin
Forward Port:           8096
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      Yes
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `stream.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

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
         gotify
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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           Jellyfin
Icon URL:               https://raw.githubusercontent.com/jellyfin/jellyfin/master/Emby.Dlna/Images/logo240.png
Service URL:            http://x.x.x.x:8096
On Click URL:           https://stream.domain.tld
Service type:           Other
Category:               Media
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] jellyfin
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

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

### Docker setup

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

It might be that there are no IPv6 tables on your server. To fix this, run:

```sh
sudo modprobe ip6table_filter
```

Rebuild the container with:

```sh
cd /srv/qflood && sudo docker compose up -d --build
```

This will however only fix the issue until the next reboot, to make it persistent you need to run:

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

### Protect with Fail2ban

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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           qBittorrent
Icon URL:               https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/New_qBittorrent_Logo.svg/240px-New_qBittorrent_Logo.svg.png
Service URL:            http://x.x.x.x:8080
On Click URL:           http://x.x.x.x:8080
Service type:           qBittorrent
Category:               Media
Username:               xxxxxxxx
Password:               xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] qflood
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Indexers with Prowlarr

[Prowlarr](https://github.com/Prowlarr/Prowlarr/) is an indexer manager that integrates with other *arr-apps. 

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           prowlarr.domain.tld
Scheme:                 http
Forward Hostname / IP:  prowlarr
Forward Port:           9696
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `prowlarr.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

First go to Prowlarr and get your API key, then go to Homarr and click `Add a service`:

```
Service name:           Prowlarr
Icon URL:               https://raw.githubusercontent.com/Prowlarr/Prowlarr/develop/Logo/128.png
Service URL:            http://x.x.x.x:9696
On Click URL:           https://prowlarr.domain.tld
Service type:           Other
Category:               Media
API key:                xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] prowlarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Movies with Radarr

[Radarr](https://radarr.video/) is a a movie collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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

Now visit Radarr's web-ui at `[local ip]:7878` and configure it. 

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           radarr.domain.tld
Scheme:                 http
Forward Hostname / IP:  radarr
Forward Port:           7878
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `radarr.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

First go to Radarr and get your API key, then go to Homarr and click `Add a service`:

```
Service name:           Radarr
Icon URL:               https://raw.githubusercontent.com/Radarr/Radarr/develop/Logo/128.png
Service URL:            http://x.x.x.x:7878
On Click URL:           https://radarr.domain.tld
Service type:           Radarr
Category:               Media
API key:                xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] radarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## TV-shows with Sonarr

[Sonarr](https://sonarr.tv/) is a a TV-shows and series collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           sonarr.domain.tld
Scheme:                 http
Forward Hostname / IP:  sonarr
Forward Port:           8989
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `sonarr.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

First go to Sonarr and get your API key, then go to Homarr and click `Add a service`:

```
Service name:           Sonarr
Icon URL:               https://raw.githubusercontent.com/Sonarr/Sonarr/develop/Logo/128.png
Service URL:            http://x.x.x.x:8989
On Click URL:           https://sonarr.domain.tld
Service type:           Sonarr
Category:               Media
API key:                xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] sonarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Subtitles with Bazarr

[Bazarr](https://www.bazarr.media/) is a subtitle downloader and manager, it integrates natively with Radarr and Sonnar.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Access List:

```
DETAILS
Name:                   bazarr
Satisfy Any:            Yes
Pass Auth to Host:      No

AUTHORIZATION
Username:               pick_a_username
Password:               pick_a_password

ACCESS
Allow:                  -
Deny:                   all
```

Next, make a new Proxy Host Entry:

```
DETAILS
Domain names:           bazarr.domain.tld
Scheme:                 http
Forward Hostname / IP:  bazarr
Forward Port:           6767
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            bazarr

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `bazarr.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

First identify Nginx's `proxy-host_access.log` for Bazarr:

```sh
grep -rnw '/srv/nginx/data/logs' -e 'bazarr'
```

In my case it was `proxy-host-8_access.log`. Now make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/bazarr.local
```

Paste:

```
[bazarr]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = bazarr
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/nginx/data/logs/proxy-host-8_access.log
action = iptables-allports[name=bazarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/bazarr.conf
```

Paste the following:

```
[Definition]
failregex = .*- - 401 - GET https .*\[Client <ADDR>\]
```

Restart Fail2ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/nginx/data/logs/proxy-host-8_access.log /etc/fail2ban/filter.d/bazarr.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status bazarr
```

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           Bazarr
Icon URL:               https://raw.githubusercontent.com/bazarr/bazarr.github.io/master/assets/img/logo.png
Service URL:            http://x.x.x.x:6767
On Click URL:           https://bazarr.domain.tld
Service type:           Other
Category:               Media
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] bazarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Request media with Jellyseerr

[Jellyseerr](https://hub.docker.com/r/fallenbagel/jellyseerr) is a request manager for Jellyfin, it allows us and other users to discover and request media.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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


### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           request.domain.tld
Scheme:                 http
Forward Hostname / IP:  jellyseerr
Forward Port:           5055
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `request.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

First you need to enable proxy support in Jellyseerr. Navigate to `Settings → Enable Proxy Support`, enable it and rebuild the container:

```sh
cd /srv/jellyseerr && sudo docker compose up -d --build
```

Now make a `.local` file:

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

Paste the following:

```
[Definition]
failregex = .*\[info\]\[Auth\]\: Failed login attempt.*"ip":"<ADDR>"
```

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

First go to Jellyseerr and get your API key, then go to Homarr and click `Add a service`:

```
Service name:           Jellyseerr
Icon URL:               https://raw.githubusercontent.com/Fallenbagel/jellyseerr/develop/public/os_logo_filled.png
Service URL:            http://x.x.x.x:5055
On Click URL:           https://request.domain.tld
Service type:           Jellyseerr
Category:               Media
API key:                xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] jellyseerr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

### Integrate with Gotify

We will have Gotify send us a notification whenever a user makes a media request or if there is an issue in the request process. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Jellyseerr and take note of the token.

Jellyseerr have native Gotify integration, as such we can simply enable it in the settings. Go to `Settings → Notifications → Gotify`, enable the agent and enter your URL and application token. Next, choose what kind of notifications you want and save.

--------------------

</p>
</details>

## Music with Lidarr

[Lidarr](https://lidarr.audio/) is a music collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

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

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           lidarr.domain.tld
Scheme:                 http
Forward Hostname / IP:  lidarr
Forward Port:           8686
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `lidarr.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

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

Restart Fail2ban to apply the new settings:

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

### Integrate with Homarr

First go to Lidarr and get your API key, then go to Homarr and click `Add a service`:

```
Service name:           Lidarr
Icon URL:               https://raw.githubusercontent.com/Lidarr/Lidarr/develop/Logo/128.png
Service URL:            http://x.x.x.x:8686
On Click URL:           https://lidarr.domain.tld
Service type:           Lidarr
Category:               Media
API key:                xxxxxxxx
```

Click `Save service`, now go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] lidarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Vitrual tabletop with PlanarAlly

[PlanarAlly](https://www.planarally.io/) is a virtual tabletop tool for games like Dungeons & Dragons.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

First make the directory structure:

```sh
sudo mkdir /srv/planarally/{assets,data}
```

Make a `docker-compose.yml` file:

```sh
sudo nano /srv/planarally/docker-compose.yml
```

Paste:

```yml
version: "3"
services:
  planarally:
      container_name: planarally
      image: kruptein/planarally:latest
      ports:
          - 8010:8000
      environment:
          - PUID=1000
          - PGID=1000
          - UMASK=002
          - TZ=Europe/Stockholm
      volumes:
          - ./data:/planarally/data/
          - ./assets:/planarally/static/assets/
          - type: bind
            source: ./server_config.cfg
            target: /planarally/server_config.cfg
            read_only: true
      restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit. Configure directory access:

```sh
cd /srv/planarally && sudo chown -R 9000 assets && sudo chown -R 9000 data
```

Make the `server_config.cfg` file:

```sh
sudo nano /srv/planarally/server_config.cfg
```

Full options can be found [here](https://github.com/Kruptein/PlanarAlly/blob/dev/Dockerfiles/server_config_docker.cfg), now paste:

```
[Webserver]
host = 0.0.0.0
port = 8000
# socket = /tmp/planarally.sock
ssl = false
ssl_fullchain = cert/fullchain.pem
ssl_privkey = cert/privkey.pem
# cors_allowed_origins = *
max_upload_size_in_bytes = 10_485_760

[General]
save_file = data/planar.sqlite
#assets_directory = 
#public_name = 
max_log_size_in_bytes = 2000
max_log_backups = 5
allow_signups = true
enable_export = true

[APIserver]
# The API server is an administration server on which some API calls can be made.
enabled = false
host = 127.0.0.1
port = 8001
# socket = /tmp/planarally.sock
ssl = false
ssl_fullchain = cert/fullchain.pem
ssl_privkey = cert/privkey.pem
# cors_allowed_origins = *
```

Save and exit. Build the image:

```sh
cd /srv/planarally && sudo docker compose up -d
```

Now visit PlanarAlly's web-ui at `[local ip]:8010` and make a user.

### Add to Nginx proxy Manager

Go to Nginx Proxy Manager and make a new Access List:

```
DETAILS
Name:                   PlanarAlly
Satisfy Any:            Yes
Pass Auth to Host:      No

AUTHORIZATION
Username:               pick_a_username
Password:               pick_a_password

ACCESS
Allow:                  -
Deny:                   all
```

Next, make a new Proxy Host Entry:

```
DETAILS
Domain names:           planar.domain.tld
Scheme:                 http
Forward Hostname / IP:  planarally
Forward Port:           8010
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      Yes
Access List:            PlanarAlly

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `planar.domain.tld` to make sure everything works as intended.

### Protect with Fail2ban

First identify Nginx's `proxy-host_access.log` for PlanarAlly:

```sh
grep -rnw '/srv/nginx/data/logs' -e 'planar'
```

In my case it was `proxy-host-12_access.log`. Now make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/planarally.local
```

Paste:

```
[planarally]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = planarally
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/nginx/data/logs/proxy-host-12_access.log
action = iptables-allports[name=planarally, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/planarally.conf
```

Paste the following:

```
[Definition]
failregex = .*- - 401 - GET https .*\[Client <ADDR>\]
```

Restart Fail2ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /srv/nginx/data/logs/proxy-host-12_access.log /etc/fail2ban/filter.d/planarally.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status planarally
```

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           PlanarAlly
Icon URL:               https://www.planarally.io/logos/pa-logo-background.svg
Service URL:            http://x.x.x.x:8010
On Click URL:           https://planar.domain.tld
Service type:           Other
Category:               Other
```

Click `Save service`, then go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] planarally
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Secure password sharing with PasswordPusher

[PasswordPusher](https://github.com/pglombardo/PasswordPusher) is a simple and secure way to share a password online.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

Make the directory structure:

```sh
sudo mkdir /srv/passwordpusher
```

Visit PasswordPushers [helper tool](https://pwpush.com/pages/generate_key) and take note of your custom `PWPUSH_MASTER_KEY` encryption key. Next, make a `docker-compose.yml` file:

```sh
sudo nano /srv/passwordpusher/docker-compose.yml
```

Paste:

```yml
version: "2.1"
services:
  passwordpusher:
      container_name: passwordpusher
      image: pglombardo/pwpush-ephemeral:release
      ports:
          - 5100:5100
      environment:
          - PUID=1000
          - PGID=1000
          - UMASK=002
          - TZ=Europe/Stockholm
          - PWPUSH_MASTER_KEY=xxxxxx
          - PWP__EXPIRE_AFTER_VIEWS_DEFAULT=3
          - PWP__ENABLE_DELETABLE_PUSHES=true
          - PWP__RETRIEVAL_STEP_DEFAULT=true
          - PWP__BRAND__TITLE=PasswordPusher
          - PWP__BRAND__TAGLINE=
          - PWP__BRAND__SHOW_FOOTER_MENU=false
          - PWP__THROTTLING__DAILY=100
      restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/passwordpusher && sudo docker compose up -d
```

Now you can visit PasswordPushers web-ui at `[local ip]:5100`.

### Add to Nginx proxy Manager

Make a new Proxy Host Entry:

```
DETAILS
Domain names:           push.domain.tld
Scheme:                 http
Forward Hostname / IP:  passwordpusher
Forward Port:           5100
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `push.domain.tld` to make sure everything works as intended.

### Authentication

Please see the PasswordPusher section under [issues and solutions](#issues-and-solutions).

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] passwordpusher
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Notes with Joplin

[Joplin](https://joplinapp.org) is a note-taking application with extensive features such as markdown support, cross-device synchronisation and end-to-end encryption.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

We will use the official [Joplin server image](https://hub.docker.com/r/joplin/server). Start by making the directory structure:

```sh
sudo mkdir /srv/joplin
```

Make the `docker-compose.yml` file:

```sh
sudo nano /srv/joplin/docker-compose.yml
```

Paste this modified [docker compose template](https://github.com/laurent22/joplin/blob/dev/docker-compose.server.yml):

```yml
version: "3"
services:
    joplin:
        container_name: joplin
        image: joplin/server:latest
        ports:
            - 22300:22300
        environment:
            - PUID=1000
            - PGID=1000
            - UMASK=002
            - TZ=Europe/Stockholm
            - APP_PORT=22300
            - APP_BASE_URL=http://joplin.domain.tld
            - DB_CLIENT=pg
            - POSTGRES_PASSWORD=joplin
            - POSTGRES_DATABASE=joplin
            - POSTGRES_USER=joplin
            - POSTGRES_PORT=5432
            - POSTGRES_HOST=joplin-db
        restart: unless-stopped
        depends_on:
            - joplin-db

    joplin-db:
        container_name: joplin-db
        image: postgres:15
        ports:
            - 5432:5432
        environment:
            - PUID=1000
            - PGID=1000
            - UMASK=002
            - TZ=Europe/Stockholm
            - POSTGRES_PASSWORD=joplin
            - POSTGRES_USER=joplin
            - POSTGRES_DB=joplin
        volumes:
            - ./data/postgres:/var/lib/postgresql/data
        restart: unless-stopped

networks:
  default:
    name: boulder

```

Save and exit, run:

```sh
cd /srv/joplin && sudo docker compose up -d
```

Before you can access Joplin's admin dashboard you'll have to add a Nginx proxy host, if you try to access it directly on `localhost:22300` you will be met with an error: `Invalid origin: http://x.x.x.x:22300`.

### Add to Nginx proxy Manager

Make a new Proxy Host Entry:

```
DETAILS
Domain names:           joplin.domain.tld
Scheme:                 http
Forward Hostname / IP:  joplin
Forward Port:           22300
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `joplin.domain.tld` to make sure everything works as intended.

### Configuration

Visit the admin dashboard at `https://joplin.domain.tld` and log in with default credentials:

```
Username: admin@localhost
Password: admin
```

Start off by going to `Admin → Users → Admin` and change the admin password, then create a user for yourself. Next, download the [client](https://joplinapp.org/help/#installation) on your desktop and/or mobile device.

On your client, go to `Tools → options → Synchronisation` and choose `Joplin server` from the dropdown menu. Fill out the rest of the forms with your credentials, take care to enter the full URL as so: `https://joplin.domain.tld`. Press the `Check synchronisation configuarion` to make sure everything works before applying the settings.

Next, go to `Tools → options → Encryption` and enable end-to-end encryption. Finally, go to `Tools → options → Note` and disable `Save geo-location with notes`.

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           Joplin
Icon URL:               https://raw.githubusercontent.com/laurent22/joplin/dev/Assets/LinuxIcons/256x256.png
Service URL:            https://joplin.domain.tld
On Click URL:           https://joplin.domain.tld
Service type:           Other
Category:               Other
```

Click `Save service`, then go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container names like so:

```yml
    ...
    command: watchtower [other containers] joplin joplin-db
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## RSS feeds with FreshRSS

[FreshRSS](https://freshrss.org/) is a self hosted feed aggregator with support for both RSS feeds and web scraping. In addition, FreshRSS's API is supported by many third party clients, making it accessible no matter what device you use.

<details><summary>Click to expand</summary>
<p>

--------------------

### Docker setup

We will use the [official Docker image](https://github.com/FreshRSS/FreshRSS/tree/edge/Docker), start by making the directory structure:

```sh
sudo mkdir /srv/freshrss
```

Then make the `docker-compose.yml` file:

```sh
sudo nano /srv/freshrss/docker-compose.yml
```

Paste:

```yml
version: "2.4"
services:
  freshrss:
    container_name: freshrss
      image: freshrss/freshrss
      ports:
        - 8088:80
      environment:
        - PUID=1000
        - PGID=1000
        - UMASK=002
        - TZ=Europe/Stockholm
        - CRON_MIN=0,30
      volumes:
        - ./data:/var/www/FreshRSS/data
        - ./extensions:/var/www/FreshRSS/extensions
      restart: unless-stopped
      logging:
        options:
          max-size: 10m

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/freshrss && sudo docker compose up -d
```

Visit `x.x.x.x:8088` and follow the installation guide.

#### Clients

To access our feed outside of the web UI we need a third-party client with FreshRSS support, we also need to enable API access. Go to `Configure → Authentication → Allow API access` and enable it, then go to `Configure → Profile → API Management` and enter an API password.

Next, download one of the [third-party clients](https://github.com/FreshRSS/FreshRSS/blob/edge/README.md#apis--native-apps) and log in using your username and API password.

#### Fetch full articles

Some feeds will not serve you the full article by default, instead often asking you to visit the full site after the first paragraph. If you don't like this type of interaction you can instead opt for the `Article CSS selector` tool. 

To start, visit the feed that serves you truncated articles, right click anywhere on the page and choose `Inspect`. In the menu, try to identify the HTML/CSS-class that contains the article. Common classes are `article`, `article_section` and `article-body`. When you have identified the class, click on the options icon next to the feed and go to `Manage → Article CSS selector on original website`. Paste the classname in the box starting with a dot like so: `.article_section`. Press the little eye next to the box to get a preview.

You can extend this to exclude certain classes as well, such as a comment section at the end of an article. Just add the relevant class to the `CSS selector of the elements to remove` option.

### Add to Nginx proxy Manager

Make a new Proxy Host Entry:

```
DETAILS
Domain names:           rss.domain.tld
Scheme:                 http
Forward Hostname / IP:  freshrss
Forward Port:           80
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `rss.domain.tld` to make sure everything works as intended.

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           FreshRSS
Icon URL:               https://raw.githubusercontent.com/FreshRSS/FreshRSS/18a4ade32f01fe615674efc864eb01ca826ce65e/p/themes/icons/icon.svg
Service URL:            http://x.x.x.x:8088
On Click URL:           https://rss.domain.tld
Service type:           Other
Category:               Media
```

Click `Save service`, then go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] freshrss
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Ebooks with Calibre-Web

[Calibre-Web](https://github.com/janeczku/calibre-web) is an eBook library manager. It supports uploading and downloading eBooks, keeps track of reading progress and can sync with supported devices such as Kobo eReaders.

<details><summary>Click to expand</summary>
<p>

--------------------

### Make a Calibre database

Before we can start with Calibre-Web we need to aquire a Calibre database-file. You could download such a file online, but it's generally safer and easier to make one yourself. Download and install the regular [desktop version of Calibre](https://calibre-ebook.com/download) and complete the initial setup, a `metadata.db` file will be made as a part of this. Navigate to the folder containing the file (*by default  `/'Calibre Library'`*) and copy it to your server with:

```sh
rsync metadata.db [server ssh alias]:/srv/data/media/books 
```

When you're done you can simply uninstall the Calibre desktop application.

### Docker setup

We will be using the [LinuxServer.io image](https://github.com/linuxserver/docker-calibre-web). To get started, make the directory structure:

```sh
sudo mkdir /srv/calibre
```

Then make the `docker-compose.yml` file:

```sh
sudo nano /srv/calibre/docker-compose.yml
```

```yml
version: "2.1"
services:
  calibre-web:
    image: lscr.io/linuxserver/calibre-web:latest
    container_name: calibre-web
    ports:
      - 8083:8083
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
      - DOCKER_MODS=linuxserver/mods:universal-calibre # Enables ebook conversion
    volumes:
      - ./config:/config
      - /srv/data/media/books:/books
    restart: unless-stopped

networks:
  default:
    name: boulder
```

Save and exit, start it with:

```sh
cd /srv/calibre && sudo docker compose up -d
```

Visit the web-ui at `localhost:8083` and log in using the default credentials:

```
Username: admin
Password: admin123
```

On the initial setup screen, enter `/books` as your Calibre library location. Your next priority should be to change the credentials of the admin user to something safe.

#### Enable uploads

The ability to upload books to the server is not enabled by default. To enable it, go to `Admin → Edit Basic Configuration → Feature Configuration → Enable Uploads`, check it and save. You then also have to enable it on a per-user basis.

### Add to Nginx proxy Manager

Make a new Proxy Host Entry:

```
DETAILS
Domain names:           calibre.domain.tld
Scheme:                 http
Forward Hostname / IP:  calibre-web
Forward Port:           8083
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        Request a New SSL Certificate
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and visit `calibre.domain.tld` to make sure everything works as intended.

### Enable Kobo integration

If you have an eReader from Kobo you can modify it to sync with Calibre-Web, keeping your library and reading progress synced across devices.

First, go to `Admin → Edit Basic Configuration → Feature Configuration → Enable Kobo sync` , check it and save. Next, make a sync-link by going to `Admin → Users → Your user → Kobo Sync Token → Create/View`

Now connect your Kobo eReader to your computer and navigate to its `Kobo eReader.conf` file under `.kobo/Kobo`. Nano into it and find the line `api_endpoint=https://storeapi.kobo.com` under the `[OneStoreServices]` group (*if it does not exist, make it*). Replace `https://storeapi.kobo.com` with the sync token you made earlier: `api_endpoint=[your kobo sync token]`. Save and exit. Unplug your eReader.

### Protect with Fail2ban

First make a `.local` file:

```sh
sudo nano /etc/fail2ban/jail.d/calibre.local
```

Paste:

```
[calibre]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = calibre
maxretry = 3
bantime = -1
findtime = 86400
logpath = /srv/calibre/config/calibre-web.log
action = iptables-allports[name=calibre, chain=DOCKER-USER]
         gotify
```

Save and exit. Now make a `.conf` file:

```sh
sudo nano /etc/fail2ban/filter.d/calibre.conf
```

Paste:

```
[Definition]
failregex = ^.*WARN.* Login failed for user.* IP-address: <ADDR>
```

Restart Fail2ban to apply the new settings:

```sh
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match a log with your filter:

```
fail2ban-regex /srv/calibre/config/calibre-web.log /etc/fail2ban/filter.d/calibre.conf --print-all-matched
```

You can also check the status of the jail with:

```sh
sudo fail2ban-client status calibre
```

### Integrate with Homarr

Go to Homarr and click `Add a service`:

```
Service name:           Calibre-Web
Icon URL:               https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Calibre_logo_3.png/600px-Calibre_logo_3.png
Service URL:            http://x.x.x.x:8083
On Click URL:           https://calibre.domain.tld
Service type:           Other
Category:               Media
```

Click `Save service`, then go to `Settings → Save a copy → Confirm` to save the state of your dashboard.

### Integrate with Watchtower

To automatically update the docker image we need to add it to Watchtower, run:

```sh
sudo nano /srv/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower [other containers] calibre-web
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```sh
cd /srv/watchtower && sudo docker compose up -d --build
```

--------------------

</p>
</details>

## Issues and solutions

Sometimes things doesn't go as planned, here are some of the lessons I've learned.

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

My initial idea was to manually add subdomains in Njallas dashboard and then use the provided key to update its DNS-record with ddns-updater. It turned out that ddns-updater does not support multiple keys for Njalla, after an hour or two of research I decided to try a wildcard domain instead which would use the same key for all my subdomains. It was successful and has actually made subdomains easier to manage as I can just add them via Nginx Proxy Manager.

This only works as I have all my services on the same local network, if I for example also had a VPS off-site I would not be able to update both my its and my local servers DNS-record with this method.

### Fail2ban

> __TL;DR:__ Docker version of Fail2ban didn't work so I've switched to running it directly on the OS.

I initially tried to run Fail2ban in a docker container to streamline deployment. I managed to get the filter and jail working but not banning. Fail2ban would correctly detect authentication fails and "ban" the associated IP address. However this "ban" would in reality not result in denied connections and the client could continue with authentication attempts. There seemed to be no clear way to propagate the banned addresses up the IP-tables chain and block connections.

I have now resorted to running it on the server itself and it works like a charm. For services that have built-in support for logging authentication attempts I have Fail2ban listen on its logs, for those that don't I use NGINX basic HTTP authentication and have Fail2ban listen in on NGINXs logs.

### PasswordPusher

> __TL;DR:__ Authentication requires an SMTP server so I've resorted to just enable/disable the site via Nginx when needed.

By default, anyone who visits `passwordpusher.domain.tld` can create a new password push. My initial plan was to implement some form of authentication for this page, ensuring that only authenticated users could create new pushes. Going through the [configuration options](https://github.com/pglombardo/PasswordPusher/blob/master/Configuration.md#enabling-logins) I learned that this is possible only with an SMTP server.

As I don't have an SMTP server I instead tried Nginx HTTP authentication but I had to abandon that idea as it would also force authentication for the password pushes, defeating the purpose of the service. I now just disable the proxy host for PasswordPusher when not in use and enable it for a couple of days while a password is being shared.

I have submitted a [feature request](https://github.com/pglombardo/PasswordPusher/issues/474#issue-1447962464) to PasswordPusher for the option to use default credentials similiar to that of Gotify.

### Nginx Proxy Manager stream

> __TL;DR:__ Lack of `proxy_protocol` support masks the real IP-address of SSH-authentication attempts made through a proxy stream.

Events connected to SSH, such as authentication attempts and sudo commands, will be logged in the servers `/var/log/auth.log`. For example, a successful connection can look something like this:

```
Nov 22 xx:xx:xx host sshd[xxxx]: Accepted publickey for xxxx from 123.123.123.123 port xxxx
```

Of importance is that the IP-address of the attempt is logged. As such, we can have Fail2ban monitor the log and ban anyone spamming authentication attempts.

However, SSH connections made through a Nginx Proxy Manager stream will use the internal IP-address of the Nginx docker container, which will show up in the logs like so:

```
Nov 22 xx:xx:xx host sshd[xxxx]: Invalid user xxxx from 172.30.1.1 port xxxx
```

As the internal IP-address is logged instead of the origin we cannot ban the malicious actor. This is due to the lack of `proxy_protocol` support, which is used by Nginx to pass along the origin IP-address.

This has been reported to the Nginx Proxy Manager developers ([#1114](https://github.com/NginxProxyManager/nginx-proxy-manager/issues/1114), [#1882](https://github.com/NginxProxyManager/nginx-proxy-manager/pull/1882)) and is expected to be fixed in version 3. Untill then, the best thing you can do is to disable password authentication for SSH and instead use key-exchange.

--------------------

</p>
</details>

## License and usage

- Any resource I link, cite or otherwise refer to are subject to their respective licenses.
- Any image used is my own and are subject to All Rights Reserved.
- Everything else in this project is licensed under the terms of the [MIT license](https://mit-license.org/).

**[Back to top](#)**