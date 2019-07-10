#!/bin/bash
cd /app/duckdns
crontab -l | { cat; echo "*/$DUCKDNS_INTERVAL * * * * ~/duckdns/duck.sh >/dev/null 2>&1"; } | crontab -
./duck.sh
tail -F $LOG_DIR/duck.log