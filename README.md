# Home Server

A collection of thoughts and notes as I build my home server. If you find anything useful, feel free to use it in your own project.

--------------------

## Table of contents

<details><summary>Click to expand</summary>
<p>

- [Home Server](#home-server)
  - [Table of contents](#table-of-contents)
  - [Hardware choices](#hardware-choices)
    - [CPU / Motherboard](#cpu--motherboard)
    - [Power supply (PSU)](#power-supply-psu)
    - [Case](#case)
    - [RAM](#ram)
    - [Storage](#storage)
    - [Final build costs](#final-build-costs)
  - [Assembly and initial setup](#assembly-and-initial-setup)
    - [Assembly](#assembly)
    - [Testing RAM stability](#testing-ram-stability)
    - [BIOS tweaks](#bios-tweaks)
    - [Installing the OS](#installing-the-os)
  - [SSH](#ssh)
    - [Part 1: Prerequisite and local access](#part-1-prerequisite-and-local-access)
    - [Part 2: Create a Hostname alias](#part-2-create-a-hostname-alias)
    - [Part 3: Generate and use SSH-keys](#part-3-generate-and-use-ssh-keys)
    - [Part 4: Hardening](#part-4-hardening)
  - [Docker](#docker)
    - [Installation](#installation)
    - [Easy management with ctop](#easy-management-with-ctop)
    - [Automatic updates with Watchtower](#automatic-updates-with-watchtower)
  - [Remote access and perimeter security](#remote-access-and-perimeter-security)
    - [Part 1: Aquire a custom domain](#part-1-aquire-a-custom-domain)
    - [Part 2: Configure Dynamic DNS](#part-2-configure-dynamic-dns)
    - [Part 3: Configure NGINX Proxy manager](#part-3-configure-nginx-proxy-manager)
    - [Part 4: Set up remote SSH](#part-4-set-up-remote-ssh)
    - [Part 5: Implement Fail2Ban](#part-5-implement-fail2ban)
  - [Services](#services)
    - [Dashboard with Homarr](#dashboard-with-homarr)
    - [Multimedia streaming with Jellyfin](#multimedia-streaming-with-jellyfin)
      - [Part 1: Consistent directories](#part-1-consistent-directories)
      - [Part 2: Install Jellyfin](#part-2-install-jellyfin)
      - [Part 3: Media transfer and streaming](#part-3-media-transfer-and-streaming)
    - [Torrenting with qflood](#torrenting-with-qflood)
      - [Part 1: Configure Wireguard](#part-1-configure-wireguard)
      - [Part 2: Install qflood](#part-2-install-qflood)
      - [Part 3: qBittorrent settings](#part-3-qbittorrent-settings)
      - [Part 4: Configure Flood](#part-4-configure-flood)
    - [Multimedia collection management with Arr](#multimedia-collection-management-with-arr)
      - [Part 1: Movies with Radarr](#part-1-movies-with-radarr)
  - [Issues and solutions](#issues-and-solutions)
    - [Bricked motherboard](#bricked-motherboard)
    - [Containerized Fail2Ban](#containerized-fail2ban)
  - [Reference tables](#reference-tables)
    - [Approximating power consumption](#approximating-power-consumption)
  - [License and usage](#license-and-usage)

</p>
</details>

--------------------

## Hardware choices

This section is about the hardware I use, why I chose a particular piece of hardware and what trade-offs are to be expected compared to similar choices.

<details><summary>Click to expand</summary>
<p>

### CPU / Motherboard

I don't expect to use especially resource-heavy services (_such as multi-user streaming, multiple desktop VM:s or 4K video encoding_). As such I've settled for an [intel Pentium J5040](https://ark.intel.com/content/www/us/en/ark/products/197304/intel-pentium-silver-j5040-processor-4m-cache-up-to-3-20-ghz.html), it has some particularly useful features for my use case:

- 18 execution units for parallel processing
- Integrated Graphics for display output
- Intel Quick Sync for extensive video encoding/decoding support
- 10W TDP (_Thermal Design Power, a shorthand way of estimating power consumption_)

However, the J-series is only available as motherboard embedded CPU:s. I've opted for an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp) due to its rich feature-set, but you might consider the [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) as long as you're OK with being limited to 8GB of ram (_or risk bricking your motherboard, see_ [_here_](#issues-and-solutions) for my experience).

### Power supply (PSU)

Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep power consumption down. A power supply is at its most efficient at __50% of maximum rated load__, that means a PSU rated at 500W max load will be at its most efficient when it provides 250W of power.

What __is__ the efficiency at 50% load? That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A `80+ White` will be 80-85% efficient at 50% load while a `80+ Titanium` will be 94-96% efficient.

After some [back of the napkin calculations](#reference-tables) I've estimated my system to draw between 10 to 23W. As such my ideal PSU would be a power-brick style 50-100W PICO-PSU. I've had no luck finding such a model with the right mix of power-cables and have instead opted for a tradition ATX PSU. At 300W, the [SYSTEM POWER B9 from be quiet!](https://www.bequiet.com/en/powersupply/1285) offers a better low-load efficiency compared to the more common 450/500W models while still providing some head-room for upgrades.

### Case

The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes; discreet and affordable with some room for expandability. It also included a 120 mm rear-mounted fan, however I replaced it with a Noctua [NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln) for reduced noise.

### RAM

As stated on intel's and ASRock's websites; the J5040 _officially_ supports up to 8GB of RAM.
However, some reddit users report being able to use 16 or even 32GB with [varying results](https://libreddit.dcs0.hu/r/ASRock/comments/k8hpww/how_can_a_motherboard_support_more_ram_than_the/).

With this in mind I decided to take a gamble with a [G.SKILL Ripjaws SO-DIMM 16GB Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS).

### Storage

Spinning hard-disk drives (HDD) are popular in home servers and NAS due to their high storage capacity and low price. However, they have reduced speeds and increased power draw compared to solid-state drives (SSD). Their moving parts also add noise and a significant [point of failure](https://en.wikipedia.org/wiki/Head_crash).

I opted for two [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (_250GB bootdrive + 2TB storage drive_) as they provide a good balance between price and performance. They also support _Integrated Power Loss Immunity_ which aims to prevent data loss in case of a power outage.

### Final build costs

| Component type | Model name | Price (SEK*) |
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

[_*10 SEK = ~1 USD_ ](https://www.xe.com/currencyconverter/convert/?Amount=10&From=SEK&To=USD)

</p>
</details>

--------------------

## Assembly and initial setup

This section is about my experience putting the hardware together and verifying that everything works as it should.

<details><summary>Click to expand</summary>
<p>

### Assembly

| Image | Note |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/home-server/blob/main/media/inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access to the motherboard fittings and has plenty of room for cable managment without the presence of a GPU. |
| ![power-extender cable](https://github.com/Stylback/home-server/blob/main/media/psu_cable.jpg?raw=true) | My only gripe with the case is the power-extender. It's aligned in such a way that the cable has to be forcefully twisted to slot into my specific PSU. I tried to screw the end out and flipping it 180°, allowing the cable to rest naturally on the case floor. It was however not possible to screw it in that way due to the shape of the cutout. |
| ![rear view](https://github.com/Stylback/home-server/blob/main/media/back.jpg?raw=true) | Rear-view and IO. |
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

- `SATA Aggressive Link Power Management -> Enabled`, reduces power consumption while SATA devices are idle.
- `Onboard HD Audio -> Disabled`, as I won't use any audio input/output.
- `Deep S5 -> Auto`, reduces power consumption on a turned off system.
- `Restore on AC/Power -> Loss Power On`, restarts the system after a power failure.

### Installing the OS

After confirming RAM stability I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. It was a pain-free process thanks to extensive [documentation](https://ubuntu.com/server/docs).

I assigned the 250GB drive as boot drive, consuming about half of its available storage. The rest was partitioned and mounted to `/home` for any application or service that needs to store information there. As the 2TB drive is going to be used as the primary storage unit it was partioned and mounted at `/srv`.

After creating a user and logging in for the first time, update your system with:

```sh
sudo apt update && sudo apt upgrade
```

Afterwards, let's run [YABS](https://github.com/masonr/yet-another-bench-script), it's a benchmarking script that will tell us more about the system we're running and its capabilities:

```sh
curl -sL yabs.sh | bash
```

My results:

```sh

Basic System Information:
---------------------------------
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
---------------------------------
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
---------------------------------
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
---------------------------------
Test            | Value                         
                |                               
Single Core     | 547                           
Multi Core      | 1858
```

</p>
</details>

--------------------

## SSH

This section is about basic SSH, such as local network access and some best practices. I will expand on this in an upcoming section where we will configure SSH outside of our home network.

<details><summary>Click to expand</summary>
<p>

### Part 1: Prerequisite and local access

SSH is a protocol that allows remote login and command line execution, something that will be very convenient when we continue to set up the server. Both my client and server is using Ubuntu-derivative OSs, as such the commands might differ from your own.

To be able to SSH from a client to a server:
- There must be a traversable network connection between them and
- They both need to have a SSH service installed

OpenSSH usually comes shipped by default on desktop Linux distributions, if for some reason you do not have the client installed you can install it by running:

```sh
sudo apt install openssh-client
```

On the server we install it using:

```sh
sudo apt install openssh-server
```
This was however not necessary in my case as the Ubuntu installer provided me with the option during initial set-up.
From the server, run `ip a` to get information about your network connections and take note of your servers local IP-address.

On the client, run:

```sh
ssh username@server-ip
```
Where `username` is the username on the server and `server-ip` is your servers local IP-address. The terminal will prompt for a password and connect.

### Part 2: Create a Hostname alias

We don't want to have to remember `username@server-ip`, so instead we will create an alias which will allow us to access the server by just running `ssh alias`. On the client, run:

```sh
sudo nano ~/.ssh/config
```

Paste the following, replacing `alias`, `server-ip` and `username` with relevant information:

```sh
Host alias
  Hostname server-ip
  Port 22
  User username
```

__NOTE__: The whitespace before `Hostname`, `Port` and `User` are __required__!

Save and exit, you should now be able to connect to your server by running `ssh alias`.

### Part 3: Generate and use SSH-keys

On the client, run the following, replacing `comment` with some information to help you remember what the key is for:

```sh
ssh-keygen -t ed25519 -C "comment"
```

You will be prompted for a name, you can choose a name or accept the default `id_ed2559` by pressing enter. You will also be prompted for a passphrase, enter a passphrase or press enter to skip. This will create a keypair, one public key named `keyname.pub` and one private key named `keyname`. You can verify that they are there by running:

```sh
ls ~/.ssh -la
```

Now lets copy the __public__ key to our server. On the client, run: 

```sh
ssh-copy-id -i ~/.ssh/keyname.pub alias
```

Replacing `keyname` and `alias` with whatever you chose earlier. If you chose a passphrase you will be prompted for it before continuing.

Verify that the key works by connecting to the server with `ssh alias`. If the keys have been exchanged correctly you should __not__ be prompted for a password.

__NOTE:__ Always keep your private key secure, __never__ share it with anyone! If you have reason to believe that your private key has been compromised, generate a new keypair and delete the old one from the servers `authorized_keys` file.

### Part 4: Hardening

Now that we can connect to the server using our SSH-key, we will make some security enhancement to prevent brute-forcing and root access.

On your client, connect to the server and run:

```sh
sudo nano /etc/ssh/sshd_config
```

Search after the line with `PermitRootLogin`, uncomment and change it to `PermitRootLogin no`. Then search for `PasswordAuthentication`, uncomment and change it to `PasswordAuthentication no`. 

Finally, find the line with `Port 22`, uncomment and change it from 22 to [another](https://serverfault.com/questions/509294/what-are-valid-ports-to-use-for-ssh) port of your choice. Save and exit. Remember to change the port number for your alias to reflect your choice.

__WARNING:__ Do __NOT__ close the terminal window, if something was entered incorrectly in the configuration file you might lose access to the server. Until we know everything works, ensure that you have atleast one other terminal instance running that is connected to the server.

Restart the SSH service by running:

```sh
sudo systemctl restart ssh
```

Verify that everything works by first trying to connect to the server with `ssh alias`, then try to access it using `ssh root@server-ip` (_which the server should deny_).

If everything worked correctly, the server should now be accessible only by your SSH-key and no user that access it by SSH can gain Root privileges. As we changed the port number from the default we gain some resistance against automated attacks, but a persistent actor could still find the correct port after some trial and error.

</p>
</details>

--------------------

## Docker

This section is all about Docker and how to manage Docker containers.

<details><summary>Click to expand</summary>
<p>

### Installation

[Docker](https://www.docker.com/) lets us set up containers to hold our services, making it easy to handle access and permissions. There are multiple ways to use docker, we will be using the `docker-compose` method which entails three steps:

- Create a `docker-compose.yml` file for your service
- In the file, add any necessary parameters to make the service work (_these can often be pasted directly from the service's documentation_)
- Launch the service with `sudo docker compose up -d`

To install the necessary Docker components I followed their [official documentation](https://docs.docker.com/engine/install/) which can be summarized below as:

Get the prerequisite with:

```sh
sudo apt update && sudo apt install \
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

### Easy management with ctop

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

> Error? The key is most likely out of date, visit the [maintainers](https://packages.azlux.fr/) website to find the current key.

```sh
sudo apt update && sudo apt install docker-ctop
```

Launch it by simply running:

```sh
sudo ctop
```

### Automatic updates with Watchtower

We will use [Watchtower](https://containrrr.dev/watchtower/) to automatically find and apply updates to our docker images. To get started, make a directory:

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
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
    environment:
       - TZ=Europe/Stockholm
     command: --cleanup true --schedule "0 0 2 * * *" # run daily at 2 am
```

Save and exit, now start Watchtower with:

```sh
cd /srv/watchtower && sudo docker compose up -d
```

Watchtower will check for updates every night at 2 am. If it finds any it will download it, restart the container to apply the update and remove the old version.

</p>
</details>

--------------------

## Remote access and perimeter security

This section is about secure, remote access. We will talk about custom domains, Dynamic DNS, NGINX Proxy Manager, remote SSH and finally Fail2Ban.

<details><summary>Click to expand</summary>
<p>

### Part 1: Aquire a custom domain

Up until this point we have only been able to access our server while on the same local network, to access it remotely we will utilize a custom domain. This method will make it easy to manage multiple services as we can use subdomains (_blog.domain.tld, server.domain.tld etc._), it also makes the process of using Dynamic DNS easier.

To get a custom domain you will need to purchase it from a domain registrar. There are many domain registrars but I've gone with [Njalla](https://njal.la/) due to their great track record, amazing privacy policy and [DMCA responses](https://njal.la/blog/dhlsucks/). Their pricing is somewhat higher than their competitors and you might consider something like [namecheap](https://www.namecheap.com/) if you're looking for a cheaper alternative.

### Part 2: Configure Dynamic DNS

We want our domain to point to our routers IP-address. This address, called a dynamic IP-address, will change over time and can cause our registrar to point the wrong way were it not updated. To solve this we will utilize [ddns-updater](https://github.com/qdm12/ddns-updater), which is a dynamic DNS service that will regularly check our IP-address and convey any changes to Njalla.

To get started, log into Njalla (_or your registrar of choice_) and add a new DNS record to your domain. This new record should be __DYNAMIC__ (_not A or AAAA_) and be named __*__, this will create a dynamic __wildcard__ domain. Njalla will provide you with a key that we need to update the IP-address of the DNS record, if you're using another registrar they might have other ways of conveying changes to IP.

To get started with ddns-updater we will create a directory in `/srv`:

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

Save and exit. Now lets create a docker compose file:

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
    network_mode: bridge
    ports:
      - 8000:8000/tcp
    volumes:
      - ./data:/updater/data
    environment:
      - CONFIG=
      - PERIOD=5m
      - UPDATE_COOLDOWN_PERIOD=5m
      - PUBLICIP_FETCHERS=all
      - PUBLICIP_HTTP_PROVIDERS=all
      - PUBLICIPV4_HTTP_PROVIDERS=all
      - PUBLICIPV6_HTTP_PROVIDERS=all
      - PUBLICIP_DNS_PROVIDERS=all
      - PUBLICIP_DNS_TIMEOUT=3s
      - HTTP_TIMEOUT=10s

      # Web UI
      - LISTENING_PORT=8000
      - ROOT_URL=/

      # Backup
      - BACKUP_PERIOD=0 # 0 to disable
      - BACKUP_DIRECTORY=/updater/data

      # Other
      - LOG_LEVEL=info
      - LOG_CALLER=hidden
      - SHOUTRRR_ADDRESSES=
    restart: always
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
sudo docker compose up -d
```

> Didn't start? Check that you're CD:d into `/srv/ddns-updater` and try again.

Check that everything is working by typing `[local-IP]:8000` in your browser.

![Screenshot of DDNS-updater web page](https://github.com/Stylback/home-server/blob/main/media/ddns_screenshot.png?raw=true)

> Didn't work? It's probably a permission error, double-check the directory/file permissions with `ls -la` and restart the service.

### Part 3: Configure NGINX Proxy manager

Create a directory in `/srv`:

```sh
sudo mkdir /srv/npm
```

Now create a docker compose file:

```sh
sudo nano /srv/npm/docker-compose.yml
```

Lets configure it according to the [official](https://nginxproxymanager.com/setup/) documentation, paste the following:

```yml
version: "3"
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      # These ports are in format <host-port>:<container-port>
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port
      # Add any other Stream port you want to expose
      # - '21:21' # FTP
    environment:
      DB_MYSQL_HOST: "db"
      DB_MYSQL_PORT: 3306
      DB_MYSQL_USER: "npm"
      DB_MYSQL_PASSWORD: "npm"
      DB_MYSQL_NAME: "npm"
      # Uncomment this if IPv6 is not enabled on your host
      # DISABLE_IPV6: 'true'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
    depends_on:
      - db

  db:
    image: 'jc21/mariadb-aria:latest'
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: 'npm'
      MYSQL_DATABASE: 'npm'
      MYSQL_USER: 'npm'
      MYSQL_PASSWORD: 'npm'
    volumes:
      - ./data/mysql:/var/lib/mysql
```

Save and exit. You should now be able to start NGINX proxy manager by running:

```sh
sudo docker compose up -d
```

> Initial start might take awhile. If it didn't start, CD into the folder and try again.

Check that everything is working by typing `[local-IP]:81` in your browser. Log in with the default email and password:

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

Now go back to your Proxy Host for `nginx.domain.tld` and click `Edit`, go to to SSL and add your certificate from the drop-down list. For added security, enable __Force SSL__ and __HSTS__. Finally, visit `nginx.domain.tld` and ensure that everything is working as intended.

For added security you can make a Access List entry. Navigate to `Access Lists` and `Add Access List`, then configure access to fit your needs. For exposed services without a log-in page you might consider adding basic HTTP Authentication, which will prompt a visitor for credentials before even loading the page. For services that you only want to be accessible on your local network, consider adding you local network to the whitelist while denying all other connections.

When you've made a Access List entry, navigate to Proxy Hosts and change a Proxy from `Publicly Accessible` to `[entry name]`.

### Part 4: Set up remote SSH

First we need to decide on a port we will expose, look through the [list](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) and add a port-forwarding rule for that port in your router. Next, visit `nginx.domain.tld`. Log in and navigate to `Streams`, add a new stream with:

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

Save and exit. Now lets restart the container to apply the settings, you can either do this directly with `ctop` or by running:

```sh
cd /srv/npm
```

```sh
sudo docker compose restart npm-app-1
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

### Part 5: Implement Fail2Ban

[Fail2Ban](https://github.com/fail2ban/fail2ban) is a service that scans log files and bans IP addresses that have multiple failed log-in attempts. We will make it listen to log files from NGINX Proxy Manager and prevent malicious hosts from spamming our services with authentication attempts.

To get started with Fail2Ban we will install it with:

```sh
sudo apt update && sudo apt install fail2ban
```

Now start Fail2Ban:

```sh
sudo fail2ban-client start
```

We will create three different files; one action, one filter and one jail. First, create an action-file:

```sh
sudo nano /etc/fail2ban/action.d/docker-action.conf
```

Paste:

```
[Definition]
actioncheck = iptables -n -L FORWARD | grep -q 'DOCKER-USER[ t]'
actionban = iptables -I DOCKER-USER -s <ip> -j DROP
actionunban = iptables -D DOCKER-USER -s <ip> -j DROP
```

Second, create a filter:

```sh
sudo nano /etc/fail2ban/filter.d/npm-docker.conf
```

Paste the following REGEX-expression from [hugalafutro](https://github.com/NginxProxyManager/nginx-proxy-manager/issues/39#issuecomment-907795521):

```
[INCLUDES]

[Definition]

failregex = ^<HOST>.+" (4\d\d|3\d\d) (\d\d\d|\d) .+$
            ^.+ 4\d\d \d\d\d - .+ \[Client <HOST>\] \[Length .+\] ".+" .+$
```

Save and exit. Lastly create a jail-file:

```sh
sudo nano /etc/fail2ban/jail.d/npm-docker.local
```

Paste:

```sh
[npm-docker]
enabled = true
ignoreip = 127.0.0.1/8 192.168.1.0/24
chain = INPUT
filter  = npm-docker
logpath = /srv/npm/data/logs/default-host_*.log
          /srv/npm/data/logs/proxy-host-*_access.log
maxretry = 2
bantime  = -1 
findtime = 86400
action = docker-action
```

Save and exit. Now restart Fail2Ban with:

```sh
sudo fail2ban-client restart
```

Check that your jail is detected:

```sh
sudo fail2ban-client status npm-docker
```

Which should output something like this:

```sh
|- Filter
|  |- Currently failed:	0
|  |- Total failed:	0
|  `- File list: /srv/npm/data/logs/proxy-host-1_access.log
`- Actions
   |- Currently banned:	0
   |- Total banned:	0
   `- Banned IP list:	
```

Check that it's banning correctly by visiting `nginx.domain.tld` on your cellular network or such. Type in the wrong password three times, you should not be able to do it a fourth time. Check the jail again:

```sh
sudo fail2ban-client status npm-docker
```

It should now show:

```sh
`- Actions
   |- Currently banned:	1
   |- Total banned:	1
   `- Banned IP list:	[banned-IP]
```

You can unban yourself with:

```sh
sudo fail2ban-client unban --all
```

Finally, make Fail2Ban run automatically on start:

```sh
sudo systemctl enable fail2ban
```

</p>
</details>

--------------------

## Services

This section is about the services I have or plan to implement. It will be an ever-growing section as I add more and more services, take a look at the table below to get an idea about what's next:

|  Service | Description | Priority |
| ------------- | ------------- | ------------- |
| Data backup solution | [Restic](https://restic.net/) or [Borgmatic](https://torsion.org/borgmatic/). Will make backups/snapshots to an external SSD, compression is preferred | High |
| [Static Web Server](https://sws.joseluisq.net/) | A static webpage server | Low |
| [Umami](https://github.com/umami-software/umami) | Self-hosted, privacy focused web analytics. Will be implemented alongside static webpage | Low  |
| [Image hotlink protection](https://www.smarthomebeginner.com/image-hotlink-protection-nginx/) | Prevents image hotlinking, will be implemented alongside static webpage (_this isn't really a service but I will keep it here for future reference_). | Low  |
| [Planar ally](https://github.com/Kruptein/PlanarAlly) | Webtool for TTRPG:s | Low  |

### Dashboard with Homarr

<details><summary>Click to expand</summary>
<p>

[Homarr](https://homarr.vercel.app/docs/about) is an easy to use dashboard for our services. First, lets create a `docker-compose.yml` and a directory to house it:

```sh
sudo mkdir /srv/homarr 
```

```sh
sudo nano /srv/homarr/docker-compose.yml 
```

Paste the following:

```yml
version: '3'
services:
  homarr:
    container_name: homarr
    image: ghcr.io/ajnart/homarr:latest
    restart: unless-stopped
    volumes:
      - ./homarr/configs:/app/data/configs
      - ./homarr/icons:/app/public/icons
    ports:
      - '7575:7575' 
```

Save and exit. You can now start it by running:

```sh
cd /srv/homarr && sudo docker compose up -d 
```

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

Save and check that Homarr is accessible at `homarr.domain.tld`. For increased security, add a SSL-certificate and assign it a unique Access List entry.

</p>
</details>

### Multimedia streaming with Jellyfin

<details><summary>Click to expand</summary>
<p>

#### Part 1: Consistent directories

Before we set up Jellyfin we will make a clear and consistent directory-structure following TRaSH Guides [Hardlinks and Instant Moves](https://trash-guides.info/Hardlinks/Hardlinks-and-Instant-Moves/). We can create the whole structure with this one command:

```sh
sudo mkdir -p /srv/data/{torrents/{movies,music,tv},media/{movies,music,tv}}
```

Now configure directory permissions with:

```sh
sudo chown -R $USER:$USER /srv/data && sudo chmod -R a=,a+rX,u+w,g+w /srv/data
```

#### Part 2: Install Jellyfin

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
      - "8096:8096"
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - /srv/jellyfin/config:/config
      - /srv/jellyfin/cache:/cache
      - /srv/data/media:/media
    devices:
      - /dev/dri:/dev/dri
    restart: "unless-stopped"
```

Save and exit. You can now start it with:

```sh
cd /srv/jellyfin && sudo docker compose up -d
```

Wait a bit while everything is being prepared. When done, go to `[local IP]:8096` and follow the start-up guide. When you've confirmed it's accessible it's time to create a NGINX proxy host:

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

#### Part 3: Media transfer and streaming

Jellyfin is up and running but we still need to test media streaming. Load up a USB with some media-files and stick it into your server. Check its label, it should be something akin to `sdb1`:

```sh
lsblk
```

Make a directory and mount the USB to it:

```sh
sudo mkdir /media/external
```

```sh
sudo mount /dev/[label] /media/external
```

If it is LUKS encrypted you need to unlock it before mounting, run:

```sh
sudo cryptsetup luksOpen /dev/[label] [volume name]
```

```sh
sudo mount /dev/mapper/[volume name] /media/external
```

Now we can copy the media-files from the USB to our media directory:

```sh
sudo rsync -ah --progress /media/external/[your media] /srv/data/media/[relevant folder]
```

Once your media-files are copied they will be automatically added to your Jellyfin library. This process might take a couple of minutes, if you want to force a new check you can do so in the settings. Once they are detected, try to stream them.

P.S. Don't forget to unmount your USB before unplugging it:

```sh
sudo umount /media/external
```

If it was LUKS encrypted, don't forget to lock it:

```sh
sudo cryptsetup luksClose [volume name]
```

</p>
</details>

### Torrenting with qflood

<details><summary>Click to expand</summary>
<p>

> DISCLAMIER: The BitTorrent protocol is a communcation protocol for peer-to-peer file sharing, it's an easy and accessible way for people to share their own or licensed works online. Before you contemplate downloading or sharing copyrighted content via the BitTorrent protocol, please check that those actions are not considered criminal by your local laws and regulations. I am not liabel in any way for your inability to use the BitTorrent protocol in accordance with said law.

[qflood](https://hotio.dev/containers/qflood/) is a Docker image from Hotio that combines [qBittorrent](https://github.com/qbittorrent/qbittorrent) and [Flood](https://github.com/jesec/flood) with easy Wireguard VPN integration.

#### Part 1: Configure Wireguard

Before setting up qflood we will install and configure Wireguard:

```sh
sudo apt update && sudo apt install openresolv wireguard
```

You will need a VPN provider for this section, I will be using [Mullvad](https://mullvad.net/en/) but there are [other](https://www.privacyguides.org/vpn/) options you might consider. When you have a provider, go to their website and get their Wireguard configuration. Now run:

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

#### Part 2: Install qflood

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
      - "8080:8080" #qBittorrent
      - "3000:3000" #Flood
      - "8118:8118" #internal qBittorrent app-to-app communication
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
      - VPN_ENABLED=true
      - VPN_LAN_NETWORK=[local inet]/24
      - VPN_CONF=wg0
      - VPN_ADDITIONAL_PORTS
      - VPN_IP_CHECK_DELAY=5
      - PRIVOXY_ENABLED=false
      - FLOOD_AUTH=false
    volumes:
      - /etc:/config
      - /srv/data/torrents:/data/torrents
    cap_add:
      - NET_ADMIN
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
      - net.ipv6.conf.all.disable_ipv6=0
```

Save and exit. Now run:

```sh
cd /srv/qflood && sudo docker compose up -d
```

<details><summary>Did you get an IPv6 error?</summary>
<p>

It might be that there are no IPv6 tables on your server. To fix this we need to run:

```sh
sudo modprobe ip6table_filter
```

Followed by a container restart. This will however only fix the issue until the next reboot, to make it persistent you need to run:

```sh
echo "ip6table_filter" | sudo tee -a /etc/modules
```

Save and reboot, check the container status with `ctop` to see if it's working.

</p>
</details>

Now visit qBittorrent's web UI at `[local IP]:8080` and log in with the default credentials:

```
Username: admin
Password: adminadmin
```

#### Part 3: qBittorrent settings

Next up is port forwarding. In Mullvad, go to your account and "Port Forwarding". Identify your server and add a port for it. In qBittorrent's Web UI, go to `Tools -> Options -> Connection -> Listening Port` and change the default port to your forwarded port. Then launch `ctop`, select `qflood` and choose `exec shell`. Run the following two commands:

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

Now that we know that port forwarding is wokring, let's do some `Options` tinkering in qBittorrent:

| Setting | Default | Set to | Reason |
| ------------- | ------------- |------------- |------------- |
| Peer connection protocol |  TCP and µTP | TCP | µTP is good for data congestion control but can throttle speeds. |
| Enable anonymous mode | Disable | Enable | Aims to prevent real IP-leakage while using a proxy or VPN. |
| Enable Local Peer Discovery | Enable | Disable | We have no other client on our LAN. |
| Seeding limits | Disable | When ratio reaches 1 or when time reaches 1440 minutes, Pause torrent | Introducing a limit means we can easily configure what happens after we are done with a torrent. A one-to-one ratio means we distribute as much as we downloaded. A lack of peers might however mean that we never reach our ratio, therefore we also have a 24 hour limit. |
| Global rate limits | Disable | 10000 KiB/s | About 80 Mbit/s. |
| Alternative Rate Limits | Disable | 1500 KiB/s | About 12 Mbit/s, a good limit to prevent daytime broadband shortage. |
| Schedule the use of alternative rate limits | Disable | 07:00 to 01:00, Every day | Will give us a our limited rate between 07:00 - 01:00 and our global rate between 01:00 - 07:00. |
| Username/Password | admin / adminadmin | ;) | Default credentials are a security hazard. |

For easy management, add three categories corresponding to the three torrent types:

```
Name: sonarr    Path: /data/torrents/tv
Name: radarr    Path: /data/torrents/movies
Name: lidarr    Path: /data/torrents/music
```

Then go to `Tools -> Options -> Downloads -> Default Torrent Management Mode` and change it to `Automatic`. Now when you add a torrent you can choose a category and have it automatically transfered to the right directory after downloading.

#### Part 4: Configure Flood

A recent version of qBittorrent broke Flood support, I will revisit this section when the issue has been resolved.

</p>
</details>

### Multimedia collection management with Arr

In this section we will go over some of the [Arr-apps](https://wiki.servarr.com/): Radarr, Lidarr, Sonarr and Overseerr.

<details><summary>Click to expand</summary>
<p>

#### Part 1: Movies with Radarr

[Radarr](https://hotio.dev/containers/radarr/) is a a movie collection manager, it allows us to keep our collection up-to-date and uniform, it also helps us discover new content based on our existing library. The radarr workflow be as below:

```mermaid
  graph TD;
      A-->B;
      B-->C;
      C-->D;
      D-->E;
```

We will be using Hotio's docker image, start by making a directory:

```sh
sudo mkdir /srv/radarr
```

Make a docker-compose.yml file:

```sh
sudo nano /srv/radarr/docker-compose.yml
```

Paste:

```yml
version: "3.7"
services:
  radarr:
    container_name: radarr
    image: cr.hotio.dev/hotio/radarr
    ports:
      - "7878:7878"
    environment:
      - PUID=1000
      - PGID=1000
      - UMASK=002
      - TZ=Europe/Stockholm
    volumes:
      - /etc:/config
      - /srv/data/torrents:/data/torrents
      - /srv/data/media:/data/media
    restart: always
```

Start it with:

```sh
cd /srv/radarr && sudo docker compose up -d
```

Now visit radarr's web-ui at `[local ip]:7878`. Now let us do some configuration, enable `Advanced Options` and do the following:

| Setting | Default | Set to | Reason |
| ------------- | ------------- |------------- |------------- |
| Rename Movies | Disable | Enable | Will make the naming scheme uniform across out collection .|
| Colon Replacement | Disable | Enable, Replace with Space Dash Space | Removes `:` from file names. |
| Import Extra Files | Disable | Enable | Will add extra files. |
| Add Root Folder | none | `/data/torrents/movies` and `/data/media/movies` | The folders radarr will use to manage our collection. |
| Quality Profile | No custom profile | Add custom profiles that suite your quality and language requirements | Ensures you only have media of the language and quality you want. |
| Delay profile | Both Usenet and Torrent | Only Torrent | We will not be using the Usenet protocol |
| Qualities | No custom values | Some custom values | I recommend following TRaSH's [best practices](https://trash-guides.info/Radarr/Radarr-Quality-Settings-File-Size/). |
| Indexers | No indexer | Add one or multiple of your choice | I recommend RARBG. |
| Add Download Client | Might be detected, might not | qBittorrent | The download client that will handle requests from radarr. |
| Analytics | Enable | Disable | I prefer to create github issues instead |
| Authentication | No authentication | Forms | Will require a username and password before accessing radarr, great for security as we will expose the service to the internet. |
| UI | No custom values | Whatever you feel like. |  |

Make a Proxy Host entry for radarr in NGINX.

</p>
</details>

--------------------

## Issues and solutions

Here I document anything particularly difficult that made me rethink an implementation.

<details><summary>Click to expand</summary>
<p>

### Bricked motherboard

> __TL;DR:__ Initially made the build with a Biostar J4105NHU, a BIOS-update broke RAM-support and trying to revert back to the previously known working version bricked it.

I initially used a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013), the motherboard shipped with BIOS-version __J41BW929.BSS__ and worked flawlessly with a pair of 8GB RAM-modules.

A couple of days go by and I shut the system down to do some cable-management, after which it refused to boot. I figured I messed something up with the cables and put everything back as it was, no luck.

I removed one of the RAM-modules and tried again, nothing.

Finally I popped the CMOS battery out, waited a bit and re-placed it. This seemed to have done the job as I was greeted with a login prompt. I shut it down and re-placed the other RAM-module, nothing happens.

I pop the CMOS again, boot with a single module and see the BIOS-version was updated to __J41BWB22.BSS__. Determined to regain the ability to use both modules I tried to flash the __J41BW929.BSS__ version using Biostars provided flashing tool. The tool reported a successfull flash but the process had in fact _bricked_ the motherboard.

Lesson learned, think thrice before manually flashing your BIOS. I have since replaced the board with an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp). I also had to replace my RAM-modules with SO-DIMM ones due to board incompatibility.

### Containerized Fail2Ban

> __TL;DR:__ Containarized Fail2Ban didn't work so I've switched to running it on the OS directly.

I initially tried to run Fail2Ban in a docker container to streamline deployment. I managed to get the filter and jail working but not banning. Fail2Ban would correctly detect authentication fails and "ban" the associated IP address. This "ban" would in reality not result in denied connections, the client could continue to spam authentication attempts. There seemed to be no clear way to propagate the banned addresses up the IP-tables chain and block connections.

I have now resorted to running it on the server itself and it's able to stop connections from banned IP addresses before they reach NGINX Proxy Manager. However it's not perfect, I seem unable to ban IP addresses that fail NGINX's Access List authentication. Perhaps these attempts are not logged or maybe the REGEX just fails to match them. I will revisit this issue at a later date and update accordingly.

</p>
</details>

--------------------

## Reference tables

Throughout the text I might refere to a table, this is where you can find it.

<details><summary>Click to expand</summary>
<p>

### Approximating power consumption

| Component | Power draw (_idle_) [W] | Power draw (_active_) [W] |
| :--- | ---: | ---: |
| Crucial MX500 1TB | 0.10[^1] | 0.54[^1] |
| Crucial MX500 250GB | 0.08[^1] | 0.54[^1] |
| G.SKILL Ripjaws SO-DIMM 16GB | 6.00[^2] | 6.00[^2] |
| ASRock J5040-ITX | 0.70[^3] | 10.00[^3] |
| NF-A12X25 ULN | 0.6[^4] | 0.6[^4] |
| Total (_100% efficiency_): | 7.48 | 17.68 |
| __Total (_70% efficiency_[^5]):__ | __10.7__ | __25.3__ |

If we assume an average 2 hours of full system utilization per day, with the rest being equivalent to an idle power state, we can approximate the daily power consumption to: $\frac{25.3 \times 2 + 10.7 \times 22}{1000} \approx 0.286 \textrm{ kWh/Day}$

Or a yearly power consumption of: $0.286*365 \approx 104 \textrm{ kWh/Year}$

For comparison, running an [average dishwasher](https://energyusecalculator.com/electricity_dishwasher.htm) once a week for 3 hours consumes about $\approx 282 \textrm{ kWh/Year}$

[^1]: [AnandTech MX500 review](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8). Power draw for the 250GB model is inferred from the MX500 500GB results.

[^2]: [TomsHardware i7-5960x review](https://www.tomshardware.com/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html). This number seems to agree with Crucials [own assessment](https://www.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use).

[^3]: Inferred from Dr. Helmut Neukirchen's [power consumption test](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/) of the J4105, as it has the same TDP as the J5040. I also subtracted 3 W from the authors measurements which is the estimated power consumption of a 8GB stick of DDR4 RAM.

[^4]: Noctua NF-A12X25 ULN [specification](https://noctua.at/en/products/fan/nf-a12x25-uln/specification).

[^5]: [HardwareInfo low-load PSU test](https://web.archive.org/web/20130811112042/http://uk.hardware.info/productinfo/188792/be-quiet!-pure-power-l8-300w#tab:testresults). Inferred from the 22.5 W test of the _be quiet! Pure Power L8 300 W_.

</p>
</details>

--------------------

## License and usage

This project was created to document the thoughts and implementations behind my home server. Any resource I link to, cite or otherwise refer to are subject to their respective licenses, any image used is my own and are subject to All Rights Reserved. Everything else in this project is licensed under the terms of the [MIT license](https://mit-license.org/).

**[Back to top](#home-server)**