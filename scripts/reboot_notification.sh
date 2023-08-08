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
