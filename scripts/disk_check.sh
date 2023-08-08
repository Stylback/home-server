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
