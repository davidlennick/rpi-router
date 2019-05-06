#!/bin/bash

crontab -e
echo '*/15 * * * * /app/noipupdater.sh -c /app/noip_conf' >> /etc/crontab

cd /app
./configgen.sh
./noipupdater.sh -c ./noip_conf 
tail -F ${LOG_DIR}/noip.log