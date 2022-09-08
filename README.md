# Home Server

A collection of thoughts and notes as I build my home server. If you find anything useful, feel free to use it in your own project.

--------------------

## Table of contents

<details><summary>Click to reveal</summary>
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
  - [Installing Docker](#installing-docker)
  - [Setting up remote access](#setting-up-remote-access)
    - [Part 1: Get a custom domain](#part-1-get-a-custom-domain)
    - [Part 2: Configure Dynamic DNS](#part-2-configure-dynamic-dns)
    - [Part 3: Configure NGINX Proxy manager](#part-3-configure-nginx-proxy-manager)
    - [Part 4: Set up remote SSH](#part-4-set-up-remote-ssh)
    - [Part 5: Hardening](#part-5-hardening)
  - [Implementing services](#implementing-services)
    - [Homarr](#homarr)
  - [Issues and solutions](#issues-and-solutions)
    - [Bricked motherboard](#bricked-motherboard)
  - [Reference tables](#reference-tables)
    - [Approximating power draw](#approximating-power-draw)

</p>
</details>

--------------------

## Hardware choices

### CPU / Motherboard

<details><summary>Click to reveal</summary>
<p>

As I don't expect to be using resource-heavy services such as multiple desktop VM:s, 4K video encoding or multi-user streaming I've settled for an [intel Pentium J5040](https://ark.intel.com/content/www/us/en/ark/products/197304/intel-pentium-silver-j5040-processor-4m-cache-up-to-3-20-ghz.html). It has some useful features for my use case, including:

- 18 execution units for parallel processing
- Integrated Graphics for media and display capability
- Intel Quick Sync for extensive video encoding/decoding support
- 10W TDP (_Thermal Design Power, a shorthand way of estimating power consumption_)

The J-series is only available as motherboard embedded CPU:s. I've opted for an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp) due to its rich feature-set, but you might consider the [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) as long as you're OK with being limited to 8GB of ram (_or risk bricking your motherboard,_ [_see here for more info_](#issues-and-solutions)).

</p>
</details>

### Power supply (PSU)

<details><summary>Click to reveal</summary>
<p>

Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep power consumption down. __A power supply is at its most efficient at 50% of maximum rated load__, that means a PSU rated at 500W max load will be at its most efficient when it provides 250W of power.

__What is the efficiency at 50% load?__ That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A 80+ White will be 80-85% efficient at 50% load while a 80+ Titanium will be 94-96% efficient.

After some [back of the napkin calculations](#reference-tables) I've estimated my system to draw between 10 to 23W. As such my ideal PSU would be a power-brick style 50-100W PICO-PSU. I've had no luck finding such a model with the right mix of power-cables (_24-pin and SATA_) and have instead opted for a [be quiet! SYSTEM POWER B9](https://www.bequiet.com/en/powersupply/1285). Besides having all the cables I need, at 300W it offers a better low-load efficiency than a 450-500W model while still providing some head-room for upgrades.

</p>
</details>

### Case

<details><summary>Click to reveal</summary>
<p>

The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes; discreet and affordable with some room for expandability. It also included a 120 mm rear-mounted fan, I might however replace it with a Noctua [NF-A12X25 ULN](https://noctua.at/en/products/fan/nf-a12x25-uln/specification) down the line to reduce noise.

</p>
</details>

### RAM

<details><summary>Click to reveal</summary>
<p>

As stated on intel's and ASRock's websites; the J5040 _officially_ supports up to 8GB of RAM.
However, some reddit users report being able to use 16 or even 32GB with [varying results](https://libreddit.dcs0.hu/r/ASRock/comments/k8hpww/how_can_a_motherboard_support_more_ram_than_the/).

I decided to take a gamble with a [G.SKILL Ripjaws SO-DIMM 16GB, 2400 MHz Kit](https://www.gskill.com/product/2/197/1540865326/F4-2400C16D-16GRS).

</p>
</details>

### Storage

<details><summary>Click to reveal</summary>
<p>

Spinning hard-disk drives (HDD) are popular in home servers and NAS due to their high storage capacity and low price. However, they have reduced speeds and increased power draw compared to solid-state drives (SSD). Their moving parts also add noise and a significant [point of failure](https://en.wikipedia.org/wiki/Head_crash).

I opted for two [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (_250GB bootdrive + 2TB storage drive_) as they provide a good balance between price and performance. They also support _Integrated Power Loss Immunity_ which aims to prevent data loss in case of a power outage.

</p>
</details>

### Final build costs

<details><summary>Click to reveal</summary>
<p>

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

### Assembly
<details><summary>Click to reveal</summary>
<p>

| Image | Note |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/home-server/blob/main/media/inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access to the motherboard fittings and has plenty of room for cable managment without the presence of a GPU. |
| ![power-extender cable](https://github.com/Stylback/home-server/blob/main/media/psu_cable.jpg?raw=true) | The only gripe I had with the case was the power-extender. It's aligned in such a way that the cable has to be forcefully twisted to slot into my specific PSU. I tried to screw the end out and flipping it 180°, allowing the cable to rest naturally on the case floor. It was however not possible to screw it in that way due to the shape of the cutout. |
| ![rear view](https://github.com/Stylback/home-server/blob/main/media/back.jpg?raw=true) | Rear-view and IO. |
| ![assembled case](https://github.com/Stylback/home-server/blob/main/media/outside.jpg?raw=true) | Assembled system. |

</p>
</details>

### Testing RAM stability

<details><summary>Click to reveal</summary>
<p>

Before installing the operating system I wanted to ensure that my RAM modules would not cause any system instability. MemTest86 is an industry staple in this regard, it has a multitude of tests designed to coax RAM instability under extreme conditions.

I made a bootable USB following their [instructions](https://www.memtest86.com/tech_creating-linux-mac.html) and ran the standard configuration (_13 tests, 4 passes_).

| Image | Note |
|:---|:---|
| ![Ram modules detected by MemTest86](https://github.com/Stylback/home-server/blob/main/media/memtest86_ram.bmp?raw=true) | Both sticks of RAM was detected by MemTest86. |
| ![Test completion screen](https://github.com/Stylback/home-server/blob/main/media/memtest86_pass.jpg?raw=true) | The sticks passed with 0 errors, completing the tests in 4 hours and 37 minutes. |

</p>
</details>

### BIOS tweaks

<details><summary>Click to reveal</summary>
<p>

The ASRock J5040-ITX comes with an extensive list of BIOS settings, so far I've made the following changes:

- `SATA Aggressive Link Power Management -> Enabled`, reduces power consumption while SATA devices are idle.
- `Onboard HD Audio -> Disabled`, as I won't use any audio input/output.
- `Deep S5 -> Auto`, reduces power consumption on a turned off system.
- `Restore on AC/Power -> Loss Power On`, restarts the system after a power failure.

</p>
</details>

### Installing the OS

<details><summary>Click to reveal</summary>
<p>

After confirming RAM stability I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. It was a pain-free process thanks to extensive [documentation](https://ubuntu.com/server/docs).

I assigned the 250GB drive as boot drive, consuming about half of its available storage. The rest was partitioned and mounted to `/home` for any application or service that needs to store information there. As the 2TB drive is going to be used as the primary storage unit it was partioned and mounted at `/srv`.


</p>
</details>

--------------------

## Setting up SSH

### Part 1: Prerequisite and basic access

<details><summary>Click to reveal</summary>
<p>

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

</p>
</details>

### Part 2: Create a Hostname alias

<details><summary>Click to reveal</summary>
<p>

We don't want to have to remember `username@server-ip`, so instead we will create an alias which will allow us to access the server by just running `ssh alias`. On the client, run:

```sh
touch ~/.ssh/config
```

Which will make a SSH configuration file. Edit the file by running:
```sh
sudo nano ~/.ssh/config
```

Write the following, replacing `alias`, `server-ip` and `username` with relevant information:

```sh
Host alias
  Hostname server-ip
  Port 22
  User username
```

__NOTE__: The whitespace before `Hostname`, `Port` and `User` are __required__!

Save and exit, you should now be able to connect to your server by running `ssh alias`.

</p>
</details>

### Part 3: Generate and use SSH-keys

<details><summary>Click to reveal</summary>
<p>

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

Replacing _keyname_ and _alias_ with whatever you chose earlier. If you chose a passphrase for the key you will be prompted for it now.

Verify that the key works by connecting to the server with `ssh alias`. If the keys have been exchanged correctly you should __not__ be prompted for a password.

__NOTE:__ Always keep your private key secure, __never__ share it with anyone! If you have reason to believe that your private key has been compromised, generate a new keypair and delete the old one from the servers `authorized_keys` file.

</p>
</details>

### Part 4: Hardening

<details><summary>Click to reveal</summary>
<p>

Now that we can connect to the server using our SSH-key, we will make some security enhancement to prevent brute-forcing and root access.

On your client, connect to the server and run:

```sh
sudo nano /etc/ssh/sshd_config
```

Search after the line with `PermitRootLogin`, uncomment and change it to `PermitRootLogin no`. Then search for `PasswordAuthentication`, uncomment and change it to `PasswordAuthentication no`. 

Finally, find the line with `Port 22`, uncomment and change it from 22 to [another](https://serverfault.com/questions/509294/what-are-valid-ports-to-use-for-ssh) port of your choice. Save and exit. Remember to change the port number for your alias to reflect your choice.

__NOTE:__ Do __NOT__ close the terminal window! Until we know everything works, ensure that you have atleast one other terminal instance running that is connected to the server. If something was entered incorrectly in the configuration file you might lose access to the server!

Restart the SSH service by running:

```sh
sudo systemctl restart ssh
```

Verify that everything works by first trying to connect to the server with `ssh alias`, then try to access it using `ssh root@server-ip` (_the server should deny this attempt_).

If everything worked correctly, the server should now be accessible only by your SSH-key and no user that access it by SSH can gain Root privileges. As we changed the port number from the default we gain some resistance against automated attacks, but a persistent actor could still find the correct port after some trial and error.

</p>
</details>

--------------------

## Installing Docker

<details><summary>Click to reveal</summary>
<p>

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

Finally, run the following to enable Docker to run on boot:

```sh
sudo systemctl enable docker
```

For easy overview and management of our docker containers we can install [ctop](https://github.com/bcicen/ctop). To do it, run the commands below:

```sh
sudo apt-get install ca-certificates curl gnupg lsb-release
```

```sh
echo "deb [signed-by=/usr/share/keyrings/azlux-archive-keyring.gpg] http://packages.azlux.fr/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/azlux.list
    sudo wget -O /usr/share/keyrings/azlux-archive-keyring.gpg  https://azlux.fr/repo.gpg
```

```sh
sudo apt-get update
```

```sh
sudo apt-get install docker-ctop
```

Launch it by simply running:

```sh
sudo ctop
```

</p>
</details>

--------------------

## Setting up remote access

### Part 1: Get a custom domain

<details><summary>Click to reveal</summary>
<p>

Up until this point we have only been able to access our server while on the same local network. To be able to access it remotely we have the following choices:

- Use a VPN tunnel access our local network remotely
- Connect to our public facing IP-address and access our server through port-forwarding
- Connect to a custom domain and access our server through port-forwarding

A custom domain makes it very easy to access multiple services as we can use subdomains (_blog.domain.tld, server.domain.tld etc._), it also makes the process of using Dynamic DNS easier.

To get a custom domain you will ned to purchase it from a domain registrar. There are many domain registrars but I've gone with [Njalla](https://njal.la/) due to their great track record, amazing privacy policy and [DMCA responses](https://njal.la/blog/dhlsucks/). Their pricing is somewhat higher than their competitors and you might consider something like [namecheap](https://www.namecheap.com/) if you're looking for a cheaper alternative.

</p>
</details>

### Part 2: Configure Dynamic DNS

<details><summary>Click to reveal</summary>
<p>

We want our domain to point to our routers IP-address, this address (_called a dynamic IP-address_) will change over and we will need to take this into account. To solve this we will utilize [ddns-updater](https://github.com/qdm12/ddns-updater), which is a dynamic DNS service that will regularly check our IP-address and convey any changes to our Njalla.

To get started, log into Njalla (_or your registrar of choice_) and add a new DNS record to your domain. This new record should be __DYNAMIC__ (_not A or AAAA_) and be named __*__, this will create a dynamic __wildcard__ domain. Njalla will provide you with a key that we need to update the IP-address of the DNS record, if you're using another registrar they might have other ways of conveying changes.

To get started with ddns-updater we will pull it from docker using:

```sh
sudo docker pull qmcgaw/ddns-updater
```

We will then create a directory in `/srv` that will serve as our working folder:

```sh
sudo mkdir /srv/ddns-updater
```

And a directory that will serve as our configuration folder:

```sh
sudo mkdir /srv/ddns-updater/data
```

We will then create a configuration file in our folder:

```sh
sudo touch /srv/ddns-updater/data/config.json
```

And configure it according to the official [documentation](https://github.com/qdm12/ddns-updater/blob/master/docs/njalla.md):

```sh
sudo nano /srv/ddns-updater/data/config.json
```

Paste the following, replacing domain, host and key with your own:
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
sudo touch /srv/ddns-updater/docker-compose.yml
```
Then we will configure it according to the [documentation](https://github.com/qdm12/ddns-updater/blob/master/docker-compose.yml):

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
sudo chown -R 1000 data
```

```sh
sudo chmod 700 data
```

```sh
sudo chmod 400 data/config.json
```

You should now be able to start ddns-updater by running:

```sh
sudo docker compose up -d
```

> Didn't start? Check that you're CD:d into `/srv/ddns-updater` and try again.

Check that everything is working by typing `[local-IP]:8000` in your browser.

![Screenshot of DDNS-updater web page](https://github.com/Stylback/home-server/blob/main/media/ddns_screenshot.png?raw=true)

> Didn't work? It's probably a permission error, double-check the directory/file permissions with `ls -la` and restart the service.

</p>
</details>

### Part 3: Configure NGINX Proxy manager

<details><summary>Click to reveal</summary>
<p>

Start with creating a directory in `/srv`:

```sh
sudo mkdir /srv/npm
```

Now lets create a docker compose file:

```sh
sudo touch /srv/npm/docker-compose.yml
```
Lets configure it according to the [documentation](https://nginxproxymanager.com/setup/), open it with:

```sh
sudo nano /srv/npm/docker-compose.yml
```

And paste the following:

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

Now that we know that it works we will secure it against unwanted snooping using a SSL-certificate. Navigate to the SSL Certificates tab and add a new Let's Encrypt certificate with `Domain Names: nginx.domain.tld`. Test that the server is reachable by clicking on `Test Server Reachability`, agree to the privacy policy and save.

Now go back to your Proxy Host for `nginx.domain.tld` and click Edit, go to to SSL and add your certificate from the drop-down list. For added security, enable __Force SSL__ and __HSTS__. Finally ensure that everything is working as intended by visiting `nginx.domain.tld` again.

</p>
</details>

### Part 4: Set up remote SSH

<details><summary>Click to reveal</summary>
<p>

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

Save and exit. Find the container name of NGINX with:

```sh
sudo docker ps
```

Now lets restart it by running:

```sh
sudo docker stop [container]
```

```sh
sudo docker compose up -d
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

Find, uncomment and change the following:

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

</p>
</details>

### Part 5: Hardening

<details><summary>Click to reveal</summary>
<p>

Adding [Fail2Ban](https://github.com/fail2ban/fail2ban) or perhaps [CrowdSec](https://www.crowdsec.net/). Will mention more about credentials and accessability lists in NGINX Proxy Manager.

</p>
</details>

--------------------

## Implementing services

<details><summary>Click to reveal</summary>
<p>

Current ideas: 
- handle Docker image updates with [Watchtower](https://containrrr.dev/watchtower/)
- a static webpage on `blog.domain.tld` using [Static Web Server](https://sws.joseluisq.net/)
- a landing page for managing all services with [Flame](https://github.com/pawelmalak/flame)
- monitor uptime with [Uptime Kuma](https://github.com/louislam/uptime-kuma)
- a data backup solution! Rsync, Restic and Kopia seems popular
- media streaming with [Jellyfin](https://jellyfin.org/)

</p>
</details>

### Homarr

<details><summary>Click to reveal</summary>
<p>

[Homarr](https://homarr.vercel.app/docs/about) is an easy to use dashboard for our services. First, lets create a `docker-compose.yml` and a directory to house it:

```sh
sudo mkdir /srv/homarr 
```

```sh
sudo touch /srv/homarr/docker-compose.yml 
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
cd /srv/homarr 
```

```sh
sudo docker compose up -d 
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

### Bricked motherboard

<details><summary>Click to reveal</summary>
<p>

> __TL;DR:__ Initially made the build with a Biostar J4105NHU, a BIOS-update broke RAM-support and trying to revert back to the previously known working version bricked it.

I initially used a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013), the motherboard shipped with BIOS-version __J41BW929.BSS__ and worked flawlessly with a pair of 8GB RAM-modules.

A couple of days go by and I shut the system down to do some cable-management, after which it refused to boot. I figured I messed something up with the cables and put everything back as it was, no luck.

I removed one of the RAM-modules and tried again, nothing.

Finally I popped the CMOS battery out, waited a bit and re-placed it. This seemed to have done the job as I was greeted with a login prompt. I shut it down and re-placed the other RAM-module, nothing happens.

I pop the CMOS again, boot with a single module and see the BIOS-version was updated to __J41BWB22.BSS__. Determined to regain the ability to use both modules I tried to flash the __J41BW929.BSS__ version using Biostars provided flashing tool. The tool reported a successfull flash but the process had in fact _bricked_ the motherboard.

Lesson learned, think thrice before manually flashing your BIOS. I have since replaced the board with an [ASRock J5040-ITX](https://www.asrock.com/mb/Intel/J5040-ITX/index.asp). I also had to replace my RAM-modules with SO-DIMM ones due to board incompatibility, all in all it made the build about 700 SEK more expensive.

</p>
</details>

## Reference tables

### Approximating power draw

<details><summary>Click to reveal</summary>
<p>

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

**[Back to top](#)**