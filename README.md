# Server-Journey
A collection of thoughts and notes as I build my home server.

If you find anything useful, feel free to use it in your own project!

--------------------

## The overall idea
My home server will be a budget-friendly, low maintance system running Ubuntu Server 22.04 LTS with Docker containers.

I will be using my server for cloud storage, file synchronisation and media streaming. For a full list of planned services, [click here](#services).

## Hardware
A balance must be struck between price, performance, expandability and power draw. Thankfully, there are plenty of hardware options to choose from and I will be able to make a system that's tailored to my specific needs.

| Component type | Model name | Price (SEK*) |
| :--- | :--- | ---: |
| CPU / Motherboard | [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013)| 1300 |
| Case | [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html)| 400 |
| RAM | [Corsair Venegance 2400 MHz 8 GB x 2](https://www.corsair.com/us/en/Categories/Products/Memory/VENGEANCE-LPX/p/CMK8GX4M1A2400C16)| 500 |
| Power supply | [be quiet! SYSTEM POWER B9 (_300 W_)](https://www.bequiet.com/en/powersupply/1285) | 400 |
| Storage | [Crucial MX500 (_250 GB + 2 TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd) | 2200 |
| Total |  | 4800 |

[_*10 SEK = ~1 USD_ ](https://www.xe.com/currencyconverter/convert/?Amount=10&From=SEK&To=USD)

### CPU / Motherboard
As I don't expect to be using resource-heavy services such as multiple desktop VM:s, 4K-encoding or multi-user streaming I've settled for an [intel Celeron J4105](https://www.intel.com/content/www/us/en/products/sku/128989/). Despite being launched at the end of 2017 it has a set of very useful features for my use case:

- 12 execution units
- Integrated Graphics
- Intel Quick Sync Video support
- 10 W (!) TDP

The J-series is only available in "CPU-onboard"-motherboards. I've opted for a [Biostar J4105NHU](https://www.biostar-usa.com/app/en-us/mb/introduction.php?S_ID=1013) due to its low cost, but you might consider the [ASRock ITX-J4105](https://www.asrock.com/mb/Intel/J4105-ITX/index.us.asp) if you want more SATA III-connection.

### Power supply (PSU)
Ideally, the server will be running 24/7, 365 days a year. As such, PSU efficiency is important to keep upkeep-cost down. __A power supply is at its most efficient at 50% of maximum rated load__, this means a 500 W PSU rated at 480 W max load will be at its most efficient when it provides 240 W of power.

__What is the efficiency at 50% load?__ That is determined by the [80+ Rating](https://en.wikipedia.org/wiki/80_Plus). A 80+ White will be 80-85% efficient at 50% load while a 80+ Titanium will be 94-96% efficient.

After some "back of the napkin calculations" I've estimated my system to draw between 5-25 W. As such my ideal PSU would be a power-brick style 50-100 W PSU. I've had no luck finding a reliable model and have instead opted for a be quiet!'s [SYSTEM POWER B9](https://www.bequiet.com/en/powersupply/1285). At 300 W, It offers a better low-load efficiency than its 450-500 W counterparts while still offering some head-room if I were to upgrade my system.

### Case
I wanted something cheap and discreet with some room for expandability. The [Kolink Satellite](https://kolink.eu/Home/case-1/mini-itx-2/satellite.html) fits right in.

### RAM
As stated on both intel's, Biostar's and ASRock's website: The J4105 officially only supports 8 GB of RAM.
However, some reddit users report being able to use [16](https://libreddit.dcs0.hu/r/selfhosted/comments/tyshg3/what_are_you_hosting_your_servers_on/) and even [32 GB](https://libreddit.dcs0.hu/r/homelab/comments/flqcs6/asrock_j4105itx_32gb_success/) of RAM with varying results.

I've opted for two sticks of [Corsair Venegance 2400 MHz 8 GB](https://www.corsair.com/us/en/Categories/Products/Memory/VENGEANCE-LPX/p/CMK8GX4M1A2400C16). I will double-check compatability pre-setup to ensure smooth operation.

### Storage

[Crucial MX500 (_250 GB + 2 TB_)](https://www.crucial.com/products/ssd/crucial-mx500-ssd)

--------------------

## Services

### High priority (_Services I need to provide core functionality_)

| Service name | Service type | Note |
| :--- | :--- | :--- |
| [NGINX manager](https://nginxproxymanager.com/) | Reverse-proxy manager with SSL | Will probably be using in conjunction with a domain-name |
| [Nextcloud](https://nextcloud.com/) | Cloud storage, file sync and more |  |
| [Jellyfin](https://jellyfin.org/) | Media streaming |  |

### Low priority (_Services I might implement if there is enough headroom_)

| Service name | Service type | Note |
| :--- | :--- | :--- |
| [Static Web Server](https://sws.joseluisq.net/) | Static website server | Looks promising, will do more research before commiting. |
| [Kopia](https://kopia.io/) | Backup solution | Versatile, but will do more research before commiting. |

**[Back to the top](#)**

--------------------
## Text templates in Markdown format

This is normal text

_This is italics_

__This is bold__

[This is a Hyperlink](https://en.wikipedia.org/wiki/Hyperlink)

[This is a chapter link](#server-journey)

`This is a code box`

> This is a caption

| Col 1 | Col 2 | Col 3 | Col 4 |
| --- | :---: | ---: | :--- |
| Normal| Centered | right-aligned | left-aligned |
| []() |  |  |

# This is a first-level header

## This is a second-level header

### This is a third-level header

--------------------