#!/bin/bash

CURR_DATE=$(date +%Y-%m)
DB_URL="https://download.db-ip.com/free/dbip-country-lite-"${CURR_DATE}".mmdb.gz"
DB_DIR="/docker/goaccess/config"

cd ${DB_DIR} && wget ${DB_URL} && gzip -d *.mmdb.gz && mv *.mmdb dbip-country-lite.mmdb