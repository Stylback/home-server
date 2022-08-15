# Server-Journey
A collection of thoughts and notes as I build my home server.

If you find anything useful, feel free to use it in your own project!

--------------------

## The overall idea
A budget-friendly, low maintance system running Ubuntu Server 22.04 LTS with Docker containers. Initially it will be used for cloud storage, file synchronisation and media streaming. Later on I hope to expand it to serve a static web page.

## Hardware

| Component type | Model name | Price (SEK*) |
| :--- | :--- | ---: |
| [CPU / Motherboard](#cpu--motherboard)| [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013)| 1320 |
| [Power supply](#power-supply-psu) | [be quiet! SYSTEM POWER B9 (_300 W_)](https://www.bequiet.com/en/powersupply/1285) | 440 |
| [Case](#case) | [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html)| 380 |
| [RAM](#ram) | [Corsair Venegance 2400 MHz 8 GB x 2](https://www.corsair.com/us/en/Categories/Products/Memory/VENGEANCE-LPX/p/CMK8GX4M1A2400C16)| 500 |
| [Storage](#storage) | [Crucial MX500 (_250 GB + 2 TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 2180 |
| __Total:__ |  | __4820__ |

[_*10 SEK = ~1 USD_ ](https://www.xe.com/currencyconverter/convert/?Amount=10&From=SEK&To=USD)

### CPU / Motherboard
As I don't expect to be using resource-heavy services such as multiple desktop VM:s, 4K-encoding or multi-user streaming I've settled for an [intel Celeron J4105](https://www.intel.com/content/www/us/en/products/sku/128989/). It has some useful features for my use case, including:

- 12 execution units for parallel processing
- Integrated Graphics for media and display capability
- Intel Quick Sync support for video encoding
- 10 W TDP (_average power dissipation, a shorthand way to estimate power consumption_)

The J-series is only available in "CPU-onboard"-motherboards. I've opted for a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) due to its low cost, but you might consider the [ASRock ITX-J4105](https://www.asrock.com/mb/Intel/J4105-ITX/index.us.asp) if you want more SATA III-connectors.

### Power supply (PSU)
Ideally, the server will be running 24/7, 365 days a year. As such, high efficiency is important to keep upkeep-cost down. __A power supply is at its most efficient at 50% of maximum rated load__, that means a PSU rated at 500 W max load will be at its most efficient when it provides 250 W of power.

__What is the efficiency at 50% load?__ That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A 80+ White will be 80-85% efficient at 50% load while a 80+ Titanium will be 94-96% efficient.

After some [back of the napkin calculations](#approximating-power-draw) I've estimated my system to draw between 10 to 23 W. As such my ideal PSU would be a power-brick style 50-100 W PSU. I've had no luck finding such a model with the right mix of power-cables (_24-pin, 4-pin and SATA_) and have instead opted for a [be quiet! SYSTEM POWER B9](https://www.bequiet.com/en/powersupply/1285). Besides having all the cables I need, at 300 W it offers a better low-load efficiency than a 450-500 W model while still providing some head-room for upgrades.

### Case
I wanted something cheap and discreet with some room for expandability. The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) ticked all my boxes and also included a 120 mm rear-mounted fan.

### RAM
As stated on intel's, Biostar's and ASRock's websites, the J4105 _officially_ supports up to 8 GB of RAM.
However, some reddit users report being able to use [16](https://libreddit.dcs0.hu/r/Hardware_for_Linux/comments/scp0p4/newest_desktop_of_the_day_with_bsd_biostar/) and even [32 GB](https://libreddit.dcs0.hu/r/homelab/comments/flqcs6/asrock_j4105itx_32gb_success/) with varying results.

I decided to take a gamble with two sticks of [Corsair Venegance 2400 MHz 8 GB](https://www.corsair.com/us/en/Categories/Products/Memory/VENGEANCE-LPX/p/CMK8GX4M1A2400C16) for a total of 16 GB of RAM.

### Storage
Spinning hard-disk drives (HDD) are popular in home servers and NAS due to their high storage capacity and low price. However, they have reduced speeds and increased power draw compared to solid-state drives (SSD). Their moving parts also add noise and a [significant](https://en.wikipedia.org/wiki/Head_crash) point of failure.

I opted for two [Crucial MX500 SSD's](https://www.crucial.com/products/ssd/crucial-mx500-ssd) (_250 GB bootdrive + 2 TB storage drive_) as they provide a good balance between price and performance. They also support _Integrated Power Loss Immunity_ which aims to prevent data loss in case of a power outage.

--------------------

## Assembly
| Image | Note |
|:---|:---|
| ![inside of the case](https://github.com/Stylback/server-journey/blob/main/media/inside.jpg?raw=true) | The process of assembling the system was relatively painless. The case can be disassembled for easy access to the motherboard fittings and has plenty of room for cable managment without the presence of a GPU. |
| ![power-extender cable](https://github.com/Stylback/server-journey/blob/main/media/cable_orientation.jpg?raw=true) | The only gripe I had with the case was the power-extender. It's aligned in such a way that the cable has to be forcefully twisted to slot into my specific PSU. I tried to screw the end out and flipping it 180°, allowing the cable to rest naturally on the case floor. It was however not possible to screw it in that way due to the shape of the cutout. |
| ![rear view](https://github.com/Stylback/server-journey/blob/main/media/back.jpg?raw=true) | Rear-view and IO. |
| ![assembled case](https://github.com/Stylback/server-journey/blob/main/media/outside.jpg?raw=true) | Assembled system. |

### Memory test

Before installing the operating system I wanted to ensure that my RAM modules would not cause any system instability.

MemTest86 is an industry staple in this regard. It has a multitude of tests designed to identify RAM stability under extreme conditions. If there is any conflict between the modules and the Biostar J4105NHU, it will be obvious in the result.

I made a bootable USB following their [instructions](https://www.memtest86.com/tech_creating-linux-mac.html) and ran the standard configuration (13 tests, 4 passes), below are the results.

| Image | Note |
|:---|:---|
| ![Ram modules detected by MemTest86](https://github.com/Stylback/server-journey/blob/main/media/memtest86_ram.bmp?raw=true) | Both sticks of RAM was detected. |
| ![Test completion screen](https://github.com/Stylback/server-journey/blob/main/media/memtest86_pass.jpg?raw=true) | The sticks passed with flying colors. The test completed in 5 hours and 20 minutes with 0 errors, I was pleasantly surprised to see that the CPU was able to hold its maximum clockspeed of 1.5 GHz throughout the test without going over 75 °C. |

--------------------

## Installing the OS

After confirming hardware stability I installed [Ubuntu Server 22.04 LTS](https://ubuntu.com/download/server) using a bootable USB-drive created beforehand. It was a pain-free process thanks to extensive [documentation](https://ubuntu.com/server/docs). The system was installed on the 250 GB SSD while the 2 TB SSD was left for data storage.

I also encrypted the drives with LUKS for an added layer of security.

## Setting up OpenSSH

### Part 1: Prerequisite and basic access

To be able to SSH from one a client to a server:
- There must be a traversable network connection between them and
- They both need to have a SSH service installed

OpenSSH usually comes shipped by default on desktop Linux distributions, if for some reason you do not have the client you can install it by running `sudo apt install openssh-client`.

On the server we install it using `sudo apt install openssh-server`. This was however not necessary in my case as the Ubuntu installer provided me with the option during initial installation.

From the server, run `ip a` to get information about your network connections and take note of current IPs. As I'm on the same local network as my server I wrote down the local IP of the server before continuing.

On the client, run `ssh username@server-ip`, where _username_ is the username on the server and _server-ip_ is the IP jotted down earlier.

The terminal will prompt for a password and connect.

### Part 2: Create a Hostname alias

We don't want to remember username@server-ip so instead we are creating an alias, this will allow us to access the server by just running `ssh alias`.

On the client, run `cd ~/.ssh` and then `touch config` to make a SSH configuration file.
Edit the file by running `nano config`. Write the following, replacing _alias_, _server-ip_ and _username_ with relevant information:

```
Host alias
  Hostname server-ip
  Port 22
  User username
```

__NOTE__: The spaces before Hostname, Port and User are required!

Save and exit, you can now connect to your server by running `ssh _alias_`.

### Part 3: Generating and using SSH-keys

On the client, run `ssh-keygen -t ed25519 -C "_comment_"`, replacing _comment_ with some information to help you remember what the key is used for.

You will be prompted for a name, you can chose a custom name or accept the default `id_ed2559` by pressing enter. You will also be prompted for a passphrase, enter a passphrase (_recommended!_) or press enter.

This will have created a keypair, one public key names _keyname.pub_ and one private key just named _keyname_. You can verify this by running `cd ~/.ssh` followed by `ls -la`.

Now lets copy the __public__ key to our server. On the client, run `ssh-copy-id -i ~/.ssh/keyname.pub alias`, replacing the _keyname_ and _alias_ with whatever you chose earlier.

If you chose a passphrase for the key you will be prompted for it now.

Verify that the key works by connecting to the server with `ssh alias`. If the keys have been exchanged correctly you should not be prompted for a password.

### Part 4: Hardening

Now that we can connect to the server using our SSH-key, we will make some security enhancement to prevent brute-forcing and root access.

On your client, connect to the server and run `sudo nano /etc/ssh/sshd_config`.
Search after the line with `PermitRootLogin`, uncomment it and change it to `PermitRootLogin no`. Then search for `PasswordAuthentication`, uncomment and change it to `PasswordAuthentication no`. Finally, find the line with Port, uncomment and change it from 22 to another port of your choice (_remember to change the port number for your alias aswell!_).

Save and exit.

Restart the ssh service by running `sudo systemctl restart ssh`.

The server should now be accessible only by SSH-key and no user that access it by SSH can gain Root privileges.

## Installing Docker

[Docker](https://www.docker.com/)

## Setting up services

### NGINX Manager

[NGINX manager](https://nginxproxymanager.com/)

### Flame

[Flame](https://github.com/pawelmalak/flame)

### Uptime Kuma

[Uptime Kuma](https://github.com/louislam/uptime-kuma)

### Nextcloud

[Nextcloud](https://nextcloud.com/)

### Jellyfin

[Jellyfin](https://jellyfin.org/) 

### Arr suite

Lidarr/Sonarr/Radarr/Prowlarr

[Wiki](https://wiki.servarr.com/docker-guide)

### Static Web Server

[Static Web Server](https://sws.joseluisq.net/)

--------------------

## Security

### Disaster prevention

#### Data redundancy

### Remote access

#### Allowing authorized access

#### Disallowing unauthorized access

Fail2Ban

## Approximating power draw

| Component | Power draw (_idle_) [W] | Power draw (_active_) [W] |
| :--- | ---: | ---: |
| Crucial MX500 1 TB | 0.10[^1] | 0.54[^1] |
| Crucial MX500 250 GB | 0.08[^1] | 0.54[^1] |
| Corsair Venegance 8 GB x2 | 6.00[^2] | 6.00[^2] |
| Biostar J4105NHU | 0.70[^3] | 9.00[^3] |
| Total (_100% efficiency_): | 6.88 | 16.08 |
| __Total (_70% efficiency_[^4]):__ | __9.82__ | __22.97__ |

If we assume an average 2 hours of full system utilization per day, with the rest being equivalent to an idle power state, we can approximate the daily power consumption to:
`(22.97*2 + 9.82*22)/1000 = 0.262 KWh/Day`

Or a yearly power consumption of:
`0.262*365= 95.6 KWh/Year`

Which is almost exactly the same as the average [coffee maker](https://energyusecalculator.com/electricity_coffeemaker.htm).

[^1]: [AnandTech MX500 review](https://www.anandtech.com/show/12263/the-crucial-mx500-500gb-review/8). Power draw for the 250 GB model is inferred from the 500 GB model.

[^2]: [TomsHardware i7-5960x review](https://www.tomshardware.com/reviews/intel-core-i7-5960x-haswell-e-cpu,3918-13.html). This number seems to agree with Crucials [own assessment](https://www.crucial.com/support/articles-faq-memory/how-much-power-does-memory-use).

[^3]: [Dr. Helmut Neukirchen power consumption test](https://uni.hi.is/helmut/2021/06/07/power-consumption-of-raspberry-pi-4-versus-intel-j4105-system/). Inferred by subtracting 3 W from authors measurements (_estimated power consumption of a 8 GB stick of DDR4 RAM_).

[^4]: [HardwareInfo low-load PSU test](https://web.archive.org/web/20130812130505/http://uk.hardware.info:80/reviews/4683/3/45-psus-tested-at-very-low-loads-which-one-is-the-most-efficient-225-watt-test). Inferred from the 22.5 W test of the _be quiet! Pure Power L8 300 W_.

**[Back to the top](#)**