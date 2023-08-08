<p align="center"><img src="https://github.com/Stylback/home-server/blob/main/media/service_map.svg?raw=true" alt="Service map"/></p>

## About

This repository contains documentation for my home server. If you're looking to use this documentation in one of your own projects, private or commercial, please see the [license and usage](#license-and-usage) section for more information.

Do you have a question? Create an [issue](https://github.com/Stylback/home-server/issues) with the `question` tag and I will answer it to the best of my ability.

Got feedback or suggestions? I would love to hear it, please create an [issue](https://github.com/Stylback/home-server/issues) with the `suggestion` tag and we can take it from there.

Found a security vulnerability and would like to make a responsible disclosure? Contact me at [disclosure.egroup@slmail.me](mailto:disclosure.egroup@slmail.me).

## Table of contents

<details><summary>Click to expand</summary>
<p>

- [About](#about)
- [Table of contents](#table-of-contents)
- [Hardware](#hardware)
  - [CPU / Motherboard](#cpu--motherboard)
  - [Power supply (PSU)](#power-supply-psu)
  - [Case and fan](#case-and-fan)
  - [System memory (RAM)](#system-memory-ram)
  - [Storage](#storage)
  - [Current build costs](#current-build-costs)
- [Assembly and BIOS tweaks](#assembly-and-bios-tweaks)
  - [Assembly](#assembly)
  - [RAM stability](#ram-stability)
  - [Tweaking the BIOS](#tweaking-the-bios)
- [Ubuntu and OS tweaks](#ubuntu-and-os-tweaks)
  - [Installation](#installation)
  - [Benchmark](#benchmark)
  - [Timezone configuration](#timezone-configuration)
  - [Remove Ubuntu Pro messages](#remove-ubuntu-pro-messages)
  - [Automatic updates](#automatic-updates)
  - [Custom MOTD](#custom-motd)
  - [Disk usage warning](#disk-usage-warning)
- [Remote access with Secure Shell (SSH)](#remote-access-with-secure-shell-ssh)
  - [Prerequisite](#prerequisite)
  - [Password access](#password-access)
  - [Public Key Authentication](#public-key-authentication)
  - [Disk decryption with Dropbear-initramfs](#disk-decryption-with-dropbear-initramfs)
  - [SSH hostname alias](#ssh-hostname-alias)
  - [Security enhancements](#security-enhancements)
- [Perimeter security with Fail2ban](#perimeter-security-with-fail2ban)
  - [Setup](#setup)
  - [Useful commands](#useful-commands)
  - [Gotify integration](#gotify-integration)
- [Application containers with Docker](#application-containers-with-docker)
  - [Setup](#setup-1)
  - [Manage containers with ctop](#manage-containers-with-ctop)
  - [Automatic pruning](#automatic-pruning)
- [Automatic updates with Watchtower](#automatic-updates-with-watchtower)
  - [Setup](#setup-2)
  - [Gotify integration](#gotify-integration-1)
- [Dynamic DNS with ddns-updater](#dynamic-dns-with-ddns-updater)
  - [Prerequisite](#prerequisite-1)
  - [Setup](#setup-3)
  - [Gotify integration](#gotify-integration-2)
  - [Watchtower integration](#watchtower-integration)
- [Reverse proxy with Nginx Proxy Manager](#reverse-proxy-with-nginx-proxy-manager)
  - [Prerequisite](#prerequisite-2)
  - [Setup](#setup-4)
  - [Wildcard SSL certificate](#wildcard-ssl-certificate)
  - [Fail2ban integration](#fail2ban-integration)
  - [Watchtower integration](#watchtower-integration-1)
- [Notifications with Gotify](#notifications-with-gotify)
  - [Setup](#setup-5)
  - [Customization](#customization)
  - [Nginx Proxy Manager integration](#nginx-proxy-manager-integration)
  - [Fail2ban integration](#fail2ban-integration-1)
  - [Watchtower integration](#watchtower-integration-2)
- [Multimedia streaming with Jellyfin](#multimedia-streaming-with-jellyfin)
  - [Prerequisite](#prerequisite-3)
  - [Setup](#setup-6)
  - [Media transfer and streaming](#media-transfer-and-streaming)
  - [Hardware acceleration](#hardware-acceleration)
  - [Customization](#customization-1)
  - [Nginx Proxy Manager integration](#nginx-proxy-manager-integration-1)
  - [Fail2ban integration](#fail2ban-integration-2)
  - [Watchtower integration](#watchtower-integration-3)
- [VPN stack with Gluetun and qBittorrent](#vpn-stack-with-gluetun-and-qbittorrent)
  - [Prerequisite](#prerequisite-4)
  - [Initial setup](#initial-setup)
  - [Gluetun](#gluetun)
  - [qBittorrent](#qbittorrent)
  - [Fail2ban integration](#fail2ban-integration-3)
  - [Watchtower integration](#watchtower-integration-4)
- [Indexers with Prowlarr](#indexers-with-prowlarr)
  - [Setup](#setup-7)
  - [Fail2ban integration](#fail2ban-integration-4)
  - [Watchtower integration](#watchtower-integration-5)
- [Movies with Radarr](#movies-with-radarr)
  - [Setup](#setup-8)
  - [Fail2ban integration](#fail2ban-integration-5)
  - [Watchtower integration](#watchtower-integration-6)
- [TV-shows with Sonarr](#tv-shows-with-sonarr)
  - [Setup](#setup-9)
  - [Fail2ban integration](#fail2ban-integration-6)
  - [Watchtower integration](#watchtower-integration-7)
- [Subtitles with Bazarr](#subtitles-with-bazarr)
  - [Setup](#setup-10)
  - [Watchtower integration](#watchtower-integration-8)
- [Request media with Jellyseerr](#request-media-with-jellyseerr)
  - [Setup](#setup-11)
  - [Nginx Proxy Manager integration](#nginx-proxy-manager-integration-2)
  - [Fail2ban integration](#fail2ban-integration-7)
  - [Watchtower integration](#watchtower-integration-9)
  - [Gotify integration](#gotify-integration-3)
- [RSS feeds with FreshRSS](#rss-feeds-with-freshrss)
  - [Setup](#setup-12)
  - [Clients](#clients)
  - [Fetch full articles](#fetch-full-articles)
  - [Nginx Proxy Manager integration](#nginx-proxy-manager-integration-3)
  - [Fail2ban integration](#fail2ban-integration-8)
  - [Watchtower integration](#watchtower-integration-10)
- [Notes with Joplin](#notes-with-joplin)
  - [Setup](#setup-13)
  - [Configuration](#configuration)
  - [Watchtower integration](#watchtower-integration-11)
- [Ebooks with Calibre and Calibre-Web](#ebooks-with-calibre-and-calibre-web)
  - [Prerequisite](#prerequisite-5)
  - [Calibre](#calibre)
  - [Calibre-Web](#calibre-web)
  - [Nginx Proxy Manager integration](#nginx-proxy-manager-integration-4)
  - [Kobo Sync integration](#kobo-sync-integration)
  - [Fail2ban integration](#fail2ban-integration-9)
  - [Watchtower integration](#watchtower-integration-12)
- [File synchronization with Nextcloud](#file-synchronization-with-nextcloud)
  - [Nextcloud](#nextcloud)
  - [MariaDB](#mariadb)
  - [Reverse proxy configuration](#reverse-proxy-configuration)
  - [Configure Nextcloud](#configure-nextcloud)
  - [Fail2ban integration](#fail2ban-integration-10)
  - [Further integrations](#further-integrations)
- [System snapshots and data backups](#system-snapshots-and-data-backups)
  - [System snapshots with Timeshift](#system-snapshots-with-timeshift)
    - [Useful commands](#useful-commands-1)
  - [Data backup with Borg](#data-backup-with-borg)
  - [Backup to cold storage](#backup-to-cold-storage)
  - [Restoration process](#restoration-process)
- [Issues, solutions and workarounds](#issues-solutions-and-workarounds)
  - [Bricked motherboard](#bricked-motherboard)
  - [ddns-updater, unique or wildcard subdomains?](#ddns-updater-unique-or-wildcard-subdomains)
  - [Fail2ban, docker or bare-metal?](#fail2ban-docker-or-bare-metal)
  - [Nginx Proxy Manager streams for SSH](#nginx-proxy-manager-streams-for-ssh)
  - [Misconfigured SSD partition table](#misconfigured-ssd-partition-table)
- [License and usage](#license-and-usage)

</p>
</details>

## Hardware

The components I use and why.

### CPU / Motherboard

<details><summary>Click to expand</summary>
<p>

I've settled for an [intel Pentium J5040](https://ark.intel.com/content/www/us/en/ark/products/197304/intel-pentium-silver-j5040-processor-4m-cache-up-to-3-20-ghz.html) as it has some particularly useful features for my use case:

- 18 execution units for parallel processing
- Integrated Graphics for display output
- Intel Quick Sync for extensive video encoding/decoding support
- 10W TDP (Thermal Design Power, a shorthand way of estimating power consumption)

However; J-series CPU:s are only available as "on-board" or "embedded" CPU:s, which is to say they are soldered directly onto a motherboard. I've opted for an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp) due to its rich feature-set, but you might consider the cheaper [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) if you're OK with being limited to 8GB of RAM (or risk bricking your motherboard, see [here](#issues-and-solutions) for my experience).

</p>
</details>

### Power supply (PSU)

<details><summary>Click to expand</summary>
<p>

Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep power consumption down. A power supply is at its most efficient at **50%** of maximum rated load, that means a PSU rated at 500W max load will be at its most efficient when it provides 250W of power.

What **is** the efficiency at 50% load? That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A `80+ White` will be 80-85% efficient at 50% load while a `80+ Titanium` will be 94-96% efficient.

After some back of the napkin calculations (see "Approximating power consumption" below) I've estimated my system to draw between 10 to 26W. As such my ideal PSU would be a power brick style 50-100W PICO-PSU. I've had no luck finding such a model with the right mix of power-cables and have instead opted for a traditional ATX PSU. At 300W, the [SYSTEM POWER B9 from be quiet!](https://www.bequiet.com/en/powersupply/1285) offers a better low-load efficiency compared to the more common 450/500W models with the added benefit of providing some headroom for upgrades.

**Approximating power consumption**

| Component | Power draw (idle) [W] | Power draw (active) [W] |
| :--- | ---: | ---: |
| Crucial MX500 2x2TB | 0.20<sup>1</sup> | 1.08<sup>1</sup> |
| Crucial MX500 250GB | 0.08<sup>1</sup> | 0.54<sup>1</sup> |
| G.SKILL Ripjaws SO-DIMM 16GB | 6.00<sup>2</sup> | 6.00<sup>2</sup> |
| ASRock J5040-ITX | 0.70<sup>3</sup> | 10.00<sup>3</sup> |
| NF-A12X25 ULN | 0.6<sup>4</sup> | 0.6<sup>4</sup> |
| Total (100% efficiency): | 7.58 | 18.22 |
| **Total (70% efficiency<sup>5</sup>):** | **10.8** | **26** |

If we assume an average 2 hours of full system utilization per day, with the rest being equivalent to an idle power state, we can approximate the daily power consumption to: $\frac{25.3 \times 2 + 10.7 \times 22}{1000} \approx 0.286 \textrm{ kWh/Day}$

Or a yearly power consumption of: $0.286*365 \approx 104 \textrm{ kWh/Year}$

<sup>1. [AnandTech MX500 review](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8). Power draw for the 250GB model is inferred from the MX500 500GB results.</sup>

<sup>2. [TomsHardware i7-5960x review](https://www.tomshardware.com/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html). This number seems to agree with Crucials [own assessment](https://www.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use).</sup>

<sup>3. Inferred from Dr. Helmut Neukirchen's [power consumption test](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/) of the J4105, as it has the same TDP as the J5040. I also subtracted 3 W from the authors measurements which is the estimated power consumption of a 8GB stick of DDR4 RAM.</sup>

<sup>4. Noctua NF-A12X25 ULN [specification](https://noctua.at/en/products/fan/nf-a12x25-uln/specification).</sup>

<sup>5. [HardwareInfo low-load PSU test](https://web.archive.org/web/20130811112042/http://uk.hardware.info/productinfo/188792/be-quiet!-pure-power-l8-300w#tab:testresults). Inferred from the 22.5 W test of the _be quiet! Pure Power L8 300 W_.</sup>

</p>
</details>

### Case and fan

<details><summary>Click to expand</summary>
<p>

The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes; discreet and affordable with some room for expandability. I wasn't fully satisfied with the noise level of the included rear-mounted 120mm fan so I replaced it with a [Noctua NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln).

As the case only have two built-in mount points for SSD:s I also bought a mount kit from [Sabrent](https://sabrent.com/collections/ssd-brackets/products/bk-hdcc).

</p>
</details>

### System memory (RAM)

<details><summary>Click to expand</summary>
<p>

The J5040 officially supports up to 8GB of RAM, despite this [some](https://libreddit.dcs0.hu/r/ASRock/comments/k8hpww/how_can_a_motherboard_support_more_ram_than_the/) reddit users report being able to use 16 or even 32GB with varying results. With this in mind I decided to try my luck with a [G.SKILL Ripjaws SO-DIMM 16GB kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS).

</p>
</details>

### Storage

<details><summary>Click to expand</summary>
<p>

Spinning hard-disk drives (HDDs) are popular in home servers and NAS due to their high storage capacity and low price. However, they have reduced speeds and increased power consumption compared to solid-state drives (SSDs). Their moving parts also add noise and a significant [point of failure](https://en.wikipedia.org/wiki/Head_crash).

I opted for three [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (1x250GB + 2x2TB) as they provide a good balance between price and performance, in addition they support _Integrated Power Loss Immunity_ which aims to prevent data loss in the case of a power outage.

</p>
</details>

### Current build costs

<details><summary>Click to expand</summary>
<p>

| Component type | Model name | Price ([SEK](https://www.xe.com/currencyconverter/convert/?Amount=7750&From=SEK&To=USD)) |
| :--- | :--- | ---: |
| CPU / Motherboard | [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp)| 1790 |
| Power supply | [be quiet! SYSTEM POWER B9 (300W)](https://www.bequiet.com/en/powersupply/1285) | 440 |
| Case | [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html)| 380 |
| Fan | [NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln) | 290 |
| RAM | [G.SKILL Ripjaws SO-DIMM 16GB, 2400MHz Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS)| 560 |
| Storage | [Crucial MX500 (250GB + 2x2TB)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 3885 |
| Mount kit| [Sabrent 3.5" to x2 SSD](https://sabrent.com/collections/ssd-brackets/products/bk-hdcc) | 97 |
| Cable| [2 x SATA cables 0.5m](https://www.amazon.se/-/en/gp/product/B00SY319TG/) | 38 |
| Cable| [Power cable 5m](https://www.amazon.se/gp/product/B07Y1VHRPT/) | 110 |
| Cable| [Cat 5e cable 5m](https://www.amazon.se/gp/product/B00I7XX1BC/) | 60 |
| Misc | [Cable ties](https://www.amazon.se/gp/product/B09GFMN616/) | 100 |
| **Total:** |  | **7750** |

</p>
</details>

## Assembly and BIOS tweaks

Assembling the hardware, verifying functionality and tweaking the BIOS.

### Assembly

<details><summary>Click to expand</summary>
<p>


| Image | Note |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/home-server/blob/main/media/case_inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access and has plenty of room for cable managment as long as you don't have a GPU. |
| ![power-extender cable](https://github.com/Stylback/home-server/blob/main/media/case_side.jpg?raw=true) | One gripe with the case is the back-mounted power-extender. it's aligned in such a way that the power-cable has to be forcefully twisted to slot into the PSU. I tried screwing the socket out and flip it 180°, which would alleviate some of the tension on the cable. It was howver not possible due to the shape of the socket cutout. |
| ![rear view](https://github.com/Stylback/home-server/blob/main/media/case_back.jpg?raw=true) | Rear-view and IO. |
| ![assembled case](https://github.com/Stylback/home-server/blob/main/media/case_assembled.jpg?raw=true) | Assembled system. |

</p>
</details>

### RAM stability

<details><summary>Click to expand</summary>
<p>

Before installing the operating system I wanted to ensure that my RAM modules would not cause any system instability. MemTest86 is an industry staple in this regard, it has a multitude of tests designed to coax RAM instability under extreme conditions.

I made a bootable USB following their [instructions](https://www.memtest86.com/tech_creating-linux-mac.html) and ran the standard configuration of 13 tests, 4 passes.

| Image | Note |
|:---|:---|
| ![Ram modules detected by MemTest86](https://github.com/Stylback/home-server/blob/main/media/memtest86_ram.bmp?raw=true) | Both sticks of RAM was detected by MemTest86. |
| ![Test completion screen](https://github.com/Stylback/home-server/blob/main/media/memtest86_pass.jpg?raw=true) | The sticks passed with 0 errors, completing the tests in 4 hours and 37 minutes. |

</p>
</details>

### Tweaking the BIOS

<details><summary>Click to expand</summary>
<p>

The ASRock J5040-ITX comes with an extensive list of BIOS settings, so far I've made the following changes:

| Setting | Default | Set to | Reason |
| ------------- | ------------- |------------- |------------- |
| SATA Aggressive Link Power Management | Disable | Enable | Reduces power consumption while SATA devices are idle. |
| Onboard HD Audio | Enable | Disable | Audio will be handled client-side. |
| Deep S5 | Disable | Auto | Reduces power consumption while the system is turned off. |
| Restore on AC/Power | Loss Power Off | Loss Power On | Restarts the system after a power failure. |

</p>
</details>

## Ubuntu and OS tweaks

Installing the OS and implementing some suitable Quality of life (QOL) changes.

### Installation

<details><summary>Click to expand</summary>
<p>

I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. The installation process is straightforward:
- Choose `Try or install Ubuntu server`
- Choose language
- Update to the new installer (if applicable)
- Choose keyboard layout
- Choose base for installation (Ubuntu Server)
- Configure at least one network interface (take default)
- Don't choose a proxy adress
- Use default Ubuntu mirror
- Use entire disk (choose 250GB one) with LUKS encryption, choose a passphrase
- Configure the rest of storage layout as LUKS encrypted LVM's
- Do the profile setup
- Install OpenSSH
- Don't install featured server snaps
- Wait until it finishes
- Unplug USB and reboot

With over 4TB of storage available, I partitioned the drives with the following structure:

```
drive_1 (250GB) - BOOT
├── Ubuntu (100GB)
├── home (30GB)
└── docker (100GB)
    ├── service_1
    ├── service_2
    ├── service_3
    ...

drive_2 (2TB)
└── library (2TB)
    ├── media
    │   ├── books
    │   ├── movies
    │   └── tv
    └── torrents
        ├── prowlarr
        ├── radarr
        └── sonarr

drive_3 (2TB)
├── files (1TB)
└── backup (1TB)
    ├── backup_1.zip
    ├── backup_2.zip
    ├── backup_3.zip
    ...
```

</p>
</details>

### Benchmark

<details><summary>Click to expand</summary>
<p>

Update the system with:

```bash
sudo apt update && sudo apt upgrade
```

Afterwards, run the benchmarking script [YABS](https://github.com/masonr/yet-another-bench-script):

```bash
curl -sL yabs.sh | bash
```

My results:

```bash
Basic System Information:
---------------------------------
Uptime     : 0 days, 0 hours, 14 minutes
Processor  : Intel(R) Pentium(R) Silver J5040 CPU @ 2.00GHz
CPU cores  : 4 @ 2300.000 MHz
AES-NI     : ✔ Enabled
VM-x/AMD-V : ✔ Enabled
RAM        : 15.3 GiB
Swap       : 4.0 GiB
Disk       : 3.8 TiB
Distro     : Ubuntu 22.04.2 LTS
Kernel     : 5.15.0-60-generic

fio Disk Speed Tests (Mixed R/W 50/50):
---------------------------------
Block Size | 4k            (IOPS) | 64k           (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 89.64 MB/s   (22.4k) | 122.85 MB/s   (1.9k)
Write      | 89.88 MB/s   (22.4k) | 123.49 MB/s   (1.9k)
Total      | 179.52 MB/s  (44.8k) | 246.34 MB/s   (3.8k)
           |                      |                     
Block Size | 512k          (IOPS) | 1m            (IOPS)
  ------   | ---            ----  | ----           ---- 
Read       | 166.57 MB/s    (325) | 173.57 MB/s    (169)
Write      | 175.42 MB/s    (342) | 185.13 MB/s    (180)
Total      | 342.00 MB/s    (667) | 358.70 MB/s    (349)

iperf3 Network Speed Tests (IPv4):
---------------------------------
Provider        | Location (Link)           | Send Speed      | Recv Speed      | Ping           
-----           | -----                     | ----            | ----            | ----           
Clouvider       | London, UK (10G)          | 124 Mbits/sec   | 124 Mbits/sec   | 24.5 ms        
Scaleway        | Paris, FR (10G)           | 123 Mbits/sec   | 124 Mbits/sec   | 31.8 ms        
NovoServe       | North Holland, NL (40G)   | 124 Mbits/sec   | 124 Mbits/sec   | 22.3 ms        
Uztelecom       | Tashkent, UZ (10G)        | 121 Mbits/sec   | 122 Mbits/sec   | 83.0 ms        
Clouvider       | NYC, NY, US (10G)         | 120 Mbits/sec   | 121 Mbits/sec   | 86.7 ms        
Clouvider       | Dallas, TX, US (10G)      | 117 Mbits/sec   | 119 Mbits/sec   | 120 ms         
Clouvider       | Los Angeles, CA, US (10G) | 114 Mbits/sec   | 116 Mbits/sec   | 148 ms         

Geekbench 5 Benchmark Test:
---------------------------------
Test            | Value                         
                |                               
Single Core     | 575                           
Multi Core      | 1950
```

</p>
</details>

### Timezone configuration

<details><summary>Click to expand</summary>
<p>

We will configure our timezone to ensure correct date and time formats. All timezones are given in the format `<Area>/<Location>`, for example `Europe/Stockholm`. A full list of available timezones are given with:

```bash
timedatectl list-timezones
```

Now that you have your desired timezone, run:

```bash
sudo timedatectl set-timezone <Area>/<Location>
```

Next:


```bash
sudo nano /etc/timezone
```

Replace the value with your timezone like so:

```
TZ='<Area>/<Location>'
```

Save and exit. Now run:

```bash
sudo ln -sf /usr/share/zoneinfo/<Area>/<Location> /etc/localtime
```

Then run:

```bash
sudo dpkg-reconfigure -f noninteractive tzdata
```

Finally, check that the timezone is correct with:

```bash
timedatectl
```

</p>
</details>

### Remove Ubuntu Pro messages

<details><summary>Click to expand</summary>
<p>

Canonical sometimes promote their [Ubuntu Pro](https://ubuntu.com/pro) service when you run `apt upgrade`. To disable these messages, first run:

```bash
sudo pro config set apt_news=false
```

Next, remove the message templates:

```bash
sudo rm /var/lib/ubuntu-advantage/messages/*.tmpl
```

Then go to the `messages.py` file:

```bash
sudo nano /usr/lib/python3/dist-packages/uaclient/messages.py
```

Find and change `SS_LEARN_MORE` and `TRY_UBUNTU_PRO_BETA`:

```
SS_LEARN_MORE = "" 
TRY_UBUNTU_PRO_BETA = ""
```

Save and exit. You might need to reboot the server to properly apply the changes.

Next, to remove messages promoting Expanded Security Maintenance for Applications (ESM Apps), run this script from [jwatson](https://askubuntu.com/a/1456185):

```sh
sudo sed -Ezi.orig \
  -e 's/(def _output_esm_service_status.outstream, have_esm_service, service_type.:\n)/\1    return\n/' \
  -e 's/(def _output_esm_package_alert.*?\n.*?\n.:\n)/\1    return\n/' \
  /usr/lib/update-notifier/apt_check.py
```

</p>
</details>

### Automatic updates

<details><summary>Click to expand</summary>
<p>

For automatic security updates you can install `unattended-upgrades`:

```bash
sudo apt install unattended-upgrades
```

To automatically update and upgrade existing packages, we will need need to create a cron-job. First install and enable cron:

```bash
sudo apt update && sudo apt install cron
```

```bash
sudo systemctl enable cron
```

Next, we will make two crontab entries:

```bash
sudo nano /etc/crontab
```

At the bottom, paste:

```
0  5    * * *   root    /usr/bin/apt update -q
10 5    * * *   root    /usr/bin/apt upgrade -q -y
```

Save and exit. This will run `apt update` everyday at 05:00 and `apt upgrade` everyday at 05:10. `-q` will omitt progress indicators while `-y` will automatically approve any prompt.

If you want Gotify notifications when a reboot is required follow the steps below:

Create the script:

```bash
sudo nano /usr/local/bin/reboot_notification.sh
```

Paste:

```bash
#!/bin/bash

URL="https://<subdomain>.<domain>.<tld>" # Gotify URL
Token="<token>" # Gotify token

gotify()
{
        curl "${URL}/message?token=${Token}" -F "title=${1}" -F "message=${2}" -F "priority=${3}"
}

if [ -f /var/run/reboot-required ];
then
        Packages=$(cat /var/run/reboot-required.pkgs)
        Priority=5
        gotify "${HOSTNAME} requires a reboot" "${Packages}" "${Priority}"
fi
```

Test it:

```bash
sh /usr/local/bin/reboot_notification.sh
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/reboot_notification.sh
```

Add it to crontab:

```bash
sudo nano /etc/crontab
```

Create a new entry:

```
20 05   * * *   root    /usr/local/bin/reboot_notification.sh
```

Save and exit. This will run a check everyday at 05:20 and notify you if a reboot is required.

</p>
</details>

### Custom MOTD

<details><summary>Click to expand</summary>
<p>

The welcome message or the Message of the day (MOTD) is displayed everytime you connect to the server. It's composed of multiple scripts which recides in `/etc/update-motd.d/` and are executed in order of their names. The default scripts are:

```
00-header
10-help-text
50-motd-news
50-landscape-sysinfo
85-fwupd
90-updates-available
91-release-upgrade
95-hwe-eol
98-fsck-at-reboot
88-esm-announce
91-contract-ua-esm-status
92-unattended-upgrades
97-overlayroot
98-reboot-required
```

You can change or remove any of these scripts as you see fit, you can also add new ones. Below are my configuration:

![MOTD screenshot](https://github.com/Stylback/home-server/blob/main/media/motd.png?raw=true) 

Remove unwanted scripts:

```
cd /etc/update-motd.d/ && sudo rm 00-header 10-help-text 50-landscape-sysinfo 50-motd-news 88-esm-announce 91-contract-ua-esm-status
```

Disable `Last login` message:

```bash
sudo nano /etc/ssh/sshd_config
```

```bash
sudo systemctl restart ssh
```

Change `PrintLastLog yes` to `PrintLastLog no`, save and exit.

Disable `0 updates available` message:

```bash
sudo nano /etc/update-motd.d/90-updates-available
```

Change `[ ! -r "$stamp" ] || cat "$stamp"` to `([ ! -r "$stamp" ] || [ -n "$(awk '/^0/{print $1;}' "$stamp")" ]) || cat "$stamp"`

Install [neofetch](https://github.com/dylanaraps/neofetch):

```bash
sudo apt install neofetch
```

Below are my configuration options for neofetch. There are many options to choose from, see the [wiki](https://github.com/dylanaraps/neofetch/wiki/Customizing-Info) for more information.

```
sudo nano ~/.config/neofetch/config.conf
```

```
print_info() {
    info "Uptime" uptime
    info "CPU" cpu
    info "CPU Usage" cpu_usage
    info "Memory" memory
    info "Disk" disk
}

memory_percent="on"
memory_unit="gib"
package_managers="off"
speed_shorthand="on"
cpu_brand="off"
cpu_speed="off"
cpu_cores="off"
cpu_temp="C"
gpu_brand="off"
disk_show=('/home' '/docker' '/backup' '/files' '/library')
disk_subtitle="dir"
disk_percent="on"
ascii_distro="Ubuntu_small"
```

Create a MOTD script for neofetch:

```bash
sudo nano /etc/update-motd.d/00-neofetch
```

```bash
#! /bin/bash

neofetch --config /home/<username>/.config/neofetch/config.conf;
```

Configure permissions:

```bash
sudo chmod u+x,g+x,a+x /etc/update-motd.d/00-neofetch
```

Save and exit.

</p>
</details>

### Disk usage warning
 
<details><summary>Click to expand</summary>
<p>

![Gotify notification](https://github.com/Stylback/home-server/blob/main/media/disk_check.png?raw=true) 

Get Gotify notifications when disk utilization goes over a pre-defined threshold:

```bash
sudo nano /usr/local/bin/disk_check.sh
```

Paste:

```bash
#!/bin/bash

URL="https://<subdomain>.<domain>.<tld>" # Gotify URL
Token="your-token" # Gotify Token

gotify()
{
        curl "${URL}/message?token=${Token}" -F "title=${1}" -F "message=${2}" -F "priority=${3}"
}

df_mounts=$(df -l | awk 'NR > 1 {print $6}')
Volume_list=($df_mounts) # Recast as array

Threshold="80"

for Volume in "${Volume_list[@]}"; do

    Used="$(df -l $Volume | awk 'NR > 1 {sub( "%", "", $5); print $5 }')"

    if [ "$Used" -gt "$Threshold" ]; then
        Priority=5
        gotify "${Volume} is getting full" "${Used}% used" "${Priority}"
    fi
done
```

Test it:

```bash
bash /usr/local/bin/disk_check.sh
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/disk_check.sh
```

Add it to crontab:

```bash
sudo nano /etc/crontab
```

Create a new entry:

```
30 05   * * *   root    /usr/local/bin/disk_check.sh
```

Save and exit. This will run a check everyday at 05:30 and notify you if disk utilization exceeds your choosen threshold.

</p>
</details>

## Remote access with Secure Shell (SSH)

[SSH](https://en.wikipedia.org/wiki/Secure_Shell) is a versatile network protocol for remote login and command line execution.

### Prerequisite

<details><summary>Click to expand</summary>
<p>

To use SSH you will need an SSH daemon. In this section we will be using OpenSSH, which comes shipped by default on most server and desktop Linux distributions. If you lack the deamon you can install it using the following two commands:

For your client:

```bash
sudo apt install openssh-client
```

For your server:

```bash
sudo apt install openssh-server
```

In this section we will also assume that your client (laptop or desktop computer) is on the same local network as the server. You should keep this in mind if you're setting up the server remotely, such as with a rented VPS.

</p>
</details>

### Password access

<details><summary>Click to expand</summary>
<p>

First we need to take note of the servers local IP adress. On your server, simply run:

```bash
ip a | grep "scope global" | head -1 | awk '{print $2}' | sed 's|/.*||'
```

Now on your client, run:

```bash
ssh <server-username>@<server-ip>
```

Replacing <server-username> and <server-ip> with your own. You will be warned that `The authenticity of host '<server-ip> (<server-ip>)' can't be established.`. This is expected, write yes at the prompt to connect and then enter your password.

</p>
</details>

### Public Key Authentication

<details><summary>Click to expand</summary>
<p>

A more secure alternative to password authentication is public key authentication. On the client, run:

```bash
ssh-keygen -t ed25519 -C "For server"
```

You will be prompted for a `keyname`, you can choose a name or accept the default `id_ed2559` by pressing enter. You will also be prompted for a passphrase, enter a passphrase or press enter to skip. A keypair will be created, one public key named `keyname.pub` and one private key named `keyname` which will both be located under `~/.ssh`.

Now let's copy the clients **public** key to the server. On the client, run: 

```bash
ssh-copy-id -i ~/.ssh/<keyname>.pub <server-username>@<server-ip>
```

This will prompt you for both a password and a passphrase (if you choose one earlier). If everything worked out, you should now be able to connect to the server without a password, try it:

```bash
ssh <server-username>@<server-ip>
```

> **NOTE**: Always keep your **private** key secure. If you have any reason to believe that your **private** key has been compromised, generate a new keypair and delete the previous pair from both your client and the server.

</p>
</details>

### Disk decryption with Dropbear-initramfs

<details><summary>Click to expand</summary>
<p>

As our drives are LUKS-encrypted, they will remain locked untill manually decrypted after a reboot. This requires us to plug a monitor and keyboard into the server, which might be inconvenient. [Dropbear-initramfs](https://github.com/mkj/dropbear) will allows us to decrypt the drives via SSH. To start, update:

```bash
sudo apt update && sudo apt upgrade
```

Install Dropbear-initramfs:

```bash
sudo apt install dropbear-initramfs
```

Set options:

```bash
sudo nano /etc/dropbear/initramfs/dropbear.conf
```

Paste:

```bash
DROPBEAR_OPTIONS="-I 180 -s 2222 -c cryptroot-unlock"
```

It's important that Dropbear have a different port to OpenSSH, as this will treat them as different hosts.
Save and exit. Copy our clients public key to Dropbears authorized keys:

```bash
sudo nano ~/.ssh/<keyname>.pub
```

```bash
sudo nano /etc/dropbear/initramfs/authorized_keys
```

Intsall keyutils and update our crypttab:

```bash
sudo apt install keyutils
```

```bash
sudo nano /etc/crypttab
```

Append `keyscript=decrypt_keyctl` to `luks` at the rightmost entries:

```
dm_crypt-0 UUID=7c3559af-5dc8-49d2-a2ff-19c736f28591 none luks,keyscript=decrypt_keyctl
dm_crypt-1 UUID=42811b6b-3976-4613-b4d5-4380a1f0fff5 none luks,keyscript=decrypt_keyctl
dm_crypt-2 UUID=d1bfef63-a427-4fe7-adda-360909f18b60 none luks,keyscript=decrypt_keyctl
```

This will ensure we only have to type in the LUKS passphrase once. Save and exit. Update initramfs:

```bash
sudo update-initramfs -u
```

Now to test it, first reboot:

```bash
sudo reboot
```

Next, ping the server from your client:

```bash
ping <server-ip>
```

If it's reachable, try to log in:

```bash
ssh -i ~/.ssh/<keyname> -p 2222 -o "HostKeyAlgorithms ssh-ed25519" root@<server-ip>
```

</p>
</details>

### SSH hostname alias

<details><summary>Click to expand</summary>
<p>

It would quickly become tiresome to type out the full SSH command everytime we want to connect to the server. We will set up a configuration file that will make this process much easier:

```bash
sudo nano ~/.ssh/config
```

Paste:

```bash
Host <alias-unlock>
    Hostname <server-ip>
    Port 2222
    User root
    IdentityFile ~/.ssh/<keyname>
    HostKeyAlgorithms ssh-ed25519

Host <alias>
    Hostname <server-ip>
    Port 22
    User <username>
```

Save and exit. You should now be able to connect to the server with:

```bash
ssh <alias>
```

</p>
</details>

### Security enhancements

<details><summary>Click to expand</summary>
<p>

Now that we can connect to the server using our SSH-key, we will make some security enhancement. On your client, connect to the server and run:

```bash
sudo nano /etc/ssh/sshd_config
```

Look for the line with `PermitRootLogin`, uncomment and change it to `PermitRootLogin no`. Then search for `PasswordAuthentication`, uncomment and change it to `PasswordAuthentication no`.

Finally, find the line with `Port 22`, uncomment and change it to [another](https://serverfault.com/questions/509294/what-are-valid-ports-to-use-for-ssh) port of your choice. Save and exit. Remember to change the port number for your hostname alias as well.

> **NOTE:** Do not close the terminal window. If something was entered incorrectly in the configuration file you might lose SSH access to the server. Until you know everything works, ensure that you have at least one other terminal instance running that is connected to the server.

Restart the SSH service by running:

```bash
sudo systemctl restart ssh
```

Verify that everything works by first trying to connect to the server with `ssh alias`, then try to access it using `ssh root@<server-ip>`. The first should succeed while the second should be met with `Permission denied (publickey)`.

For Dropbear:

```bash
sudo nano /etc/dropbear/initramfs/dropbear.conf
```

Add additional options -j (disable local port forwarding), -k (disable remote port forwarding), -s (disable password authentication):

```bash
DROPBEAR_OPTIONS="-I 180 -j -k -p 2222 -s -c cryptroot-unlock"
```

Save and exit. Rebuild initramfs:

```bash
sudo update-initramfs -u
```

Reboot and check connection:

```bash
sudo reboot
```

```bash
ssh <alias-unlock>
```

</p>
</details>

## Perimeter security with Fail2ban

[Fail2ban](https://github.com/fail2ban/fail2ban) is a service that can watch log files and take action, such as banning IP addresses that have multiple failed log-in attempts.

### Setup

<details><summary>Click to expand</summary>
<p>

We want to detect and ban malicious behaviour towards our internet-exposed services, such as attempts to brute-force a password or DoS/DDoS attacks. For each service we will define a jail and filter, we will then have Fail2ban watch the logs of that service and ban IPs that match said filter.

In contrast to our other services we will not be using Fail2ban in a Docker container (curious why? see [here](#issues-and-solutions) for my experience), we will instead install it directly on the OS. To get started, run:

```bash
sudo apt update && sudo apt install fail2ban
```

Start Fail2ban with:

```bash
sudo fail2ban-client start
```

Make Fail2ban run on start with:

```bash
sudo systemctl enable fail2ban
```

</p>
</details>

### Useful commands

<details><summary>Click to expand</summary>
<p>

Unban yourself with:

```bash
sudo fail2ban-client unban <your-ip>
```

Unban **everyone** with:

```bash
sudo fail2ban-client unban --all
```

Check jail status:

```bash
sudo fail2ban-client status <jail-name>
```

See if a filter will catch something in a logfile (great for testing/debugging):

```
fail2ban-regex <path-to-logfile> <path-to-filter> --print-all-matched
```

</p>
</details>

### Gotify integration

<details><summary>Click to expand</summary>
<p>

We will have Gotify notify us whenever an IP was banned and give us some more information about their attempts prior to said ban. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Fail2ban and take note of the token.

Next we will create the `action.d` file that will trigger the message, run:

```bash
sudo nano /etc/fail2ban/action.d/gotify.conf
```

Paste the following, using your own URL and token:

```
[Definition]
actionban = curl "https://<subdomain>.<domain>.<tld>/message?token=<token>" -F title="[Fail2ban] <name>" -F message="Banned IP: <ip> Details: `grep '<ip>' <logpath>`" -F "priority=5"
```

Save and exit. Now you can add the `gotify` action to your jails like so:

```
[...]
action = iptables-allports[name=<service>, chain=DOCKER-USER]
	 gotify
```

>NOTE: The indentation for actions are important, they should both share the same indentation depth.

Finish up by restarting Fail2ban:

```bash
sudo systemctl restart fail2ban
```

</p>
</details>

## Application containers with Docker

[Docker](https://www.docker.com/) lets us set up containers to hold our services and applications, streamlining deployment.

### Setup

<details><summary>Click to expand</summary>
<p>

There are multiple ways to use Docker, we will be using the `compose` method which entails three steps:

1. Create a `docker-compose.yml` file
2. In the file, add any necessary parameters to make the service work
3. Build the Docker image with `sudo docker compose up -d`

To install the necessary Docker components I followed their [official documentation](https://docs.docker.com/engine/install/) which can be summarized below as:

Get the prerequisite with:

```bash
sudo apt update && sudo apt install ca-certificates curl gnupg lsb-release
```

Add Dockers official GPG with:

```bash
sudo mkdir -p /etc/apt/keyrings
```

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

Now we can safely add the repository with:

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install the Docker components by running: 

```bash
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

Verify that everything is working by running:

```bash
sudo docker run hello-world
```

Finally, run the following to enable Docker to run on boot:

```bash
sudo systemctl enable docker
```

</p>
</details>

### Manage containers with ctop

<details><summary>Click to expand</summary>
<p>

For easy overview and management of our Docker containers we can install [ctop](https://github.com/bcicen/ctop). To do it, run the commands below:

```bash
sudo apt install ca-certificates curl gnupg lsb-release
```

```bash
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list
```

```bash
sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg https://azlux.fr/repo.gpg
```

> **GPG/Key Error?** The key is most likely out of date, visit the [maintainer](https://packages.azlux.fr/) to find the current key.

```bash
sudo apt update && sudo apt install docker-ctop
```

Launch it with:

```bash
sudo ctop
```

</p>
</details>

### Automatic pruning

<details><summary>Click to expand</summary>
<p>

Removing or updating docker images, containers, volumes and networks might result in them being left unused or "dangling". This will take up space on our drives, so we will create a cronjob to automatically prune them.

```
sudo nano /usr/local/bin/docker_prune.sh
```

Paste:

```
#!/bin/bash

docker image prune -a -f
docker system prune --volumes -f
```

Test it:

```
sudo sh /usr/local/bin/docker_prune.sh
```

Make it executable:

```
sudo chmod +x /usr/local/bin/docker_prune.sh
```

Add to crontab:

```
sudo nano /etc/crontab
```

Create a new entry:

```
30 04   * * 1   root    /usr/local/bin/docker_prune.sh
```

Save and exit. This will prune all unused images, containers, volumes and networks every monday at 04:30.

</p>
</details>

## Automatic updates with Watchtower

[Watchtower](https://github.com/containrrr/watchtower/) is a service that can automatically find and apply updates to docker images.

### Setup

<details><summary>Click to expand</summary>
<p>

To get started, make a directory:

```bash
sudo mkdir /docker/watchtower
```

Now make a `docker-compose.yml` file:

```bash
sudo nano /docker/watchtower/docker-compose.yml
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
    name: <network-name>
```

Save and exit, now start Watchtower with:

```bash
cd /docker/watchtower && sudo docker compose up -d
```

If everything works as expected, Watchtower will check for new docker images every night at 04:00. If it finds any, it will download the image, stop the service, apply the new image, start tthe service and finally remove the old image.

</p>
</details>

### Gotify integration

<details><summary>Click to expand</summary>
<p>

We will have Gotify notify us whenever Watchtower updated a Docker image. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Watchtower and take note of the token. Next, let us edit Watchtowers `docker-compose.yml` file:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the following lines to the `environment` list:

```yml
      - WATCHTOWER_NOTIFICATIONS=gotify
      - WATCHTOWER_NOTIFICATION_GOTIFY_URL=<gotify-url>
      - WATCHTOWER_NOTIFICATION_GOTIFY_TOKEN=<gotify-token>
      - WATCHTOWER_NOTIFICATIONS_LEVEL=info
      - WATCHTOWER_NO_STARTUP_MESSAGE=true
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Dynamic DNS with ddns-updater

[ddns-updater](https://github.com/qdm12/ddns-updater) is a dynamic DNS service that will regularly check our public IP address and convey any changes to our registrar.

### Prerequisite

<details><summary>Click to expand</summary>
<p>

You will need a domain name for this section. I will be using [Njalla](https://njal.la/), but there are plenty of options to choose from. 

To start, log into Njalla and add a new DNS record to your domain. This new record should be of type **DYNAMIC** and named **\***, this will create a dynamic wildcard domain. Njalla will provide us with the key we need to update the IP address of the DNS record, if you're using another registrar they might have other ways of conveying IP-changes.

</p>
</details>

### Setup

<details><summary>Click to expand</summary>
<p>

Create the directory structure:

```bash
sudo mkdir -p /docker/ddns-updater/data
```

Create a configuration file:

```bash
sudo nano /docker/ddns-updater/data/config.json
```

Now configure it according to the official ddns-updater [documentation](https://github.com/qdm12/ddns-updater/blob/master/docs/njalla.md), replacing domain and key with your own:

```json
{
  "settings": [
    {
      "provider": "njalla",
      "domain": "<domain>.<tld>",
      "host": "*",
      "key": "key",
      "ip_version": "ipv4",
      "provider_ip": true
    }
  ]
}
```

Save and exit. Now lets create a `docker-compose.yml` file:

```bash
sudo nano /docker/ddns-updater/docker-compose.yml
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
    name: <network-name>
```

Save and exit. Now it's time to configure permissions:

```bash
cd /docker/ddns-updater
```

```bash
sudo chown -R 1000 data && sudo chmod 700 data && sudo chmod 400 data/config.json
```

You should now be able to start ddns-updater by running:

```bash
cd /docker/ddns-updater && sudo docker compose up -d
```

Check that everything is working by visting `<server-ip>:8000` in your browser, you should see a `Success` message under `Update status`.

</p>
</details>

### Gotify integration

<details><summary>Click to expand</summary>
<p>

ddns-updater have [shoutrrr](https://containrrr.dev/shoutrrr/v0.5/services/gotify/) support, as such we can recieve Gotify notifications. Start by visiting Gotify and generate a new token for ddns-updater, then open the `docker-compose.yml` file:

```
sudo nano /docker/ddns-updater/docker-compose.yml
```

Add a new environment variable:

```yml
      - SHOUTRRR_ADDRESSES=gotify://<subdomain>.<domain>.<tld>/<token>
```

Save and exit. Rebuild the image:

```
cd /docker/ddns-updater && sudo docker compose up -d --build
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> ddns-updater
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Reverse proxy with Nginx Proxy Manager

[Nginx Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager) combines the true and tested reverse proxy [Nginx](https://www.nginx.com/) with an easy-to-use GUI. It also makes SSL certificates easy with [Let's Encrypt](https://letsencrypt.org/) integration.

### Prerequisite

<details><summary>Click to expand</summary>
<p>

Up until this point we have only been able to access our server while on the same local network, to access it remotely we will utilize a custom domain.

To get a custom domain you will need to purchase it from a domain registrar. There are plenty of domain registrars but I've gone with [Njalla](https://njal.la/) due to their great track record and privacy policy. Their pricing is somewhat higher than their competitors, so you might consider [namecheap](https://www.namecheap.com/) if you're looking for an affordable alternative.

</p>
</details>

### Setup

<details><summary>Click to expand</summary>
<p>

To get started, let's create a Docker network:

```bash
sudo docker network create <network-name>
```

Then, create a directory:

```bash
sudo mkdir -p /docker/nginx_proxy_manager/data
```

Now create a `docker-compose.yml` file:

```bash
sudo nano /docker/nginx_proxy_manager/docker-compose.yml
```

Paste the following:

```yml
version: "3"
services:
  nginx:
    image: jc21/nginx-proxy-manager:latest
    container_name: nginx_proxy_manager
    ports:
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
    name: <network-name>
```

Save and exit. You should now be able to start Nginx proxy manager by running:

```bash
cd /docker/nginx_proxy_manager && sudo docker compose up -d
```

It will take couple of seconds to set up. It might not return terminal control to you afterwards, in that case exit the process with `ctrl-z`. Check that everything is working by typing `<server-ip>:81` in your browser. Log in with the default email and password:

```
Email:    admin@example.com
Password: changeme
```

On your first log-in you will be prompted to change the username and password.

Now let's make a remotely accessible log-in page for our Nginx Proxy Manager. First you need to enable port forwarding on your router for port `80` and `443` by following the manual provided with your router. When you've configured port-forwarding you can go to the Proxy Hosts tab and add a new Proxy Host with something like this:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  nginx_proxy_manager
Forward Port:           81
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and go to `<subdomain>.<domain>.<tld>`, you should be greeted with a log-in page. While you're here, go to `Settings → Default site →  Edit` and change it from `Congratulations Page` to `404 page`.

</p>
</details>

### Wildcard SSL certificate

<details><summary>Click to expand</summary>
<p>

A wildcard certificate will make it easier to deploy and manage SSL certificates for our internet-accessible services. A wildcard certificate means that we have a single certificate for all services as supposed to a unique certificate for each service. Our ownership of a domain is established with a so called [DNS Challenge](https://letsencrypt.org/docs/challenge-types/#dns-01-challenge). As a new certificate is not requested for each service, a positive side-effect is that our subdomains will not be indexed by services such as [DNS dumpster](https://dnsdumpster.com/).

This increase in ease-of-use and privacy comes at a trade-off, we're creating a central point of failure that can be detrminental to our security. For more information on the dangers of wildcard certifications, read [this article from Bleeping Computer](https://www.bleepingcomputer.com/news/security/nsa-warns-of-wildcard-certificate-risks-provides-mitigations/).

If you feel comfortable using a wildcard certificate, get started by logging in to Njalla and visit your [API settings](https://njal.la/settings/api/). Click on `Add token` and enter the following information:

```
Name: <a-rememberable-name>
From: xxx.xxx.xxx.0/32
```

Where `xxx.xxx.xxx.0` is our network prefix in [CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation). We're adding this field to ensure only API calls made from our subnet are allowed. We could narrow this even further to only include our current public IP address, but this would make us unable to renew certificates after an IP change. When done, save and click on `Manage`. Take note of the API token for the next section.

Now go to Nginx Proxy Manager and navigate to `SSL Certificates → Add SSL Certificate → Let's Encrypt` and enter the following:

```
Domain Names: *.<domain>.<tld>
Email Address for Let's Encrypt: <your-email>@<domain>.<tld>
Use a DNS Challenge: Check
    DNS Provider: Njalla
    Credentials File Content: dns_njalla_token = <your-api-token>
    Propagation Seconds:
I Agree to the Let's Encrypt Terms of Service: Check
```

When you're done, save. Finally, go to `Settings → Default Site → ... → edit`. Choose `Redirect` and enter https://www.google.com/ under the `Redirect to` field. If anyone tries to access a subdomain that does not exist they will now be redirected to Google instead.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First identify Nginx Proxy Manager's `proxy-host_access.log`:

```bash
grep -r '/docker/nginx_proxy_manager/data/logs' -e '<subdomain>.'
```

In my case it was `proxy-host-1_access.log`. Now make a `.local` file:

```bash
sudo nano /etc/fail2ban/jail.d/nginx_proxy_manager.local
```

Paste:

```
[nginx_proxy_manager]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = nginx_proxy_manager
maxretry = 3
bantime = -1
findtime = 86400
logpath = /docker/nginx_proxy_manager/data/logs/proxy-host-1_access.log
action = iptables-allports[name=nginx_proxy_manager, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/nginx_proxy_manager.conf
```

Paste the following:

```
[Definition]
failregex = .*401 401 - POST.*\[Client <ADDR>\]
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/nginx_proxy_manager/data/logs/proxy-host-1_access.log /etc/fail2ban/filter.d/nginx_proxy_manager.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status nginx_proxy_manager
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> nginx
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Notifications with Gotify

[Gotify](https://gotify.net/) is a self-hosted notification server, which will be used to alert us of important server events.

### Setup

<details><summary>Click to expand</summary>
<p>

Start by making the directory structure:

```bash
sudo mkdir -p /docker/gotify/data
```

Then create a `docker-compose.yml` file:

```bash
sudo nano /docker/gotify/docker-compose.yml
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
    name: <network-name>
```

Save and exit. Now run:

```bash
cd /docker/gotify && sudo docker compose up -d
```

Go to Web UI at `<server-ip>:1245` and log in with the default credentials:

```
Username: admin
Password: admin
```

Next, go to `USERS → CREATE USER` and make a user account. Finish up by removing the default user.

</p>
</details>

### Customization

<details><summary>Click to expand</summary>
<p>

By default all notifications will use Gotify's own icon. To add some flair, upload your own icons by clicking on the upload icon to the left of the `Name` field.

![Gotify screenshot](https://github.com/Stylback/home-server/blob/main/media/gotify_screenshot.png?raw=true)

</p>
</details>

### Nginx Proxy Manager integration

<details><summary>Click to expand</summary>
<p>

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  gotify
Forward Port:           80
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      Yes
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and go to `<subdomain>.<domain>.<tld>` to make sure everything works as intended.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

By default Gotify lets Docker handle its logs, to make it write to a file we need to add an entrypoint to the `docker-compose.yml` file like so:

```bash
sudo nano /docker/gotify/docker-compose.yml
```

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

```bash
cd /docker/gotify && sudo docker compose up -d --build
```

Gotify will now write logs to a `gotify.log` file in our `/data` folder. Next, make a `.local` file:

```bash
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
logpath = /docker/gotify/data/gotify.log
action = iptables-allports[name=gotify, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/gotify.conf
```

Paste the following:

```
[Definition]
failregex = ^.*\| 401 \|.*\|  <ADDR> \| POST.*
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/gotify/data/gotify.log /etc/fail2ban/filter.d/gotify.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status gotify
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> gotify
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Multimedia streaming with Jellyfin

[Jellyfin](https://jellyfin.org/) is a self-hosted multimedia streaming server.

### Prerequisite

<details><summary>Click to expand</summary>
<p>

Create the directory structure for your media library:

```bash
sudo mkdir -p /library/{torrents/{prowlarr,radarr,sonarr},media/{books,movies,shows}}
```

Now configure directory permissions with:

```bash
sudo chown -R $USER:$USER /library && sudo chmod -R a=,a+rX,u+w,g+w /library
```

</p>
</details>

### Setup

<details><summary>Click to expand</summary>
<p>

We will be using [Hotios Jellyfin image](https://hotio.dev/containers/jellyfin/). Start by creating the directory:

```bash
sudo mkdir /docker/jellyfin
```

Then make a `docker-compose.yml` file:

```bash
sudo nano /docker/jellyfin/docker-compose.yml
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
      - /library/media:/media
    devices:
      - /dev/dri:/dev/dri
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit. You can now start it with:

```bash
cd /docker/jellyfin && sudo docker compose up -d
```

Wait a bit while everything is being prepared. When done, go to `[local IP]:8096` and follow the start-up guide. 

</p>
</details>

### Media transfer and streaming

<details><summary>Click to expand</summary>
<p>

Jellyfin is up and running but we still need to test media streaming. If you got some media files ready on your computer, you can copy them over with the [scp command](https://www.unix.com/man-page/Linux/1/SCP/). The syntax is as follows:

```bash
scp <local-file> <remote-host>:/path/to/remote_file
```

Let's say you have vacation videos in your local Videos folder, you could copy them over like this:

```bash
scp -r /home/user/Videos/Vacations/ username@hostname:/library/media/movies/Vacations/
```

Once your media-files are copied they will be automatically added to your Jellyfin library. This process might take a couple of minutes, if you want to force a new check you can do so in the settings. Once they are detected, try to stream them.

</p>
</details>

### Hardware acceleration

<details><summary>Click to expand</summary>
<p>

Our J5040 have extensive hardware support for different encoders thanks to _Intel QuickSync_. This will enable us to stream large media files at a lower bitrate, saving bandwidth at the cost of processing power. This process can either be done with software (high CPU usage) or hardware (low CPU usage). To enable the full range of hardware accelerated transcoding we will first need to enable either the GuC or the HuC firmware, as they are disabled by default for Intel processors of 10th generation and earlier. You can read more about GuC/HuC firmware on the [Archlinux Wiki](https://wiki.archlinux.org/title/Intel_graphics). 

To get started with hardware acceleration, make a `modprobe` config file:

```bash
sudo nano /etc/modprobe.d/i915.conf
```

Paste:

```bash
options i915 enable_guc=2
```

The J5040 does not support enabling both GuC and HuC at the same time, as such we will use `enable_guc=2` to only enable HuC. If your hardware supports simultaneous GuC and HuC you can enable both with `enable_guc=3`. Save, exit and rebuild the grub boot entry:

```bash
sudo update-initramfs -u
```

Reboot:

```bash
sudo reboot
```

Check that HuC is authenticated:

```bash
sudo dmesg | grep -ie guc -ie huc
```

Which should return something like:

```
Setting dangerous option enable_guc - tainting kernel
i915 [drm] GuC firmware i915/glk_guc_62.0.0.bin version 62.0 submission:disabled
i915 [drm] GuC SLPC: disabled
i915 [drm] HuC firmware i915/glk_huc_4.0.0.bin version 4.0 authenticated:yes
```

Now go to Jellyfin `Settings → Dashboard → Playback → Transcoding`. The following encode settings are supported by the J5040:

![Jellyfin encoding settings for the J5040](https://github.com/Stylback/home-server/blob/main/media/jellyfin_encoding.png?raw=true)

Finally, enable `Throttle Transcodes` at the bottom of the page and save.

</p>
</details>

### Customization

<details><summary>Click to expand</summary>
<p>

Jellyfin supports [custom CSS](https://jellyfin.org/docs/general/clients/css-customization.html), you can either create your own or import one from the community. I will be using a modified version of the **Kaleidochromic** preset from the [Ultrachromic](https://github.com/CTalvio/Ultrachromic) project:

```css
@import url('https://cdn.jsdelivr.net/gh/CTalvio/Ultrachromic/presets/kaleidochromic_preset.css');

/* Hide More Like This */
#similarCollapsible { display: none; }
```

The Custom CSS setting can be found at `Dashboard → General → Custom CSS`. I had to restart the Jellyfin container for the settings to take effect.

</p>
</details>

### Nginx Proxy Manager integration

<details><summary>Click to expand</summary>
<p>

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  jellyfin
Forward Port:           8096
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      Yes
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and go to `<subdomain>.<domain>.<tld>` to make sure everything works as intended.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First make a `.local` file:

```bash
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
logpath = /docker/jellyfin/config/log/*.log
action = iptables-allports[name=jellyfin, chain=DOCKER-USER]
         gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/jellyfin.conf
```

Paste:

```
[Definition]
failregex = ^.*Authentication request for .* has been denied \(IP: "<ADDR>"\)\.
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match a log with your filter:

```
fail2ban-regex /docker/jellyfin/config/log/log_<date>.log /etc/fail2ban/filter.d/jellyfin.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status jellyfin
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> jellyfin
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## VPN stack with Gluetun and qBittorrent

[Gluetun](https://github.com/qdm12/gluetun) is a lightweight and versatile VPN client which we will be using to handle network traffic for [qBittorrent](https://github.com/qbittorrent/qBittorrent).

### Prerequisite

<details><summary>Click to expand</summary>
<p>

You will need a VPN provider for this section. I will be using [Mullvad](https://mullvad.net/en/) but there are plenty of [other](https://www.privacyguides.org/vpn/) providers to choose from, just remember to change Gluetun settings accordingly.

Start by logging into your Mullvad account and generate a [Wireguard configuration file](https://mullvad.net/en/account/#/login?next=/wireguard-config). Choose cities and servers as desired and download the configuration. Unzip them and get all the [relevant](https://github.com/qdm12/gluetun/discussions/805#discussioncomment-2026642) information from inside the text files.

</p>
</details>

### Initial setup

<details><summary>Click to expand</summary>
<p>

To get started, make the directory structure:

```bash
sudo mkdir -p /docker/gluetun_stack/{gluetun,qbittorrent}
```

Now make a `docker-compose.yml` file:

```bash
sudo nano /docker/gluetun_stack/docker-compose.yml
```

Paste the following:

```yml
version: "3"
services:

    gluetun:
        image: qmcgaw/gluetun:latest
        container_name: gluetun
        cap_add:
            - NET_ADMIN
        devices:
            - /dev/net/tun:/dev/net/tun
        ports:
            - 8080:8080 # qBittorrent Web UI
            - 6881:6881 # qBittorrent
            - 6881:6881/udp # qBittorrent
            - 8888:8888/tcp # HTTP proxy
            - 8388:8388/tcp # Shadowsocks
            - 8388:8388/udp # Shadowsocks
        environment:
            - VPN_SERVICE_PROVIDER=mullvad
            - VPN_TYPE=wireguard
            - WIREGUARD_PRIVATE_KEY=<private-key>
            - WIREGUARD_ADDRESSES=<wireguard-ip-subnet>
            - SERVER_CITIES=<server-cities>
            - TZ=Europe/Stockholm
            - FIREWALL_OUTBOUND_SUBNETS=<local-ip-subnet>
            - DOT=off
        volumes:
             - ./gluetun:/gluetun

    qbittorrent:
        image: lscr.io/linuxserver/qbittorrent:latest
        container_name: qbittorrent
        environment:
            - PUID=1000
            - PGID=1000
            - TZ=Europe/Stockholm
            - WEBUI_PORT=8080
        volumes:
            - ./qbittorrent:/config
            - /library/torrents:/torrents
        network_mode: 'service:gluetun'
        depends_on:
            - gluetun

networks:
  default:
    name: <network-name>
```

Save and exit, bring the stack up with:

```bash
cd /docker/gluetun_stack && sudo docker compose up -d
```

</p>
</details>

### Gluetun

<details><summary>Click to expand</summary>
<p>

Check that you're connected to Mullvad and that no errors are thrown:

```bash
sudo docker logs gluetun
```

Which should end on the following:

```
[...]
INFO [routing] default route found: interface eth0, gateway [Docker-IP] and assigned IP [Docker-IP]
INFO [routing] adding route for 0.0.0.0/0
INFO [firewall] setting allowed subnets...
INFO [routing] default route found: interface eth0, gateway [Docker-IP] and assigned IP [Docker-IP]
INFO [routing] adding route for [local-IP-subnet]
INFO [dns over tls] using plaintext DNS at address 1.1.1.1
INFO [http proxy] listening on :8888
INFO [http server] http server listening on [::]:8000
INFO [healthcheck] listening on 127.0.0.1:9999
INFO [firewall] allowing VPN connection...
INFO [wireguard] Using available kernelspace implementation
INFO [wireguard] Connecting to [Mullvad-IP]
INFO [wireguard] Wireguard is up
INFO [ip getter] Public IP address is [Mullvad-IP] ([location])
INFO [vpn] You are running on the bleeding edge of latest!
INFO [healthcheck] healthy!
```

Next, check that the HTTP proxy is working as intended:

```bash
sudo curl -x http://:@<server-ip>:8888 https://ipv4.am.i.mullvad.net/connected
```

Which should return:

```bash
You are connected to Mullvad (<mullvad-server>). Your IP address is <mullvad-ip>
```

</p>
</details>

### qBittorrent

<details><summary>Click to expand</summary>
<p>

Visit qBittorrent's Web UI at `<local-IP>:8080`, log in using the default credentials:

```
Username: admin
Password: adminadmin
```

Now go to `Tools → Options`, do the following and save:

| Tab | Setting |
| --- | --- |
| Downloads | Change `Default Torrent Management Mode` to `Automatic` |
| Downloads | Change `Default save path` to `/library/torrents` |
| Connection | Set `Peer connection protocol` to `TCP` |
| Connection | Randomize `Listening port` |
| Speed | Set `Rate Limits` as desired |
| Bittorrent | Disable `Local Peer Discovery` |
| Bittorrent | Enable `Seeding Limits` as desired |
| Bittorrent | Set to `Pause Torrent` on reaching Seeding Limit |
| Web UI | Change `Username` and `Password` |
| Advanced | Change `Network interface` to `tun0` |
| Advanced | Set `Optional IP address to bind to` to same as `WIREGUARD_ADDRESSES` variable |
| Advanced | Enable `Reannounce to all trackers when IP or port changed` |

Finally, visit [Torguard's torrent IP checker](https://torguard.net/checkmytorrentipaddress.php), right click on the download button and copy the link (keep the window open). In qBittorrent, go to `File → Add Torrent Link`, paste and click on `Download`. After a couple of seconds your Mullvad IP should display on the Torguard website.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First go to `Tools → Options → Web UI → Ban client after consecutive failures` and set it to `0`. Next, make a `.local` file:

```bash
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
logpath = /docker/gluetun_stack/qbittorrent/qBittorrent/logs/qbittorrent.log
action = iptables-allports[name=qbittorrent, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/qbittorrent.conf
```

Paste the following:

```
[Definition]
failregex = \(W\).*WebAPI login failure. Reason: invalid credentials.*::ffff:<ADDR>
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```bash
fail2ban-regex /docker/gluetun_stack/qbittorrent/qBittorrent/logs/qbittorrent.log /etc/fail2ban/filter.d/qbittorrent.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status qbittorrent
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker images we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container names like so:

```yml
    ...
    command: watchtower <other containers> gluetun qbittorrent
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Indexers with Prowlarr

[Prowlarr](https://github.com/Prowlarr/Prowlarr/) is an indexer manager that integrates with other *arr-apps. 

### Setup

<details><summary>Click to expand</summary>
<p>

We will be using [hotio's](https://hotio.dev/containers/prowlarr/) Docker image, get started by making the directory structure:

```bash
sudo mkdir -p /docker/prowlarr/config
```

Make a `docker-compose.yml` file:

```bash
sudo nano /docker/prowlarr/docker-compose.yml
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
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/prowlarr && sudo docker compose up -d
```

Visit Prowlarr's web ui at `<server-ip>:9696` and configure it. Add indexers, there are a [huge](https://wiki.servarr.com/prowlarr/supported-indexers) list to choose from. 

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First make a `.local` file:

```bash
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
logpath = /docker/prowlarr/config/logs/prowlarr.txt
action = iptables-allports[name=prowlarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/prowlarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/prowlarr/config/logs/prowlarr.txt /etc/fail2ban/filter.d/prowlarr.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status prowlarr
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> prowlarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Movies with Radarr

[Radarr](https://github.com/Radarr/Radarr) is a a movie collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

### Setup

<details><summary>Click to expand</summary>
<p>

We will be using [hotio's](https://hotio.dev/containers/radarr/) Docker image, start by making the directory structure:

```bash
sudo mkdir -p /docker/radarr/config
```

Make a `docker-compose.yml` file:

```bash
sudo nano /docker/radarr/docker-compose.yml
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
      - /library:/library
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/radarr && sudo docker compose up -d
```

Now visit Radarr's web-ui at `<server-ip>:7878` and configure it.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First make a `.local` file:

```bash
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
logpath = /docker/radarr/config/logs/radarr.txt
action = iptables-allports[name=radarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/radarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/radarr/config/logs/radarr.txt /etc/fail2ban/filter.d/radarr.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status radarr
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> radarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## TV-shows with Sonarr

[Sonarr](https://github.com/Sonarr/Sonarr) is a a TV-shows and series collection manager. It allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library.

### Setup

<details><summary>Click to expand</summary>
<p>

We will be using [hotio's](https://hotio.dev/containers/sonarr/) Docker image, start by making the directory structure:

```bash
sudo mkdir -p /docker/sonarr/config
```

Make a `docker-compose.yml` file:

```bash
sudo nano /docker/sonarr/docker-compose.yml
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
      - /library:/library
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/sonarr && sudo docker compose up -d
```

Now visit Sonarr's web-ui at `<server-ip>:8989` and configure it. 

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First make a `.local` file:

```bash
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
logpath = /docker/sonarr/config/logs/sonarr.txt
action = iptables-allports[name=sonarr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/sonarr.conf
```

Paste the following:

```
[Definition]
failregex = .*\|Warn\|Auth\|Auth-Failure ip <ADDR>
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/sonarr/config/logs/sonarr.txt /etc/fail2ban/filter.d/sonarr.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status sonarr
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> sonarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Subtitles with Bazarr

[Bazarr](https://github.com/morpheus65535/bazarr) is a subtitle downloader and manager, it integrates natively with Radarr and Sonnar.

### Setup

<details><summary>Click to expand</summary>
<p>

We will be using [hotio's](https://hotio.dev/containers/bazarr/) Docker image, get started by making the directory structure:

```bash
sudo mkdir -p /docker/bazarr/config
```

Now make a `docker-compose.yml` file:

```bash
sudo nano /docker/bazarr/docker-compose.yml
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
      - /library:/library
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/bazarr && sudo docker compose up -d
```

Now visit Bazarr's web-ui at `<server-ip>:6767`. Start by making a language profile and add subtitle providers, then connect to Radarr and Sonarr.

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> bazarr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Request media with Jellyseerr

[Jellyseerr](https://github.com/Fallenbagel/jellyseerr) is a request manager for Jellyfin, it allows us and other users to discover and request media.

### Setup

<details><summary>Click to expand</summary>
<p>


Start by making the directory structure:

```bash
sudo mkdir -p /docker/jellyseerr/config
```

Make a `docker-compose.yml` file:

```bash
sudo nano /docker/jellyseerr/docker-compose.yml
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
            - /library:/library
       restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/jellyseerr && sudo docker compose up -d
```

Now visit Jellyseerr's web-ui at `<server-ip>:5055`. Log in using your Jellyfin account and follow the start-up guide.

</p>
</details>

### Nginx Proxy Manager integration

<details><summary>Click to expand</summary>
<p>

Go to Nginx Proxy Manager and make a new Proxy Host Entry:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  jellyseerr
Forward Port:           5055
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and go to `<subdomain>.<domain>.<tld>` to make sure everything works as intended.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

First you need to enable proxy support in Jellyseerr. Navigate to `Settings → Enable Proxy Support`, enable it and rebuild the container:

```bash
cd /docker/jellyseerr && sudo docker compose up -d --build
```

Now make a `.local` file:

```bash
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
logpath = /docker/jellyseerr/config/logs/overseerr.log
action = iptables-allports[name=jellyseerr, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/jellyseerr.conf
```

Paste the following:

```
[Definition]
failregex = .*\[info\]\[Auth\]\: Failed login attempt.*"ip":"<ADDR>"
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/jellyseerr/config/logs/overseerr.log /etc/fail2ban/filter.d/jellyseerr.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status jellyseerr
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> jellyseerr
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

### Gotify integration

<details><summary>Click to expand</summary>
<p>

We will have Gotify send us a notification whenever a user makes a media request or if there is an issue in the request process. To start, visit Gotify and go to `APPS → CREATE APPLICATION`. Create a new application for Jellyseerr and take note of the token.

Jellyseerr have native Gotify integration, as such we can simply enable it in the settings. Go to `Settings → Notifications → Gotify`, enable the agent and enter your URL and application token. Next, choose what kind of notifications you want and save.

</p>
</details>

## RSS feeds with FreshRSS

[FreshRSS](https://github.com/FreshRSS/FreshRSS) is a self hosted feed aggregator with support for both RSS feeds and web scraping. FreshRSS's API is also supported by many third party clients.

### Setup

<details><summary>Click to expand</summary>
<p>

We will use the [official Docker image](https://github.com/FreshRSS/FreshRSS/tree/edge/Docker), start by making the directory structure:

```bash
sudo mkdir /docker/freshrss
```

Then make the `docker-compose.yml` file:

```bash
sudo nano /docker/freshrss/docker-compose.yml
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
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/freshrss && sudo docker compose up -d
```

Go to `<server-ip>:8088` and follow the installation guide.

</p>
</details>

### Clients

<details><summary>Click to expand</summary>
<p>

To access our feed outside of the web UI we need a third-party client with FreshRSS support, we also need to enable API access. Go to `Configure → Authentication → Allow API access` and enable it, then go to `Configure → Profile → API Management` and enter an API password.

Next, download one of the [third-party clients](https://github.com/FreshRSS/FreshRSS/blob/edge/README.md#apis--native-apps) and log in using your username and API password.

</p>
</details>

### Fetch full articles

<details><summary>Click to expand</summary>
<p>

Some feeds will not serve you the full article by default, instead often asking you to visit the full site after the first paragraph. If you don't like this type of interaction you can instead opt for the `Article CSS selector` tool. 

To start, visit the feed that serves you truncated articles, right click anywhere on the page and choose `Inspect`. In the menu, try to identify the HTML/CSS-class that contains the article. Common classes are `article`, `article_section` and `article-body`. When you have identified the class, click on the options icon next to the feed and go to `Manage → Article CSS selector on original website`. Paste the classname in the box starting with a dot like so: `.article_section`. Press the little eye next to the box to get a preview.

You can extend this to exclude certain classes as well, such as a comment section at the end of an article. Just add the relevant class to the `CSS selector of the elements to remove` option.

</p>
</details>

### Nginx Proxy Manager integration

<details><summary>Click to expand</summary>
<p>

Make a new Proxy Host Entry:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  freshrss
Forward Port:           80
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and go to `<subdomain>.<domain>.<tld>` to make sure everything works as intended.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

Before we can start using Fail2ban we need to make some configurations to FreshRSS, start by creating a `log` directory:

```sh
sudo mkdir /docker/freshrss/logs
```

Next, create a `log.conf` file:

```sh
sudo nano /docker/freshrss/logs/log.conf
```

Paste the following config from [Alkarex](https://github.com/FreshRSS/FreshRSS/issues/3224#issuecomment-709888315):

```sh
LogFormat "%a %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined_ip
CustomLog /var/log/apache2/freshrss.log combined_ip
```

Save and exit. Now create an empty `freshrss.log` file:

```sh
sudo touch /docker/freshrss/logs/freshrss.log
```

Open the `docker-compose.yml` file:

```sh
sudo nano /docker/freshrss/docker-compose.yml
```

Add `log.conf` and `freshrss.log` as additional volumes like so:

 ```yml
volumes:
      - ./data:/var/www/FreshRSS/data
      - ./extensions:/var/www/FreshRSS/extensions
      - ./logs/log.conf:/etc/apache2/conf-enabled/log.conf
      - ./logs/freshrss.log:/var/log/apache2/freshrss.log
```

Rebuild the image:

```sh
cd /docker/freshrss && sudo docker compose up -d --build
```

Now that FreshRSS is configured you're ready to setup Fail2ban. Make a `.local` file:

```bash
sudo nano /etc/fail2ban/jail.d/freshrss.local
```

Paste:

```
[freshrss]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = freshrss
maxretry = 3
bantime = -1
findtime = 86400
logpath = /docker/freshrss/logs/freshrss.log
action = iptables-allports[name=freshrss, chain=DOCKER-USER]
	 gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/freshrss.conf
```

Paste the following:

```sh
[Definition]
failregex = ^<ADDR>.*\"POST \/i\/\?c\=auth\&a\=login HTTP\/1\.1\" 403
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/freshrss/logs/freshrss.log /etc/fail2ban/filter.d/freshrss.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status freshrss
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container names like so:

```yml
    ...
    command: watchtower <other containers> freshrss
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Notes with Joplin

[Joplin](https://github.com/laurent22/joplin/) is a note-taking application with extensive features such as markdown support, cross-device synchronisation and end-to-end encryption.

### Setup

<details><summary>Click to expand</summary>
<p>

We will use the official [Joplin server image](https://hub.docker.com/r/joplin/server). Start by making the directory structure:

```bash
sudo mkdir /docker/joplin
```

Make the `docker-compose.yml` file:

```bash
sudo nano /docker/joplin/docker-compose.yml
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
            - APP_BASE_URL=http://<server-ip>:22300
            - DB_CLIENT=pg
            - POSTGRES_PASSWORD=<pg-password>
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
            - POSTGRES_PASSWORD=<pg-password>
            - POSTGRES_USER=joplin
            - POSTGRES_DB=joplin
        volumes:
            - ./data/postgres:/var/lib/postgresql/data
        restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, run:

```bash
cd /docker/joplin && sudo docker compose up -d
```

</p>
</details>

### Configuration

<details><summary>Click to expand</summary>
<p>

Visit the admin dashboard at `http://<server-ip>:22300` and log in with default credentials:

```
Username: admin@localhost
Password: admin
```

Start off by going to `Admin → Users → Admin` and change the admin credentials, this will "send" a confirmation email which you can find at `Admin → Emails`. Simply copy the confirmation URL and post it in your browser. Next, create a user account without admin privileges which will be used as the de-facto account.

To make our Joplin server accessible through the internet, first go to Nginx Proxy Manager and add a proxy host with the following configuration:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  joplin
Forward Port:           443
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Next, update Joplin's `docker-compose.yml` file:

```bash
sudo nano /docker/joplin/docker-compose.yml
```

Change the ports and `APP_BASE_URL` like so:

```yml
        ports:
            - 22300:443
        environment:
            - APP_BASE_URL=https://<subdomain>.<domain>.<tld>
            - APP_PORT=443
```

Save and exit, rebuild the image:

```bash
cd /docker/joplin && sudo docker compose up -d --build
```

Now go to `https://<subdomain>.<domain>.<tld>` to see that it's accessible. 

To start using our Joplin server, download a [Joplin client](https://joplinapp.org/help/#installation) on your desktop and/or mobile device. On your client, go to `Tools → options → Synchronisation` and choose `Joplin server` from the dropdown menu. Fill out the rest of the forms with your credentials, take care to enter the full URL as so: `https://<subdomain>.<domain>.<tld>`. Press the `Check synchronisation configuarion` to make sure everything works before applying the settings.

For added security, go to `Tools → options → Encryption` and enable end-to-end encryption. For increased privacy, go to `Tools → options → Note` and disable `Save geo-location with notes`.

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container names like so:

```yml
    ...
    command: watchtower <other containers> joplin joplin-db
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## Ebooks with Calibre and Calibre-Web

[Calibre](https://calibre-ebook.com/) is a tried-and-trusted eBook library manager. We will be using it in conjunction with [Calibre-Web](https://github.com/janeczku/calibre-web), which will allows us to sync our library with an eReader.

### Prerequisite

<details><summary>Click to expand</summary>
<p>

Make the directory structure:

```bash
sudo mkdir -p /docker/calibre_stack/{calibre,calibre-web,library}
```

Configure permissions for the common library:

```bash
sudo chown $USER:$USER /docker/calibre_stack/library && sudo chmod a=,a+rX,u+w,g+w /docker/calibre_stack/library
```

</p>
</details>

### Calibre

<details><summary>Click to expand</summary>
<p>

We will be using the [LinuxServer.io image](https://github.com/linuxserver/docker-calibre). Make the `docker-compose.yml` file:

```bash
sudo nano /docker/calibre_stack/calibre/docker-compose.yml
```

Paste:

```yml
version: "3"
services:
  calibre:
    image: lscr.io/linuxserver/calibre:latest
    container_name: calibre
    ports:
      - 6080:8080
      - 6081:8081
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - /library/media/books:/books
      - /docker/calibre_stack/library:/library
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/calibre_stack/calibre && sudo docker compose up -d
```

Go to the web UI at `<server-ip>:6080` and choose `/library` as the Calibre library folder. To import books to your Calibre library, go to `Add books (arrow down) → Add from folders and sub-folders` and choose `/books`.

</p>
</details>

### Calibre-Web

<details><summary>Click to expand</summary>
<p>

We will be using the [LinuxServer.io image](https://github.com/linuxserver/docker-calibre-web). Make the `docker-compose.yml` file:

```bash
sudo nano /docker/calibre_stack/calibre-web/docker-compose.yml
```

Paste:

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
    volumes:
      - ./config:/config
      - /docker/calibre_stack/library:/library
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, start it with:

```bash
cd /docker/calibre_stack/calibre-web && sudo docker compose up -d
```

Go to the web UI at `<server-ip>:8083` and log in using the default credentials:

```
Username: admin
Password: admin123
```

On the initial setup screen, enter `/library` as your Calibre library location. To change the default credentials, go to `Admin → admin`.

</p>
</details>

### Nginx Proxy Manager integration

<details><summary>Click to expand</summary>
<p>

Make a new Proxy Host Entry:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 http
Forward Hostname / IP:  calibre-web
Forward Port:           8083
Cache Assets:           Yes
Block Common Expolits:  Yes
Websocket Support:      No
Access List:            Publicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         No
HSTS Subdomains:        No
```

Save and go to `<subdomain>.<domain>.<tld>` to make sure everything works as intended.

</p>
</details>

### Kobo Sync integration

<details><summary>Click to expand</summary>
<p>

If you have an eReader from Kobo you can [configure it](https://github.com/janeczku/calibre-web/wiki/Kobo-Integration) to sync with Calibre-Web. This allows you to download books directly from your Calibre-Web instance and keep your reading progress synced.

First go to Nginx Proxy Manager and edit your Proxy Host entry for Calibre-Web. Go to the `Advanced` tab and paste the following below `Custom Nginx Configuration`:

```
   proxy_buffer_size 128k;
   proxy_buffers 4 256k;
   proxy_busy_buffers_size 256k;
```

Save. Extending the `proxy_buffer` this way is necessary due to the long message size of Calibre-Web API calls.

Next, in Calibre-web, go to `Admin → Basic Configuration → Feature Configuration` and set `Server External Port` to `80`. While you're here, check `Enable Kobo sync` before saving. Finish up by generating a sync token at `Admin → Users → Your user → Kobo Sync Token → Create/View`.

With your Calibre-Web instance ready, all that is left is to configure your Kobo e-reader device. Perform a factory reset (usually at `More → Settings → Device information → Factory reset your eReader`) and follow the setup procedure.

When you're done, plug your device into a computer and navigate to its `Kobo eReader.conf` file under `.kobo/Kobo`. Open the file in a text editor and find `api_endpoint=https://storeapi.kobo.com` under the `[OneStoreServices]` group. Replace this line with your Calibre-Web URL and sync token like so: `api_endpoint=https://<subdomain>.<domain>.<tld>/kobo/<token>`. Save and exit before unplugging the device.

You should now be able to sync. If there is an error, first run repairs in your Kobo device at `More → Settings → Device information → Repair your Kobo account` followed by forcing a full sync in Calibre-Web at `User → Force full kobo sync`.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

As we won't expose our Calibre instance to the web, we only need to integrate Calibre-Web. First make a `.local` file:

```bash
sudo nano /etc/fail2ban/jail.d/calibre-web.local
```

Paste:

```
[calibre-web]

backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = calibre-web
maxretry = 3
bantime = -1
findtime = 86400
logpath = /docker/calibre_stack/calibre-web/config/calibre-web.log
action = iptables-allports[name=calibre, chain=DOCKER-USER]
         gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/calibre-web.conf
```

Paste:

```
[Definition]
failregex = ^.*WARN.* Login failed for user.* IP address: <ADDR>
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials and then match the log with your filter:

```
fail2ban-regex /docker/calibre_stack/calibre-web/config/calibre-web.log /etc/fail2ban/filter.d/calibre-web.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status calibre-web
```

</p>
</details>

### Watchtower integration

<details><summary>Click to expand</summary>
<p>

To automatically update the docker image we need to add it to Watchtower, run:

```bash
sudo nano /docker/watchtower/docker-compose.yml
```

Add the container name like so:

```yml
    ...
    command: watchtower <other containers> calibre calibre-web
```

Save and exit. To apply the settings we need to rebuild the Watchtower image:

```bash
cd /docker/watchtower && sudo docker compose up -d --build
```

</p>
</details>

## File synchronization with Nextcloud

[Nextcloud](https://nextcloud.com/) is a self-hosted cloud platform for file synchronization, collaboration, conferencing, text chat and more. It is a versatile platform and can have its functionality extended with apps. Nextcloud offers an [All-In-One Docker image](https://github.com/nextcloud/all-in-one) for easy deployment, but I've had multiple issues getting it to play nice with Nginx Proxy Manager and as such we will be using the LinuxServer.io images for [Nextcloud](https://github.com/linuxserver/docker-nextcloud) and [MariaDB](https://github.com/linuxserver/docker-mariadb). We will configure Nextcloud for file synchronization only, but you may adapt the settings as you see fit.

### Nextcloud

<details><summary>Click to expand</summary>
<p>

Start by making the directory structure:

```bash
sudo mkdir -p /docker/nextcloud/config
```

Make the `docker-compose.yml` file:

```bash
sudo nano /docker/nextcloud/docker-compose.yml
```

Paste this modified [docker compose template](https://github.com/linuxserver/docker-nextcloud#usage):

```yml
version: "2.1"
services:
  nextcloud:
    image: lscr.io/linuxserver/nextcloud:latest
    container_name: nextcloud
    ports:
      - 4433:443 # Token port for 443 as it's already bound
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Stockholm
    volumes:
      - ./config:/config
      - /files/nextcloud:/data
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, run:

```bash
cd /docker/nextcloud && sudo docker compose up -d
```

</p>
</details>

### MariaDB

<details><summary>Click to expand</summary>
<p>

Start by making the directory structure:

```bash
sudo mkdir -p /docker/nextcloud/config
```

Make the `docker-compose.yml` file:

```bash
sudo nano /docker/nextcloud/docker-compose.yml
```

Paste this modified [docker compose template](https://github.com/linuxserver/docker-mariadb#usage):

```yml
version: "2.1"
services:
  mariadb:
    image: lscr.io/linuxserver/mariadb:latest
    container_name: mariadb
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Stockholm
      - MYSQL_ROOT_PASSWORD=<secret-password>
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=<secret-password>
    volumes:
      - ./config:/config
    ports:
      - 3306:3306
    restart: unless-stopped

networks:
  default:
    name: <network-name>
```

Save and exit, run:

```bash
cd /docker/mariadb && sudo docker compose up -d
```

</p>
</details>

### Reverse proxy configuration

<details><summary>Click to expand</summary>
<p>

Create a proxy host entry with the following settings:

```
DETAILS
Domain names:           <subdomain>.<domain>.<tld>
Scheme:                 https
Forward Hostname / IP:  nextcloud
Forward Port:           443
Cache Assets:           No
Block Common Expolits:  Yes
Websocket Support:      Yes
Access List:            Pubicly Accessible

SSL
SSL Certificate:        *.<domain>.<tld>
Force SSL:              Yes
HSTS Enabled:           Yes
HTTP/2 Support:         Yes
HSTS Subdomains:        Yes
```

Save and ensure that the Web-Ui is accessible at `<subdomain>.<domain>.<tld>`.

</p>
</details>

### Configure Nextcloud

<details><summary>Click to expand</summary>
<p>

Access the Web-UI at `<subdomain>.<domain>.<tld>`, choose a username and password for your admin account. Next, pick `MySQL/MariaDB` as your database with the following configuration:

```
Data folder: /data
Configure the database: MySQL/MariaDB
Database user: nextcloud
Database password: *****
Database name: nextcloud
Database host: mariadb:3306
```

Click on install and wait, decline to install additional apps when prompted. When your Nextcloud instance is ready the next order of business is to disable/enable some apps, go to `Apps → Active apps` and disable the following:

* Circles
* Collaborative tags
* Comments
* Contacts integration
* Dashboard
* Federation
* Monitoring
* Nextcloud announcements
* Recommendations
* Share by mail
* Support
* Usage Survey
* User status
* Weather status

Next go to `Apps → Disabled` apps and enable the following:

* Two-Factor TOTP Provider
* Default encryption module
* Brute-force settings

Now go to `Personal settings → Security`, enable Two-Factor Authentication and generate backup codes.

Next, go to Administration settings and follow the table below:

| Setting | Default | Changed to | Comment |
| --- | --- | --- | --- |
| Basic settings → Profile | Enabled | Disabled | Profiles are not necessary for our small instance. |
| Sharing → Allow apps to use the Share API → Set default expiration date for shares/servers | Disabled for both shares and servers | Enabled, 7 days, Enforce expiration date | Good security practice. |
| Sharing → Allow users to share via link and emails → Set default expiration date | Disabled | Enabled, 7 days, Enforce expiration date | Good security practice. |
| Sharing → Allow resharing | Enabled | Disabled |     |
| Sharing → Allow username autocompletion in share dialog and allow access to system address book | Some enabled | All disabled | Security and privacy. |
| Sharing → Default share permissions | All enabled | Delete and Rehsare disabled |     |
| Sharing → Federated Cloud Sharing | Some enabled | All disabled | Not necessary for our use-case. |
| Sharing → Share by mail | All enabled | All disabled | Links are sufficient for our use-case |
| Security → Enforce two-factor authentication | Disabled | Enabled | Good security practice. |
| Security → Server-side encryption | Disabled | Enabled | Good security practice. |
| Groupware → Calendar server | Some enabled | All disabled | Not necessary for our use-case. |
| Activity → Notification → Enable notification emails | Enabled | Disabled | Not necessary for our use-case. |
| Activity → Default settings → Mail | Some enabled | All disabled |  We don't have a mail-server configured   |
| Activity → Default settings → Push | Some enabled | Enable for modification of group memberships, password and emails |  Notifications should still   |

Log out and log back in to enable Server-side encryption and see that TOTP works as it should. When you feel confident, go to the [Nextcloud security scan](https://scan.nextcloud.com/) and enter your Nextcloud URL. You should recieve an A+ rating.

Finally, don't forget to personalize your Nextcloud instance in `Administration settings → Theming`. To synchronize files across devices, [download a client](https://nextcloud.com/install/) for your device.

</p>
</details>

### Fail2ban integration

<details><summary>Click to expand</summary>
<p>

For additional security it's a good idea to enable Fail2ban for Nextcloud. First make a `.local` file:

```bash
sudo nano /etc/fail2ban/jail.d/nextcloud.local
```

Paste:

```
[nextcloud]
backend = auto
enabled = true
port = 80,443
protocol = tcp
filter = nextcloud
maxretry = 3
bantime = -1
findtime = 86400
logpath = /files/nextcloud/nextcloud.log
action = iptables-allports[name=nextcloud, chain=DOCKER-USER]
	       gotify
```

Save and exit. Now make a `.conf` file:

```bash
sudo nano /etc/fail2ban/filter.d/nextcloud.conf
```

Paste the pattern directly from the [official documentation](https://docs.nextcloud.com/server/19/admin_manual/installation/harden_server.html#setup-fail2ban):

```
[Definition]
_groupsre = (?:(?:,?\s*"\w+":(?:"[^"]+"|\w+))*)
failregex = ^\{%(_groupsre)s,?\s*"remoteAddr":"<HOST>"%(_groupsre)s,?\s*"message":"Login failed:
            ^\{%(_groupsre)s,?\s*"remoteAddr":"<HOST>"%(_groupsre)s,?\s*"message":"Trusted domain error.
datepattern = ,?\s*"time"\s*:\s*"%%Y-%%m-%%d[T ]%%H:%%M:%%S(%%z)?"
```

Restart Fail2ban to apply the new settings:

```bash
sudo systemctl restart fail2ban
```

You can test your filter by first using the wrong credentials at the log-in screen and then match the log with your filter:

```
fail2ban-regex /files/nextcloud/nextcloud.log /etc/fail2ban/filter.d/nextcloud.conf --print-all-matched
```

You can also check the status of the jail with:

```bash
sudo fail2ban-client status nextcloud
```

</p>
</details>

### Further integrations

<details><summary>Click to expand</summary>
<p>

Care should be taken before enabling automatic updates for Nextcloud/MariaDB via Watchtower. A new version might break the database structure and corrupt data, please ensure you have proper data backups.

</p>
</details>

## System snapshots and data backups

If there's anything I've learned building a server and self-hosting services, it's that things *will* break. Running a command in the wrong terminal window, new docker images that aren't backwards compatible, a network miss-configuration that breaks inter-container connection etc. To remedy this it's nessecary to have a backup-solution, mine comes in three parts:

1. Local system snapshots with Timeshift
2. Local data backup with Borg
3. Backup of snapshots and data to external drive for cold storage

Even though this does not follow the [gold standard for backup strategies](https://www.techtarget.com/searchdatabackup/definition/3-2-1-Backup-Strategy) i've found it more then adequate for my small system. In this section I will write in details how I've implemented each part.

### System snapshots with Timeshift

<details><summary>Click to expand</summary>
<p>

[Timeshift](https://github.com/linuxmint/timeshift) is described as: 
>"\[...\] an application that provides functionality similar to the System Restore feature in Windows and the Time Machine tool in Mac OS. Timeshift protects your system by taking incremental snapshots of the file system at regular intervals. These snapshots can be restored at a later date to undo all changes to the system."

To get started with Timeshift, install it with:

```sh
sudo apt install timeshift
```

Now it's time to identify where you want to store your timeshift snapshots. Run `lsblk` to get an overview:

```sh
lsblk -f
```

I will use my `/backup` partition which is mounted under `sda1`. Now identify that partition in timeshift with:

```sh
sudo timeshift --list-devices
```

When you've identified the partition, pick it as your backup device with:

```sh
sudo timeshift --snapshot-device <partition>
```

Next, open the Timeshift config file:

```sh
sudo nano /etc/timeshift/timeshift.json
```

Under `exclude`, add drives/directories that you don't want to include in a snapshot. In my case I don't want to include user files, the `/files` partition nor the `/library` partiton. Specify your desired combinations of scheduled snapshots and how many snapshots of each kind you wish to retain.

```json
{
  "backup_device_uuid" : "...",
  "parent_device_uuid" : "...",
  "do_first_run" : "false",
  "btrfs_mode" : "false",
  "include_btrfs_home_for_backup" : "false",
  "include_btrfs_home_for_restore" : "false",
  "stop_cron_emails" : "true",
  "btrfs_use_qgroup" : "true",
  "schedule_monthly" : "false",
  "schedule_weekly" : "true",
  "schedule_daily" : "true",
  "schedule_hourly" : "false",
  "schedule_boot" : "false",
  "count_monthly" : "0",
  "count_weekly" : "4",
  "count_daily" : "7",
  "count_hourly" : "0",
  "count_boot" : "0",
  "snapshot_size" : "0",
  "snapshot_count" : "0",
  "date_format" : "%Y-%m-%d %H:%M:%S",
  "exclude" : [
    "/home/<user>/**",
    "/library/**",
    "/files/**"
  ],
  "exclude-apps" : []
}
```

Save and exit. Create your first snapshot with:

```sh
sudo timeshift --check
```

#### Useful commands

Here are a few useful commands from the Timeshift manpage I've found myself using from time to time.

List all snapshots:

```sh
sudo timeshift --list
```

Create a manual snapshot with a comment:

```sh
sudo timeshift --create --comments "text"
```

Restore from a specific snapshot:

```sh
sudo timeshift --restore --snapshot 'YYYY-MM-DD_HH-MM-SS'
```

Delete a specific snapshot:

```sh
sudo timeshift --delete --snapshot 'YYYY-MM-DD_HH-MM-SS'
```

</p>
</details>

### Data backup with Borg

<details><summary>Click to expand</summary>
<p>

[Borg](https://www.borgbackup.org/) is a utility to create encrypted, space efficient data backups. It is similar to Timeshift in the way that it avoids duplication of unchanged files during backups.

To get started, install Borg with:

```sh
sudo apt install borgbackup
```

Next, initialize a repository in the `/backup` partition:

```sh
sudo borg init --make-parent-dirs --encryption=repokey-blake2 /backup/borg
```

Enter a secure passphrase when prompted. Create a script to automate the backup process by following the [official template](https://borgbackup.readthedocs.io/en/1.2-maint/quickstart.html#automating-backups):

```sh
sudo nano /usr/local/bin/borg_backup.sh
```

Here the difference from the template is the addition of `/files` and `/docker`, removal of `/var` and the substition of `--verbose` with `--progress`. In addition, the default `prune` values have been slightly changed.

```sh
#!/bin/sh

# Setting this, so the repo does not need to be given on the commandline:
export BORG_REPO=/backup/borg

# See the section "Passphrase notes" for more infos.
export BORG_PASSPHRASE='<passphrase>'

# some helpers and error handling:
info() { printf "\n%s %s\n\n" "$( date )" "$*" >&2; }
trap 'echo $( date ) Backup interrupted >&2; exit 2' INT TERM

info "Starting backup"

# Backup the most important directories into an archive named after
# the machine this script is currently running on:

borg create                         \
    --progress                      \
    --filter AME                    \
    --list                          \
    --stats                         \
    --show-rc                       \
    --compression lz4               \
    --exclude-caches                \
    --exclude 'home/*/.cache/*'     \
                                    \
    ::'{hostname}-{now}'            \
    /etc                            \
    /home                           \
    /root                           \
    /docker                         \
    /files

backup_exit=$?

info "Pruning repository"

# Use the `prune` subcommand to maintain 7 daily and 4 weekly
# archives of THIS machine. The '{hostname}-*' matching is very important to
# limit prune's operation to this machine's archives and not apply to
# other machines' archives also:

borg prune                          \
    --list                          \
    --glob-archives '{hostname}-*'  \
    --show-rc                       \
    --keep-daily    7               \
    --keep-weekly   4               \
    --keep-monthly  0

prune_exit=$?

# actually free repo disk space by compacting segments

info "Compacting repository"

borg compact

compact_exit=$?

# use highest exit code as global exit code
global_exit=$(( backup_exit > prune_exit ? backup_exit : prune_exit ))
global_exit=$(( compact_exit > global_exit ? compact_exit : global_exit ))

if [ ${global_exit} -eq 0 ]; then
    info "Backup, Prune, and Compact finished successfully"
elif [ ${global_exit} -eq 1 ]; then
    info "Backup, Prune, and/or Compact finished with warnings"
else
    info "Backup, Prune, and/or Compact finished with errors"
fi

exit ${global_exit}
```

Save and exit, make it executable:

```sh
sudo chmod +x /usr/local/bin/borg_backup.sh
```

Test it:

```sh
sudo /usr/local/bin/borg_backup.sh
```

If everything looks good and the backup completes without errors, add the script to crontab:

```sh
sudo nano /etc/crontab
```

Make it run before any Watchtower updates takes place:

```sh
00 04   * * *   root    /usr/local/bin/borg_backup.sh
```

Save and exit. Finally you should back up your repository key:

```
sudo borg key export --paper /backup/borg > borg_key.txt
```

Where `borg_key.txt` is a text-file containing a printable version of your access key, ensure that you save this in a safe place.

</p>
</details>

### Backup to cold storage

<details><summary>Click to expand</summary>
<p>

Section in progress, coming soon-ish. Things to look forward to:

* How to configure an external drive for encrypted backups
* A script to automatically mount the external drive, unlock it, backup up recent snapshots, backup recent data backups, lock and finally unmount drive.

</p>
</details>

### Restoration process

<details><summary>Click to expand</summary>
<p>

Section in progress, coming soon-ish. Things to look forward to:

* How to restore system and data from a local backup
* How to restore system and data from an external drive

</p>
</details>

## Issues, solutions and workarounds

Tinkering with my server haven't always gone as planned. Here are some of the issues I've run into that deserves a little note of their own.

### Bricked motherboard

<details><summary>Click to expand</summary>
<p>

I initially used a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013), the motherboard shipped with BIOS-version __J41BW929.BSS__ and worked flawlessly with a pair of 8GB RAM-modules.

A couple of days go by and I shut the system down to do some cable-management after which it refused to boot. I figured I messed something up and put everything back as it was, no luck.

I removed one of the RAM-modules and tried again, nothing.

Finally I popped the CMOS battery out, waited a bit and re-placed it. This seemed to have done the job as I was greeted with a login prompt. I shut it down and re-placed the other RAM-module, black screen.

I pop the CMOS again, boot with a single module and see the BIOS-version was updated to __J41BWB22.BSS__. Determined to regain the ability to use both modules I tried to flash the __J41BW929.BSS__ version using Biostars provided flashing tool. The tool reported a successfull flash but the process had in fact bricked the motherboard.

Lesson learned, think twice before manually flashing your BIOS. I have since replaced the board with an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp). I also had to replace my RAM-modules with SO-DIMM ones due to board incompatibility.

</p>
</details>

### ddns-updater, unique or wildcard subdomains?

<details><summary>Click to expand</summary>
<p>

My initial idea was to manually add subdomains in Njallas dashboard and then use the provided key to update its DNS-record with ddns-updater. It turned out that ddns-updater does not support multiple keys for Njalla, after an hour or two of research I decided to try a wildcard domain instead which would use the same key for all my subdomains. 

This approach was successfull and I have yet to encounter any problem with it. Looking back on this issue months later I'm glad I didn't manage to make my initial approach work, imagine having to create and manage a unique key for each subdomain?

</p>
</details>

### Fail2ban, docker or bare-metal?

<details><summary>Click to expand</summary>
<p>

I initially tried to run Fail2ban in a docker container to streamline deployment. Fail2ban would correctly detect authentication fails and "ban" the associated IP address, however this "ban" would in reality not result in denied connections and the client could continue with authentication attempts. There seemed to be an issue with propagating the banned addresses up the IP-tables chain and block incoming connections.

I have now resorted to running it on the server itself which works like a charm. The only difficult parts so far have been learning [REGEX syntax](https://regex101.com/) and figuring out ways to log authentication attempts for services that don't natively support it.

</p>
</details>

### Nginx Proxy Manager streams for SSH

<details><summary>Click to expand</summary>
<p>

Events connected to SSH, such as authentication attempts and sudo commands, will be logged in the servers `/var/log/auth.log`. For example, a successful connection can look something like this:

```
date time host sshd[xxxx]: Accepted publickey for xxxx from 123.123.123.123 port xxxx
```

Of importance is that the IP address of the attempt is logged. As such, we can have Fail2ban monitor the log and ban anyone spamming authentication attempts.

However, SSH connections made through a Nginx Proxy Manager stream will use the internal IP address of the Nginx docker container, which will show up in the logs like so:

```
date time host sshd[xxxx]: Invalid user xxxx from 172.30.1.1 port xxxx
```

As the internal IP address is logged instead of the origin we cannot ban the malicious actor. This is due to the lack of `proxy_protocol` support, which is used by Nginx to pass along the origin IP address.

This has been reported to the Nginx Proxy Manager developers ([#1114](https://github.com/NginxProxyManager/nginx-proxy-manager/issues/1114), [#1882](https://github.com/NginxProxyManager/nginx-proxy-manager/pull/1882)) and is expected to be fixed in version 3. Until then I've resorted to NOT run an internet-accessible stream port for SSH.

</p>
</details>

### Misconfigured SSD partition table

<details><summary>Click to expand</summary>
<p>

A couple of months into the project I decided to LUKS encrypt the server. I planned everything out, what commands I would need to run and how the new directory structure would look like. The day comes and I pop the installation media in, wipe the drives and try a fresh-install. Seconds in I'm met with an error and the installation is aborted.

I will spend the next 4 hours narrowing down the error before I realize the issue; one of the partition tables are misconfigured.

I had just recently bought this drive and, not wanting to re-install, manually configured the partition table. I must've messed a command up because the drive was lacking a top-level partition. I did not notice this during initial use as the labels were correct and the disk writable, however as I tried to reformat the drive to LVM as part of the installation it would produce the aforementioned error.

I managed to fix it by installing Ubuntu without the misconfigured drive and manually reconfigure the partition table. I was then able to do a fresh install with LUKS encryption enabled for all drives.

</p>
</details>

## License and usage

- Any resource I link, cite or refer to are subject to their respective licenses.
- Images are taken by or made by me and are subject to All Rights Reserved. If you wish to use any of these images, please contact me at [license.doorstep@slmail.me](mailto:license.doorstep@slmail.me).
- Everything else in this repository is licensed under the terms of the [MIT license](https://mit-license.org/).

**[Back to top](#)**