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
  - [Setting up SSH](#setting-up-ssh)
    - [Part 1: Prerequisite and basic access](#part-1-prerequisite-and-basic-access)
    - [Part 2: Create a Hostname alias](#part-2-create-a-hostname-alias)
    - [Part 3: Generate and use SSH-keys](#part-3-generate-and-use-ssh-keys)
    - [Part 4: Hardening](#part-4-hardening)
  - [Setting up Docker](#setting-up-docker)
    - [Installation](#installation)
    - [Management software](#management-software)
  - [Setting up remote access](#setting-up-remote-access)
    - [Part 1: Aquire a custom domain](#part-1-aquire-a-custom-domain)
    - [Part 2: Configure Dynamic DNS](#part-2-configure-dynamic-dns)
    - [Part 3: Configure NGINX Proxy manager](#part-3-configure-nginx-proxy-manager)
    - [Part 4: Set up remote SSH](#part-4-set-up-remote-ssh)
    - [Part 5: Hardening](#part-5-hardening)
  - [Implementing services](#implementing-services)
    - [Homarr](#homarr)
  - [Issues and solutions](#issues-and-solutions)
    - [Bricked motherboard](#bricked-motherboard)
  - [Reference tables](#reference-tables)
    - [Approximating power consumption](#approximating-power-consumption)
  - [License and usage](#license-and-usage)

</p>
</details>

--------------------

## Hardware choices

<details><summary>Click to expand</summary>
<p>

### CPU / Motherboard

I don't expect to use especially resource-heavy services (_such as multi-user streaming, multiple desktop VM:s or 4K video encoding_). As such I've settled for an [intel Pentium J5040](https://ark.intel.com/content/www/us/en/ark/products/197304/intel-pentium-silver-j5040-processor-4m-cache-up-to-3-20-ghz.html), it has some particularly useful features for my use case:

- 18 execution units for parallel processing
- Integrated Graphics for display output
- Intel Quick Sync for extensive video encoding/decoding support
- 10W TDP (_Thermal Design Power, a shorthand way of estimating power consumption_)

However, the J-series is only available as motherboard embedded CPU:s. I've opted for an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp) due to its rich feature-set, but you might consider the [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) as long as you're OK with being limited to 8GB of ram (_or risk bricking your motherboard, see_ [_here_](#bricked-motherboard) for my experience).

### Power supply (PSU)

Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep power consumption down. A power supply is at its most efficient at __50% of maximum rated load__, that means a PSU rated at 500W max load will be at its most efficient when it provides 250W of power.

What __is__ the efficiency at 50% load? That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A `80+ White` will be 80-85% efficient at 50% load while a `80+ Titanium` will be 94-96% efficient.

After some [back of the napkin calculations](#approximating-power-consumption) I've estimated my system to draw between 10 to 23W. As such my ideal PSU would be a power-brick style 50-100W PICO-PSU. I've had no luck finding such a model with the right mix of power-cables and have instead opted for a tradition ATX PSU. At 300W, the [SYSTEM POWER B9 from be quiet!](https://www.bequiet.com/en/powersupply/1285) offers a better low-load efficiency compared to the more common 450/500W models while still providing some head-room for upgrades.

### Case

The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes; discreet and affordable with some room for expandability. It also included a 120 mm rear-mounted fan, I might however replace it with a Noctua [NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln/specification) down the line for noise reduction.

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
| RAM | [G.SKILL Ripjaws SO-DIMM 16GB, 2400MHz Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS)| 560 |
| Storage | [Crucial MX500 (_250GB + 2TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 2180 |
| Cable| [Power cable 5m](https://www.amazon.se/gp/product/B07Y1VHRPT/) | 110 |
| Cable| [Cat 5e cable 5m](https://www.amazon.se/gp/product/B00I7XX1BC/) | 60 |
| Misc | [Cable ties](https://www.amazon.se/gp/product/B09GFMN616/) | 100 |
| __Total:__ |  | __5620__ |

[_*10 SEK = ~1 USD_ ](https://www.xe.com/currencyconverter/convert/?Amount=10&From=SEK&To=USD)

</p>
</details>

--------------------

## Assembly and initial setup

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

</p>
</details>

--------------------

## Setting up SSH

<details><summary>Click to expand</summary>
<p>

### Part 1: Prerequisite and basic access

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

You will be prompted for a name, you can chose a name or accept the default `id_ed2559` by pressing enter. You will also be prompted for a passphrase, enter a passphrase or press enter to skip. This will create a keypair, one public key named `keyname.pub` and one private key named `keyname`. You can verify that they are there by running:

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

## Setting up Docker

<details><summary>Click to expand</summary>
<p>

### Installation

[Docker](https://www.docker.com/) lets us set up containers to hold our applications, making it easy to handle access and permissions. There are multiple ways to use docker, we will be using the `docker-compose` method which entails three simple steps:

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

### Management software

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

> Error? Most likely the key is out of date, visit the [maintainers](https://packages.azlux.fr/) website to find the latest one.

```sh
sudo apt update && sudo apt install docker-ctop
```

Launch it by simply running:

```sh
sudo ctop
```

</p>
</details>

--------------------

## Setting up remote access

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

### Part 5: Hardening

Adding [Fail2Ban](https://github.com/fail2ban/fail2ban) or perhaps [CrowdSec](https://www.crowdsec.net/). Will mention more about credentials and accessability lists in NGINX Proxy Manager.

</p>
</details>

--------------------

## Implementing services

<details><summary>Click to expand</summary>
<p>

Current ideas: 
- handle Docker image updates with [Watchtower](https://containrrr.dev/watchtower/)
- a static webpage on `blog.domain.tld` using [Static Web Server](https://sws.joseluisq.net/)
- a data backup solution! Rsync, Restic and Kopia seems popular
- media streaming with [Jellyfin](https://jellyfin.org/)

### Homarr

[Homarr](https://homarr.vercel.app/docs/about) is an easy to use dashboard for our services. First, lets create a `docker-compose.yml` and a directory to house it:

```sh
sudo mkdir /srv/homarr 
```

```sh
sudo nano /srv/homarr/docker-compose.yml 
```

Paste the following:

```yml
 ---
version: '3'
#---------------------------------------------------------------------#
#                Homarr -  A homepage for your server.                #
#---------------------------------------------------------------------#
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

--------------------

## Issues and solutions

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

</p>
</details>

--------------------

## Reference tables

<details><summary>Click to expand</summary>
<p>

### Approximating power consumption

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

[^3]: Inferred from Dr. Helmut Neukirchen's [power consumption test](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/) of the J4105, as it has the same TDP as the J5040. I also subtracted 3 W from the authors measurements which is the estimated power consumption of a 8GB stick of DDR4 RAM.

[^4]: [HardwareInfo low-load PSU test](https://web.archive.org/web/20130812130505/http://uk.hardware.info:80/reviews/4683/3/45-psus-tested-at-very-low-loads-which-one-is-the-most-efficient-225-watt-test). Inferred from the 22.5 W test of the _be quiet! Pure Power L8 300 W_.

</p>
</details>

--------------------

## License and usage

This project was created to document the thoughts and implementations behind my home server. Any resource i link to, cite or otherwise refer to are subject to their respective license, any image used is my own and are subject to All Rights Reserved. Everything else in this project is licensed under the terms of the [MIT license](https://mit-license.org/).

**[Back to top](#)**